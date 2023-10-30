#include "prep1/prep1.hpp"
#include <cassert>
#include <cmath>
#include <numeric>
#include <algorithm>

using namespace std;

#define PRECONDITION assert
#define ASSERT assert
#define ASSERT assert

namespace vega
{
  const double EPS = 1E-10;

  double shape1(double dX)
  {
    PRECONDITION(dX >= 0);

    double dY = (dX > vega::EPS) ? (1 - std::exp(-dX)) / dX : (1. - dX / 2. + dX * dX / 6.);
    return dY;
  }

  double shape2(double dX)
  {
    PRECONDITION(dX >= 0);

    double dY = (dX > vega::EPS) ? (1 - std::exp(-dX) * (1. + dX)) / dX : (dX / 2. - dX * dX / 3.);
    return dY;
  }
}

std::function<double(double)>
vega::discountNelsonSiegel(double dC0, double dC1, double dC2,
                           double dLambda, double dInitialTime)
{
  PRECONDITION(dLambda >= 0);

  std::function<double(double)> uYield =
      yieldNelsonSiegel(dC0, dC1, dC2, dLambda, dInitialTime);

  return [uYield, dInitialTime](double dT)
  {
    PRECONDITION(dT >= dInitialTime);

    return exp(-uYield(dT) * (dT - dInitialTime));
  };
}

std::function<double(double)>
vega::discountYieldLinInterp(const std::vector<double> &rTimes,
                             const std::vector<double> &rDF,
                             double dR, double dInitialTime)
{
  PRECONDITION(rTimes.size() == rDF.size());
  PRECONDITION(rTimes.front() > dInitialTime);
  PRECONDITION(std::is_sorted(rTimes.begin(), rTimes.end(), std::less_equal<double>()));

  std::function<double(double, double)> uYield = yield(dInitialTime);

  return [rTimes, rDF, dR, dInitialTime, uYield](double dT)
  {
    PRECONDITION(dT >= dInitialTime);
    PRECONDITION(dT <= rTimes.back());

    unsigned iI = std::lower_bound(rTimes.begin(), rTimes.end(), dT) - rTimes.begin();
    double dX0 = (iI > 0) ? rTimes[iI - 1] : dInitialTime;
    double dX1 = rTimes[iI];
    double dW = (dT - dX0) / (dX1 - dX0);
    double dY0 = (iI > 0) ? uYield(dX0, rDF[iI - 1]) : dR;
    double dY1 = uYield(dX1, rDF[iI]);

    return exp(-(dY0 + dW * (dY1 - dY0)) * (dT - dInitialTime));
  };
};

std::function<double(double)>
vega::forwardCashFlow(const std::vector<double> &rPayments,
                      const std::vector<double> &rTimes,
                      const std::function<double(double)> &rDiscount)
{
  PRECONDITION(is_sorted(rTimes.begin(), rTimes.end(), std::less_equal<double>()));
  PRECONDITION(rPayments.size() == rTimes.size());

  return [rPayments, rTimes, rDiscount](double dT)
  {
    PRECONDITION(dT <= rTimes.back());

    unsigned iTime = std::upper_bound(rTimes.begin(), rTimes.end(), dT) - rTimes.begin();
    double dSum = 0.;
    dSum = std::inner_product(rPayments.begin() + iTime, rPayments.end(),
                              rTimes.begin() + iTime,
                              dSum, std::plus<double>(),
                              [rDiscount](double dP, double dT)
                              {
                                return dP * rDiscount(dT);
                              });
    double dF = dSum / rDiscount(dT);
    return dF;
  };
}

std::function<double(double)>
vega::forwardCouponBond(double dRate, double dPeriod, double dMaturity,
                        const std::function<double(double)> &rDiscount,
                        bool bClean)
{
  return [dRate, dPeriod, dMaturity, rDiscount, bClean](double dT)
  {
    double dPayTime = dMaturity;
    double dSum = 0;
    while (dPayTime > dT)
    {
      dSum += rDiscount(dPayTime);
      dPayTime -= dPeriod;
    }
    double dPayment = dRate * dPeriod;
    dSum *= dPayment;
    dSum += rDiscount(dMaturity);
    double dF = dSum / rDiscount(dT);
    if (bClean)
    {
      dF -= dRate * (dT - dPayTime);
    }
    return dF;
  };
}

std::function<double(double, double)>
vega::forwardFX(double dSpotFX)
{
  return [dSpotFX](double dDom, double dFor)
  {
    PRECONDITION(dDom > vega::EPS);

    return dSpotFX * dFor / dDom;
  };
}

std::function<double(double, double)>
vega::yield(double dInitialTime)
{
  return [dInitialTime](double dT, double dD)
  {
    PRECONDITION(dT > dInitialTime + vega::EPS);

    return -std::log(dD) / (dT - dInitialTime);
  };
}

std::function<double(double)>
vega::yield(const std::function<double(double)> &rDiscount,
            double dInitialTime)
{
  return [rDiscount, dInitialTime](double dT)
  {
    PRECONDITION(dT >= dInitialTime);
    if (dT < dInitialTime + vega::EPS)
    {
      return (1. - rDiscount(dInitialTime + vega::EPS)) / vega::EPS;
    }
    else
    {
      return -std::log(rDiscount(dT)) / (dT - dInitialTime);
    }
  };
}

std::function<double(double)>
vega::yieldNelsonSiegel(double dC0, double dC1, double dC2,
                        double dLambda, double dInitialTime)
{
  PRECONDITION(dLambda >= 0);

  return [dC0, dC1, dC2, dLambda, dInitialTime](double dT)
  {
    PRECONDITION(dT >= dInitialTime);

    double dX = dLambda * (dT - dInitialTime);
    double dY = dC0 + dC1 * shape1(dX) + dC2 * shape2(dX);
    return dY;
  };
}

std::function<double(double)>
vega::yieldShape1(double dLambda, double dInitialTime)
{
  return [dLambda, dInitialTime](double dT)
  {
    PRECONDITION(dT >= dInitialTime);

    double dX = dLambda * (dT - dInitialTime);
    return shape1(dX);
  };
}

std::function<double(double)>
vega::yieldShape2(double dLambda, double dInitialTime)
{
  return [dLambda, dInitialTime](double dT)
  {
    double dX = dLambda * (dT - dInitialTime);
    return shape2(dX);
  };
}
