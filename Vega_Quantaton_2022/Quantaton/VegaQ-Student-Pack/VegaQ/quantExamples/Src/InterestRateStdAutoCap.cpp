#include "quantExamples/quantExamples.hpp"
#include "quantExamples/quantExamplesFunctions.hpp"

using namespace cfl;

cfl::MultiFunction prb::
    autoCap(const Data::CashFlow &rCap, unsigned iNumberOfCaplets,
            InterestRateModel &rModel)
{
  // event times: initial time + payment times except the last one
  std::vector<double> uEventTimes(rCap.numberOfPayments);
  uEventTimes.front() = rModel.initialTime();
  std::transform(uEventTimes.begin(), uEventTimes.end() - 1,
                 uEventTimes.begin() + 1,
                 [&rCap](double dX)
                 { return dX + rCap.period; });
  rModel.assignEventTimes(uEventTimes);

  // last minus one payment time
  int iTime = uEventTimes.size() - 1;
  Slice uDiscount =
      rModel.discount(iTime, rModel.eventTimes()[iTime] + rCap.period);
  double dCapFactor = 1. + rCap.rate * rCap.period;
  // value of the next payment
  Slice uCaplet = max(1. - uDiscount * dCapFactor, 0.);
  std::vector<Slice> uCap(iNumberOfCaplets, uCaplet);

  while (iTime > 0)
  {
    // uCap[i]: the value of future caplets if i caplets were paid today
    // and in the past. We multiply on notional at the end.
    iTime--;
    for (unsigned iI = 0; iI < uCap.size(); iI++)
    {
      uCap[iI].rollback(iTime);
    }
    uDiscount =
        rModel.discount(iTime, rModel.eventTimes()[iTime] + rCap.period);
    // no max below
    uCaplet = 1. - uDiscount * dCapFactor;
    Slice uInd = indicator(uCaplet, 0.);
    for (unsigned iI = 0; iI < uCap.size() - 1; iI++)
    {
      uCap[iI] += uInd * (uCap[iI + 1] + uCaplet - uCap[iI]);
    }
    uCap.back() += uInd * (uCaplet - uCap.back());
  }
  uCap.front() *= rCap.notional;

  return interpolate(uCap.front());
}
