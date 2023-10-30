#include "test/Main.hpp"
#include "test/HullWhite.hpp"
#include "test/Print.hpp"
#include "quant2/Output.hpp"
#include "quant2/quant2.hpp"

using namespace test;
using namespace cfl;
using namespace std;
using namespace test::HullWhite;

cfl::MultiFunction
callableCappedFloater(InterestRateModel &rModel)
{
  test::print("CALLABLE CAPPED FLOATER IN INTEREST RATE MODEL");

  cfl::Data::CashFlow uCapParameters = test::HullWhite::swapParameters();
  uCapParameters.rate = test::HullWhite::c_dYield * 1.1;
  double dLiborSpread = 0.01;

  test::printCashFlow(uCapParameters, "cap parameters");
  print(dLiborSpread, "spread over LIBOR", true);

  return prb::
      callableCappedFloater(uCapParameters, dLiborSpread, rModel);
}

cfl::MultiFunction
capOnSwapRate(InterestRateModel &rModel)
{
  test::print("CAP ON SWAP RATE IN INTEREST RATE MODEL");

  cfl::Data::CashFlow uCapParameters = test::HullWhite::swapParameters();
  uCapParameters.rate = test::HullWhite::c_dYield * 1.1;
  double dSwapPeriod = uCapParameters.period * 2;
  unsigned iSwapPayments = uCapParameters.numberOfPayments * 2;

  test::printCashFlow(uCapParameters, "cap parameters");
  print(dSwapPeriod, "swap period");
  print(iSwapPayments, "number of swap payments", true);

  return prb::
      capOnSwapRate(uCapParameters, dSwapPeriod, iSwapPayments, rModel);
}

cfl::MultiFunction
callableRangeAccruedNote(InterestRateModel &rModel)
{
  test::print("CALLABLE RANGE ACCRUED NOTE IN INTEREST RATE MODEL");

  cfl::Data::CashFlow uNoteParameters = test::HullWhite::swapParameters();
  unsigned iNumberOfLookupTimes = 4;
  double dLowerBarrier = test::HullWhite::c_dYield * 0.9;
  double dUpperBarrier = test::HullWhite::c_dYield * 1.1;
  double dLiborPeriod = uNoteParameters.period;

  test::printCashFlow(uNoteParameters, "note parameters");
  print(iNumberOfLookupTimes, "number of lookup times");
  print(dLowerBarrier, "lower barrier for LIBOR");
  print(dUpperBarrier, "upper barrier for LIBOR");
  print(dLiborPeriod, "period for LIBOR", true);

  return prb::
      callableRangeAccruedNote(uNoteParameters, iNumberOfLookupTimes,
                               dLowerBarrier, dUpperBarrier, dLiborPeriod,
                               rModel);
}

cfl::MultiFunction
putableAnnuity(InterestRateModel &rModel)
{
  test::print("PUTABLE ANNUITY IN INTEREST RATE MODEL");

  cfl::Data::CashFlow uAnnuity = test::HullWhite::swapParameters();
  test::printCashFlow(uAnnuity, "annuity parameters");

  return prb::putableAnnuity(uAnnuity, rModel);
}

cfl::MultiFunction
CMSwaption(InterestRateModel &rModel, bool bPayFloat)
{
  test::print("CONSTANT MATURITY SWAPTION IN INTEREST RATE MODEL");

  cfl::Data::Swap uSwap = test::HullWhite::swapParameters();
  uSwap.payFloat = bPayFloat;
  double dMaturity = rModel.initialTime() + 0.5;
  unsigned iPeriods = 3;

  test::printSwap(uSwap, "swap parameters");
  print(dMaturity, "maturity");
  print(iPeriods, "number of periods in CMS swap rate", true);

  return prb::
      CMSwaption(uSwap, dMaturity, iPeriods, rModel);
}

cfl::MultiFunction
americanCMSwaption(InterestRateModel &rModel, bool bPayFloat)
{
  test::print("AMERICAN CONSTANT MATURITY SWAPTION IN INTEREST RATE MODEL");

  cfl::Data::Swap uSwap =
      test::HullWhite::swapParameters();
  uSwap.payFloat = bPayFloat;
  std::vector<double> uExerciseTimes = test::HullWhite::exerciseTimes();
  unsigned iCMSPeriods = 3;

  print(iCMSPeriods, "CMS periods", true);
  test::print(uExerciseTimes.begin(), uExerciseTimes.end(), "exercise  times");
  test::printSwap(uSwap, "swap parameters");

  return prb::americanCMSwaption(uSwap, uExerciseTimes, iCMSPeriods, rModel);
}

std::function<void()> test_quant2()
{
  return []()
  {
    print("INTEREST RATE OPTIONS IN HULL-WHITE MODEL");

    InterestRateModel uModel = test::HullWhite::model();

    report(callableCappedFloater, uModel);
    report(capOnSwapRate, uModel);
    report(callableRangeAccruedNote, uModel);
    report(putableAnnuity, uModel);
    report(CMSwaption, uModel);
    report(americanCMSwaption, uModel);    
  };
}

int main()
{
  project(test_quant2(), PROJECT_NAME, PROJECT_NAME,
          "Quantathon: set 2");
}
