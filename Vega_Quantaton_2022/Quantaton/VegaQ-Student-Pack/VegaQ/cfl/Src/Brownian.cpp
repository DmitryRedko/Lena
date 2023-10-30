#include <cmath>
#include <algorithm>
#include <limits>
#include "cfl/Brownian.hpp"
#include "cfl/GaussRollback.hpp"
#include "cfl/Ind.hpp"
#include "cfl/Interp.hpp"

using namespace cfl;

namespace cflBrownian
{
  class Model : public cfl::IModel
  {
  public:
    Model(double dQuality, const GaussRollback &rRollback,
          const Ind &rInd, const Interp &rInterp)
        : m_uGaussRollback(rRollback),
          m_uInd(rInd), m_uInterp(rInterp), m_dQuality(dQuality){};

    Model(double dQuality, const GaussRollback &rRollback,
          const Ind &rInd, const Interp &rInterp,
          const std::vector<double> &rVar,
          const std::vector<double> &rEventTimes,
          double dInterval);

    const std::vector<double> &eventTimes() const
    {
      return m_uEventTimes;
    }

    unsigned numberOfStates() const
    {
      return 1;
    }

    unsigned numberOfNodes(unsigned iTime,
                           const std::vector<unsigned> &rDependence) const
    {
      PRECONDITION(rDependence.size() <= 1);
      if (rDependence.size() == 0)
      {
        return 1;
      }
      else
      {
        ASSERT(rDependence.front() == 0);
        return m_uSize[iTime];
      }
    }

    std::valarray<double> origin() const
    {
      return std::valarray<double>(0., 1);
    }

    Slice state(unsigned iTime, unsigned iState) const;

    void addDependence(Slice &rSlice,
                       const std::vector<unsigned> &rDependence) const;

    void rollback(Slice &rSlice, unsigned iTime) const;

    void indicator(Slice &rSlice, double dBarrier) const
    {
      m_uInd.indicator(rSlice.values(), dBarrier);
    }

    MultiFunction interpolate(const Slice &rSlice) const;

  private:
    GaussRollback m_uGaussRollback;
    Ind m_uInd;
    Interp m_uInterp;
    std::vector<double> m_uTotalVar, m_uEventTimes;
    double m_dH, m_dQuality;
    std::vector<unsigned> m_uSize;
  };

  /**
   * returns value y such that E(e^{X}\ind{X>y/2}) <= 1/(dQuality)^2
   * for a Gaussian RV X with mean 0 and variance dVar
   */
  double width(double dQuality, double dVar)
  {
    return 2 * (dVar + std::sqrt(dVar * (dVar + 4 * ::std::log(dQuality))));
  }
} // namespace cflBrownian

using namespace cflBrownian;

// CLASS cflBrownian::Model

cflBrownian::Model::Model(double dQuality, const GaussRollback &rRollback,
                          const Ind &rInd, const Interp &rInterp,
                          const std::vector<double> &rVar,
                          const std::vector<double> &rEventTimes,
                          double dInterval)
    : m_uGaussRollback(rRollback), m_uInd(rInd), m_uInterp(rInterp),
      m_uTotalVar(rVar.size()), m_uEventTimes(rEventTimes), m_uSize(rEventTimes.size())

{
  PRECONDITION(rEventTimes.size() == rVar.size());
  PRECONDITION(std::equal(m_uEventTimes.begin() + 1, m_uEventTimes.end(),
                          m_uEventTimes.begin(), std::greater<double>()));

  m_dQuality = std::max(dQuality, 1.);
  m_dH = 1. / m_dQuality;

  double dToday = rEventTimes.front();
  std::transform(rVar.begin(), rVar.end(), rEventTimes.begin(), m_uTotalVar.begin(),
                 [dToday](double dVar, double dTime)
                 {
                   ASSERT(dTime >= dToday);
                   return dVar * (dTime - dToday);
                 });

  ASSERT(std::equal(m_uTotalVar.begin() + 1, m_uTotalVar.end(), m_uTotalVar.begin(),
                    std::greater<double>()));

  std::transform(m_uTotalVar.begin(), m_uTotalVar.end(), m_uSize.begin(),
                 [dH = m_dH, dQ = m_dQuality, dInterval](double dVar)
                 {
                   double dW = width(dQ, dVar);
                   double dSize = std::max((dInterval + dW) / dH, 2.);
                   unsigned iLog2Size = std::ceil(std::log2(dSize));
                   unsigned iSize = std::pow(2, iLog2Size);
                   return iSize;
                 });

  POSTCONDITION(std::equal(m_uSize.begin() + 1, m_uSize.end(), m_uSize.begin(),
                           std::greater_equal<unsigned>()));
}

