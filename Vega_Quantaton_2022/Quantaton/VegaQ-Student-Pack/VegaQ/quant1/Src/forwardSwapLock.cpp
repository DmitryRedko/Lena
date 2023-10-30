#include "quant1/quant1.hpp"

using namespace cfl;
using namespace std;

cfl::MultiFunction prb::forwardSwapLock(const cfl::Data::Swap &rSwap,
                                        double dMaturity,
                                        cfl::InterestRateModel &rModel)
{
    std::vector<double> uEventTimes(rSwap.numberOfPayments);
    uEventTimes.front() = rModel.initialTime();
    double iTime = rModel.initialTime();
    std::transform(uEventTimes.begin(), uEventTimes.end() - 1,
                   uEventTimes.begin() + 1,
                   [&rSwap](double dX)
                   { return dX + rSwap.period; });
    rModel.assignEventTimes(uEventTimes);

    Slice Libor = rModel.discount(iTime, dMaturity);
    Slice Rate = rModel.cash(iTime, 0);
    for (int i = 0; i < rSwap.numberOfPayments; i++)
    {
        Rate += rModel.discount(iTime, dMaturity + i * rSwap.period);
    }
    Rate *= rSwap.rate * rSwap.period;
    Rate += rModel.discount(iTime, dMaturity + rSwap.numberOfPayments * rSwap.period);

    Slice Price = (Libor - Rate) * rSwap.notional;

    return interpolate(Price);
}
