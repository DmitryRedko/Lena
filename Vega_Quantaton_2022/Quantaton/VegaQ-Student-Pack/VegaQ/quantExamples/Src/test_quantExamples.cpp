#include "test/Main.hpp"
#include "test/Data.hpp"
#include "test/Print.hpp"
#include "test/HullWhite.hpp"
#include "quantExamples/Output.hpp"
#include "quantExamples/quantExamples.hpp"

using namespace test;
using namespace cfl;
using namespace std;
using namespace test::Data;

// INTEREST RATE OPTIONS IN HULL-WHITE MODEL

cfl::MultiFunction cap(InterestRateModel &rModel)
{
  test::print("CAP IN INTEREST RATE MODEL");

  cfl::Data::CashFlow uCapParameters = test::HullWhite::swapParameters();
  uCapParameters.rate = test::HullWhite::c_dYield * 1.1;

  test::printCashFlow(uCapParameters, "cap parameters");

  return prb::cap(uCapParameters, rModel);
}

cfl::MultiFunction swap(InterestRateModel &rModel, bool bPayFloat)
{
  test::print("SWAP IN INTEREST RATE MODEL");

  cfl::Data::Swap uSwap = test::HullWhite::swapParameters();
  uSwap.payFloat = bPayFloat;

  test::printSwap(uSwap, "swap parameters");

  return prb::swap(uSwap, rModel);
}

cfl::MultiFunction swaption(InterestRateModel &rModel, bool bPayFloat)
{
  test::print("SWAPTION IN INTEREST RATE MODEL");

  cfl::Data::Swap uSwap = test::HullWhite::swapParameters();
  uSwap.payFloat = bPayFloat;
  double dMaturity = test::HullWhite::c_dMaturity;

  test::printSwap(uSwap, "swap parameters");
  print(dMaturity, "maturity", true);

  return prb::swaption(uSwap, dMaturity, rModel);
}

cfl::MultiFunction cancellableCollar(InterestRateModel &rModel)
{
  test::print("CANCELLABLE COLLAR IN INTEREST RATE MODEL");

  cfl::Data::CashFlow uCapParameters = test::HullWhite::swapParameters();
  uCapParameters.rate = test::HullWhite::c_dYield * 1.1;
  double dFloorRate = test::HullWhite::c_dYield * 0.9;

  test::printCashFlow(uCapParameters, "cap parameters");
  print(dFloorRate, "floor rate", true);

  return prb::cancellableCollar(uCapParameters, dFloorRate,
                                rModel);
}

cfl::MultiFunction downOutCap(InterestRateModel &rModel)
{
  test::print("DOWN-AND-OUT CAP IN INTEREST RATE MODEL");

  cfl::Data::CashFlow uCapParameters = test::HullWhite::swapParameters();
  uCapParameters.rate = test::HullWhite::c_dYield * 1.1;
  double dLowerBarrier = test::HullWhite::c_dYield * 0.9;

  test::printCashFlow(uCapParameters, "cap parameters");
  print(dLowerBarrier, "lower barrier", true);

  return prb::downOutCap(uCapParameters, dLowerBarrier,
                         rModel);
}

cfl::MultiFunction futuresOnLibor(InterestRateModel &rModel)
{
  test::print("LIBOR FUTURES IN INTEREST RATE MODEL");

  double dLiborPeriod = test::HullWhite::c_dPeriod;
  unsigned iFuturesTimes = 20;
  double dMaturity = 0.25;

  print(dLiborPeriod, "period for LIBOR");
  print(iFuturesTimes, "number of futures times");
  print(dMaturity, "maturity", true);

  return prb::
      futuresOnLibor(dLiborPeriod, iFuturesTimes, dMaturity, rModel);
}

cfl::MultiFunction dropLockSwap(InterestRateModel &rModel,
                                bool bPayFloat)
{
  test::print("DROP-LOCK SWAP IN INTEREST RATE MODEL");

  cfl::Data::Swap uSwap = test::HullWhite::swapParameters();
  uSwap.payFloat = bPayFloat;

  double dLowerRate = uSwap.rate - 0.015;
  double dUpperRate = uSwap.rate + 0.025;

  test::printSwap(uSwap, "swap parameters");
  print(dLowerRate, "lower rate");
  print(dUpperRate, "upper rate", true);

  return prb::dropLockSwap(uSwap, dLowerRate, dUpperRate, rModel);
}

cfl::MultiFunction autoCap(InterestRateModel &rModel)
{
  test::print("AUTO CAP IN INTEREST RATE MODEL");

  cfl::Data::CashFlow uCap = test::HullWhite::swapParameters();
  unsigned iNumberOfCaplets = uCap.numberOfPayments / 2;

  test::printCashFlow(uCap, "cap parameters");
  print(iNumberOfCaplets, "number of paid caplets", true);

  return prb::autoCap(uCap, iNumberOfCaplets, rModel);
}


std::function<void()> test_quantExamples()
{
  return []()
  {
    print("INTEREST RATE OPTIONS IN HULL-WHITE MODEL");

    InterestRateModel uHullWhite = test::HullWhite::model();
    test::HullWhite::report(cap, uHullWhite);
    test::HullWhite::report(swap, uHullWhite);
    test::HullWhite::report(swaption, uHullWhite);
    test::HullWhite::report(cancellableCollar, uHullWhite);
    test::HullWhite::report(downOutCap, uHullWhite);
    test::HullWhite::report(futuresOnLibor, uHullWhite);
    test::HullWhite::report(dropLockSwap, uHullWhite);
    test::HullWhite::report(autoCap, uHullWhite);
  };
}

int main()
{
  project(test_quantExamples(), PROJECT_NAME, PROJECT_NAME,
          "Examples for Quantathon");
}