Slice cflBrownian::Model::state(unsigned iTime, unsigned iState) const
{

  PRECONDITION(iState == 0);

  std::vector<unsigned> uDependence(1, 0);

  unsigned iSize = m_uSize[iTime];
  std::valarray<double> uValues(iSize);
  uValues[0] = -m_dH * (iSize - 1) / 2.;
  std::transform(begin(uValues), end(uValues) - 1, begin(uValues) + 1,
                 [dH = m_dH](double dX)
                 { return dH + dX; });

  return Slice(*this, iTime, uDependence, uValues);
}

void cflBrownian::Model::addDependence(Slice &rSlice,
                                       const std::vector<unsigned> &rDependence) const
{
  PRECONDITION(rDependence.size() <= 1);
  if ((rSlice.dependence().size() == 0) && (rDependence.size() == 1))
  {
    ASSERT(rSlice.values().size() == 1);
    std::valarray<double> uValues(rSlice.values()[0], m_uSize[rSlice.timeIndex()]);
    rSlice.assign(rDependence, uValues);
  }
}

void cflBrownian::Model::rollback(Slice &rSlice, unsigned iTime) const
{
  PRECONDITION(rSlice.dependence().size() <= 1);
  PRECONDITION(&rSlice.model() == this);
  PRECONDITION(rSlice.timeIndex() >= iTime);

  double dVar = m_uTotalVar[rSlice.timeIndex()] - m_uTotalVar[iTime];
  ASSERT(dVar >= 0);
  std::valarray<double>  & rValues = rSlice.values();
  ASSERT(rValues.size() > 0);

  bool bRollback = (rSlice.timeIndex() > iTime) && (rValues.size() > 1) && (dVar > cfl::EPS);

  if (bRollback)
  {
    GaussRollback uRoll(m_uGaussRollback);
    uRoll.assign(rValues.size(), m_dH, dVar);
    uRoll.rollback(rValues);
  }

  unsigned iSize1 = numberOfNodes(iTime, rSlice.dependence());
  ASSERT(iSize1 <= rValues.size());
  if (iSize1 < rValues.size())
  {
    unsigned iI = (rValues.size() - iSize1) / 2;
    std::valarray<double> uT(rValues[std::slice(iI, iSize1, 1)]);
    rSlice.assign(iTime, rSlice.dependence(), uT);
  }
  else
  {
    rSlice.assign(iTime, rSlice.dependence(), rValues);
  }
}

MultiFunction cflBrownian::Model::interpolate(const Slice &rSlice) const
{
  Slice uState = state(rSlice.timeIndex(), 0);
  const std::valarray<double> &rArg = uState.values();
  const std::valarray<double> &rVal = rSlice.values();
  Function uF = m_uInterp.interpolate(std::begin(rArg), std::end(rArg),
                                      std::begin(rVal));
  return toMultiFunction(uF, 0, 1);
}

// constructor of model for Brownian motion

cfl::TBrownian cfl::brownian(double dQuality, const GaussRollback &rRollback,
                             const Ind &rInd, const Interp &rInterp)
{
  return [dQuality, rRollback, rInd, rInterp](const std::vector<double> &rVar, const std::vector<double> &rEventTimes, double dInterval)
  {
    return cfl::Model(new cflBrownian::Model(dQuality, rRollback, rInd, rInterp, rVar, rEventTimes, dInterval));
  };
}
