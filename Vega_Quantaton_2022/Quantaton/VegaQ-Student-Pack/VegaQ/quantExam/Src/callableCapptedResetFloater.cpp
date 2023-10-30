#include "quantExam/quantExam.hpp"

using namespace cfl;
using namespace std;

cfl::MultiFunction prb::callableCappedResetFloater(const cfl::Data::CashFlow &rCap,
                                                unsigned iCouponsBetweenResets,
                                                double dLiborSpread,
                                                double dInitialCouponRate,
                                                double dRepaymentPrice,
                                                cfl::InterestRateModel &rModel)
{
   return cfl::MultiFunction();  
}