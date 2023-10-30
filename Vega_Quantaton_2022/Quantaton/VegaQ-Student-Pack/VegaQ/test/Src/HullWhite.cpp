#include "cfl/Data.hpp"
#include "test/HullWhite.hpp"
#include "test/Output.hpp"

using namespace cfl;
using namespace std;
using namespace test;
using namespace cfl::HullWhite;

cfl::HullWhite::Data
test::HullWhite::data(double dYield, double dSigma,
                      double dLambda, double dInitialTime)
{
  print("PARAMETERS OF HULL-WHITE MODEL:");
  print(dYield, "interest rate");
  print(dSigma, "sigma");
  print(dLambda, "lambda");
  print(dInitialTime, "initial time", true);

  cfl::Function uDiscount = cfl::Data::discount(dYield, dInitialTime);
  return cfl::HullWhite::makeData(uDiscount, dSigma, dLambda, dInitialTime);
}

cfl::InterestRateModel test::HullWhite::model(double dQuality)
{
  cfl::HullWhite::Data uData = test::HullWhite::data();
  print(dQuality, "quality", true);
  return cfl::HullWhite::model(uData, c_dInterval, dQuality);
}

namespace testHullWhite
{
  void print(const cfl::Function &rOption, double dShortRate,
             double dInterval, unsigned iPoints)
  {

    test::print("OPTION VALUES VERSUS SHORT RATE:");

    PRECONDITION(dInterval >= 0.);
    PRECONDITION(iPoints > 0);

    unsigned iSize = 2 * (iPoints / 2) + 1;
    std::vector<double> uShortRate(iSize);
    std::vector<double> uOption(iSize);

    ASSERT(iSize > 1);
    double dX = -dInterval / 2.;
    double dStep = dInterval / (iSize - 1.);
    for (unsigned iI = 0; iI < iSize; iI++)
    {
      uShortRate[iI] = dX;
      uOption[iI] = rOption(dX);
      dX += dStep;
    }

    unsigned iSpot = 5;
    unsigned iSpace = 6;
    unsigned iOption = 12;

    std::cout << std::setw(iSpot) << "rate"
              << std::setw(iSpace) << ""
              << std::setw(iOption) << "option" << endl;
    for (unsigned iI = 0; iI < iSize; iI++)
    {
      std::cout << std::setw(iSpot) << -uShortRate[iI] + dShortRate
                << std::setw(iSpace) << ""
                << std::setw(iOption) << uOption[iI] << endl;
    }
    std::cout << endl;
  }

  void print(const cfl::MultiFunction &rOption, double dShortRate,
             double dInterval, unsigned iPoints)
  {
    PRECONDITION(rOption.dim() == 1);
    cfl::Function uOption = cfl::toFunction(rOption);
    print(uOption, dShortRate, dInterval, iPoints);
  }
} // namespace testHullWhite

void test::HullWhite::
    report(MultiFunction (*f)(InterestRateModel &rModel),
           InterestRateModel &rModel)
{
  Function uOption = toFunction(f(rModel));
  printRisk(uOption);
  testHullWhite::print(uOption, c_dYield, c_dInterval, c_iPoints);
}

void test::HullWhite::
    report(MultiFunction (*f)(InterestRateModel &rModel, bool bPayFloat),
           InterestRateModel &rModel)
{
  for (unsigned i = 0; i < 2; i++)
  {
    bool bPayFloat = (i == 0) ? true : false;
    Function uOption = toFunction(f(rModel, bPayFloat));
    printRisk(uOption);
    testHullWhite::print(uOption, c_dYield, c_dInterval, c_iPoints);
  }
}
