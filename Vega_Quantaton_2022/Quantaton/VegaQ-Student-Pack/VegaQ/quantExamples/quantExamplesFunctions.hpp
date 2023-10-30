#ifndef __quantExamples_Functions_hpp__
#define __quantExamples_Functions_hpp__

namespace NQuant
{
	cfl::Slice
	couponBond(unsigned iTime, const cfl::Data::CashFlow &rBond,
			   const cfl::InterestRateModel &rModel);

	cfl::Slice
	swap(unsigned iTime, const cfl::Data::Swap &rSwap,
		 const cfl::InterestRateModel &rModel);

	cfl::Slice
	swapRate(unsigned iTime, double dPeriod, unsigned iNumberOfPayments,
			 const cfl::InterestRateModel &rModel);
}

#endif // of __quantExamples_Functions_hpp__
