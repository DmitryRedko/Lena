#include "quantExamples/quantExamples.hpp"

using namespace cfl;
using namespace std;

namespace NFuturesOnLibor
{
  cfl::Slice
  rate(unsigned iTime, double dPeriod, const cfl::InterestRateModel &rModel)
  {
    PRECONDITION(iTime < rModel.eventTimes().size());
    PRECONDITION(dPeriod > cfl::EPS);
    
    double dTime = rModel.eventTimes()[iTime] + dPeriod;
    cfl::Slice uDiscount = rModel.discount(iTime, dTime);
    return (1. / uDiscount - 1.) / dPeriod;
  }
} // namespace NFuturesOnLibor

using namespace NFuturesOnLibor;

cfl::MultiFunction prb::
    futuresOnLibor(double dLiborPeriod,
                   unsigned iFuturesTimes, double dMaturity,
                   InterestRateModel &rModel)
{
  PRECONDITION(rModel.initialTime() < dMaturity);
  PRECONDITION(iFuturesTimes > 0);

  double dPeriod = (dMaturity - rModel.initialTime()) / (iFuturesTimes);
  std::vector<double> uEventTimes(iFuturesTimes + 1);
  uEventTimes.front() = rModel.initialTime();
  std::transform(uEventTimes.begin(), uEventTimes.end() - 1,
                 uEventTimes.begin() + 1,
                 [dPeriod](double dX)
                 { return dX + dPeriod; });
  ASSERT(std::abs(uEventTimes.back() - dMaturity) < cfl::EPS);
  rModel.assignEventTimes(uEventTimes);

  int iTime = rModel.eventTimes().size() - 1;
  Slice uFutures = 1. - rate(iTime, dLiborPeriod, rModel);
  while (iTime > 0)
  {
    //uFutures is the future price today
    iTime--;
    uFutures.rollback(iTime);
    uFutures /= rModel.discount(iTime, rModel.eventTimes()[iTime] + dPeriod);
  }

  return interpolate(uFutures);
}
