#include "quantExamples/quantExamples.hpp"
#include "quantExamples/quantExamplesFunctions.hpp"

using namespace cfl;
using namespace std;

namespace NQuant
{
  cfl::Slice
  couponBond(unsigned iTime, const Data::CashFlow &rBond,
             const InterestRateModel &rModel)
  {
    Slice uCashFlow = rModel.cash(iTime, 0.);
    double dTime = rModel.eventTimes()[iTime];
    for (unsigned iI = 0; iI < rBond.numberOfPayments; iI++)
    {
      dTime += rBond.period;
      uCashFlow += rModel.discount(iTime, dTime);
    }
    uCashFlow *= (rBond.rate * rBond.period);
    uCashFlow += rModel.discount(iTime, dTime);
    uCashFlow *= rBond.notional;
    return uCashFlow;
  }

  cfl::Slice
  swap(unsigned iTime, const Data::Swap &rSwap,
       const InterestRateModel &rModel)
  {
    //assume first that we receive fixed and pay float
    Slice uSwap = couponBond(iTime, rSwap, rModel) - rSwap.notional;
    if (!rSwap.payFloat)
    { //if we pay fixed
      uSwap *= -1;
    }
    return uSwap;
  }
} // namespace NQuant

cfl::MultiFunction prb::
    swap(const Data::Swap &rSwap, InterestRateModel &rModel)
{
  std::vector<double> uEventTimes(1, rModel.initialTime());
  rModel.assignEventTimes(uEventTimes);

  int iTime = 0;
  Slice uSwap = NQuant::swap(iTime, rSwap, rModel);

  return interpolate(uSwap);
}
