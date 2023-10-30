#include "test/Main.hpp"
#include "test/HullWhite.hpp"
#include "test/Print.hpp"
#include "quant1/Output.hpp"
#include "quant1/quant1.hpp"

using namespace test;
using namespace cfl;
using namespace std;
using namespace test::HullWhite;

cfl::MultiFunction forwardSwapLock(InterestRateModel &rModel,
                                   bool bPayFloat)
{
  test::print("FORWARD CONTRACT ON SWAP IN INTEREST RATE MODEL");

  cfl::Data::Swap uSwap = test::HullWhite::swapParameters();
  uSwap.payFloat = bPayFloat;
  double dMaturity = test::HullWhite::c_dMaturity;

  test::printSwap(uSwap, "swap parameters");
  print(dMaturity, "maturity", true);

  return prb::forwardSwapLock(uSwap, dMaturity,
                              rModel);
}

cfl::MultiFunction collar(InterestRateModel &rModel)
{
  test::print("COLLAR IN INTEREST RATE MODEL");

  cfl::Data::CashFlow uCapParameters = test::HullWhite::swapParameters();
  uCapParameters.rate = test::HullWhite::c_dYield * 1.1;
  double dFloorRate = test::HullWhite::c_dYield * 0.9;

  test::printCashFlow(uCapParameters, "cap parameters");
  print(dFloorRate, "floor rate", true);

  return prb::collar(uCapParameters, dFloorRate, rModel);
}

cfl::MultiFunction
americanPutOnFRA(InterestRateModel &rModel)
{
  test::print("AMERICAN PUT ON FORWARD RATE AGREEMENT IN INTEREST RATE MODEL");

  double dFixedRate = test::HullWhite::c_dYield;
  double dPeriod = test::HullWhite::c_dPeriod;
  double dNotional = test::HullWhite::c_dNotional;
  std::vector<double> uExerciseTimes = test::HullWhite::exerciseTimes();

  test::print(uExerciseTimes.begin(), uExerciseTimes.end(), "exercise  times");
  print(dFixedRate, "fixed rate");
  print(dPeriod, "period for FRA");
  print(dNotional, "notional", true);

  return prb::
      americanPutOnFRA(dFixedRate, dPeriod, dNotional, uExerciseTimes, rModel);
}

cfl::MultiFunction americanSwaption(InterestRateModel &rModel, bool bPayFloat)
{
  test::print("AMERICAN SWAPTION IN INTEREST RATE MODEL");

  cfl::Data::Swap uSwap =
      test::HullWhite::swapParameters();
  uSwap.payFloat = bPayFloat;
  std::vector<double> uExerciseTimes = test::HullWhite::exerciseTimes();

  test::print(uExerciseTimes.begin(), uExerciseTimes.end(), "exercise  times");
  test::printSwap(uSwap, "swap parameters");

  return prb::americanSwaption(uSwap, uExerciseTimes, rModel);
}

cfl::MultiFunction putCallBond(InterestRateModel &rModel)
{
  test::print("PUTABLE AND CALLABLE BOND IN INTEREST RATE MODEL");

  cfl::Data::CashFlow uBondParameters = test::HullWhite::swapParameters();
  double dRedemptionPrice = 0.95;
  double dRepurchasePrice = 1.05;

  test::printCashFlow(uBondParameters, "bond parameters");
  print(dRedemptionPrice, "redemption price for put");
  print(dRepurchasePrice, "repurchase price for call", true);

  return prb::
      putCallBond(uBondParameters, dRedemptionPrice, dRepurchasePrice, rModel);
}

cfl::MultiFunction
futuresOnCheapToDeliver(InterestRateModel &rModel)
{
  test::print("FUTURES PRICE OF CHEAPEST TO DELIVER COUPON BOND IN INTEREST RATE MODEL");

  double dFuturesMaturity = 0.5;
  unsigned iNumberOfFuturesTimes = 20;

  print(dFuturesMaturity, "maturity of futures contract");
  print(iNumberOfFuturesTimes, "number of futures times", true);

  unsigned iNumberOfBonds = 5;
  std::vector<cfl::Data::CashFlow> uBonds(iNumberOfBonds);
  double dNotional = test::HullWhite::c_dNotional;
  double dRate = test::HullWhite::c_dYield;
  double dPeriod = 0.25;
  unsigned iNumberOfPeriods = 4;
  for (unsigned i = 0; i < iNumberOfBonds; i++)
  {
    uBonds[i].notional = dNotional;
    uBonds[i].rate = dRate;
    uBonds[i].period = dPeriod;
    uBonds[i].numberOfPayments = iNumberOfPeriods + i;

    print(i, "bond index");
    print(uBonds[i].notional, "notional");
    print(uBonds[i].rate, "coupon rate");
    print(uBonds[i].period, "period");
    print(uBonds[i].numberOfPayments, "number of payments", true);
  }
  return prb::
      futuresOnCheapToDeliver(dFuturesMaturity, iNumberOfFuturesTimes,
                              uBonds, rModel);
}

std::function<void()> test_quant1()
{
  return []()
  {
    print("INTEREST RATE OPTIONS IN HULL-WHITE MODEL");

    InterestRateModel uModel = test::HullWhite::model();

    report(forwardSwapLock, uModel);
    report(collar, uModel);
    report(americanPutOnFRA, uModel);
    report(americanSwaption, uModel);
    report(putCallBond, uModel);
    report(futuresOnCheapToDeliver, uModel);
  };
}

int main()
{
  project(test_quant1(), PROJECT_NAME, PROJECT_NAME,
          "Quantathon: set 1");
}
