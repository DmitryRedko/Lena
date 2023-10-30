#include "test/Main.hpp"
#include "test/Data.hpp"
#include "test/Print.hpp"
#include "test/HullWhite.hpp"
#include "quantExam/quantExam.hpp"
#include "quantExam/Output.hpp"

using namespace test;
using namespace cfl;
using namespace std;
using namespace test::HullWhite;

cfl::MultiFunction upOutFloor(InterestRateModel &rModel)
{
  test::print("UP-AND-OUT FLOOR IN INTEREST RATE MODEL");

  cfl::Data::CashFlow uFloorParameters = test::HullWhite::swapParameters();
  uFloorParameters.rate = test::HullWhite::c_dYield * 0.9;
  double dUpperBarrier = test::HullWhite::c_dYield * 1.1;

  test::printCashFlow(uFloorParameters, "cap parameters");
  print(dUpperBarrier, "upper barrier", true);

  return prb::
    upOutFloor(uFloorParameters, dUpperBarrier, rModel);
}

MultiFunction doubleUpSwap(cfl::InterestRateModel &rModel,
                           bool bPayFloat)
{
  test::print("DOUBLE-UP SWAP IN INTEREST RATE MODEL");

  cfl::Data::Swap uSwap =
      test::HullWhite::swapParameters();
  uSwap.payFloat = bPayFloat;
  double dLowerBarrier = uSwap.rate / 1.1;

  test::printSwap(uSwap, "swap parameters");
  print(dLowerBarrier, "lower barrier", true);

  return prb::doubleUpSwap(dLowerBarrier, uSwap, rModel);
}

cfl::MultiFunction callableCappedResetFloater(InterestRateModel &rModel)
{
  test::print("CALLABLE CAPPED RESETTABLE FLOATER IN INTEREST RATE MODEL");
  test::print("(floater can be repaid only at reset times)");

  cfl::Data::CashFlow uCapParameters = test::HullWhite::swapParameters();
  uCapParameters.rate += 0.02;
  uCapParameters.numberOfPayments = 12;
  unsigned iCouponsBetweenResets = 4;
  double dLiborSpread = 0.01;
  double dInitialCouponRate = test::HullWhite::c_dYield;
  double dRepaymentPrice = 1.02;

  test::printCashFlow(uCapParameters, "cap parameters");
  print(iCouponsBetweenResets, "number of coupons between resets");
  print(dLiborSpread, "spread over LIBOR");
  print(dInitialCouponRate, "initial coupon rate");
  print(dRepaymentPrice, "repayment price (percent of notional)", true);

  return prb::
      callableCappedResetFloater(uCapParameters, iCouponsBetweenResets,
                                 dLiborSpread, dInitialCouponRate,
                                 dRepaymentPrice, rModel);
}

cfl::MultiFunction
americanPutOnFutures(InterestRateModel &rModel)
{
  test::print("AMERICAN PUT ON FUTURES PRICE OF ZERO-COUPON BOND IN INTEREST RATE MODEL");

  double dFuturesMaturity = 0.25;
  unsigned iNumberOfFuturesTimes = 10;
  double dBondMaturity = dFuturesMaturity + 0.1;
  double dBondNotional = test::HullWhite::c_dNotional;
  double dDiscount =
      1. / (1 + test::HullWhite::c_dYield * (dBondMaturity - dFuturesMaturity));
  double dStrike = dBondNotional * dDiscount;

  print(dFuturesMaturity, "maturity of futures");
  print(iNumberOfFuturesTimes, "number of futures times");
  print(dBondMaturity, "maturity of bond");
  print(dBondNotional, "notional of bond");
  print(dStrike, "strike", true);

  return prb::americanPutOnFutures(dBondNotional, dBondMaturity, dFuturesMaturity,
                                   iNumberOfFuturesTimes, dStrike, rModel);
}

cfl::MultiFunction
cancelSwapArrears(InterestRateModel &rModel, bool bPayFloat)
{
  test::print("CANCELLABLE SWAP SET IN ARREARS IN INTEREST RATE MODEL");

  cfl::Data::Swap uSwap = test::HullWhite::swapParameters();
  uSwap.payFloat = bPayFloat;

  test::printSwap(uSwap, "swap parameters");

  return prb::cancelSwapArrears(uSwap, rModel);
}

cfl::MultiFunction
resetCouponPutBond(InterestRateModel &rModel)
{
  test::print("PUTABLE BOND WITH RESETTABLE COUPON IN INTEREST RATE MODEL");

  cfl::Data::CashFlow uBondParameters = test::HullWhite::swapParameters();
  double dResetCouponRate = uBondParameters.rate - 0.02;
  double dRedemptionPrice = 0.98;

  test::printCashFlow(uBondParameters, "bond parameters");
  print(dResetCouponRate, "reset value for coupon rate");
  print(dRedemptionPrice, "redemption price (percent of notional)", true);

  return prb::
      resetCouponPutBond(uBondParameters, dResetCouponRate,
                         dRedemptionPrice, rModel);
}

std::function<void()> test_quantExam()
{
  return []()
  {
    print("INTEREST RATE OPTIONS IN HULL-WHITE MODEL");

    InterestRateModel uHullWhite = test::HullWhite::model();

    report(upOutFloor, uHullWhite);
    report(americanPutOnFutures, uHullWhite);
    report(cancelSwapArrears, uHullWhite);
    report(doubleUpSwap, uHullWhite);
    report(callableCappedResetFloater, uHullWhite);
    report(resetCouponPutBond, uHullWhite);
  };
}

int main()
{
  project(test_quantExam(), PROJECT_NAME, PROJECT_NAME,
          "Quantathon: final exam");
}
