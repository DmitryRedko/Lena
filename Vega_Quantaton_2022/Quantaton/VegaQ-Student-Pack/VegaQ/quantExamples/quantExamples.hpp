#ifndef __Examples_hpp__
#define __Examples_hpp__

/**
 * @file quantExamples.hpp
 * @author Dmitry Kramkov (kramkov@andrew.cmu.edu)
 * @brief Examples for Quantathon. 
 * @version 0.1
 * @date 2021-02-12
 * 
 * @copyright Copyright (c) 2021
 * 
 */

#include "cfl/Data.hpp"
#include "cfl/Interp.hpp"
#include "cfl/InterestRateModel.hpp"

/**
 * @mainpage Examples for Quantathon
 */

namespace prb
{
  /**
   * @defgroup cflInterestRateOptions Options on interest rates. 
   * 
   * This module deals with valuation of standard and barrier 
   * options on interest rates.
   * 
   * @{
   */

  /** 
   * Computes the price of <strong>interest rate cap</strong>. 
   * 
   * @param rCap The parameters of interest rate cap. 
   * @param rModel Reference to implementation of cfl::InterestRateModel.
   * 
   * @return The price of the option as the function of the initial
   * values of the state processes in the model.
   */
  cfl::MultiFunction cap(const cfl::Data::CashFlow &rCap, cfl::InterestRateModel &rModel);

  /** 
   * Compute the present value of <strong>interest rate
   * swap</strong>. The computations are done at issue time of the
   * swap contract. 
   * 
   * @param rSwap The parameters of the underlying interest rate
   * swap. 
   * @param rModel Reference to implementation of cfl::InterestRateModel.
   * 
   * @return The price of the option as the function of the initial
   * values of the state processes in the model.
   */
  cfl::MultiFunction swap(const cfl::Data::Swap &rSwap, cfl::InterestRateModel &rModel);

  /** 
   * Computes the price of <strong>interest rate swaption</strong>.
   * In this contract, at maturity \p dMaturity a holder of the option
   * has the right to enter the interest rate swap with issue time \p
   * dMaturity and parameters \p rSwap.
   * 
   * @param rSwap The parameters of the underlying interest rate
   * swap. 
   * @param dMaturity The maturity of the option. This time is also
   * the issue time for the underlying swap contract. 
   * @param rModel The reference to the implementation of cfl::InterestRateModel.
   * 
   * @return The price of the option as the function of the initial
   * values of the state processes in the model.
   */
  cfl::MultiFunction swaption(const cfl::Data::Swap &rSwap, double dMaturity,
			      cfl::InterestRateModel &rModel);

  /** 
   * Computes the price of <strong>cancellable collar</strong>. 
   * In this contract, holder of the option can terminate the
   * underlying interest rate collar at any payment time.
   * Note that in the case of termination the current payment 
   * is still taking place. 
   * 
   * @param rCap The parameters of the underlying interest rate
   * collar. Here <code>rCap.rate</code> defines the cap rate. 
   * @param dFloorRate The floor rate in the underlying interest
   * rate collar. 
   * @param rModel The reference to the implementation of cfl::InterestRateModel.
   * 
   * @return The price of the option as the function of the initial
   * values of the state processes in the model.
   */
  cfl::MultiFunction cancellableCollar(const cfl::Data::CashFlow &rCap,
				       double dFloorRate,
				       cfl::InterestRateModel &rModel);
  /** 
   * Computes the price of <strong>down-and-out cap</strong>.  The
   * down-and-out cap generates the same cash flow as a standard
   * interest rate cap up to and including the payment time when the
   * float rate hits lower barrier \p dLowerBarrier. After that, the
   * cap is terminated.
   * 
   * @param rCap The parameters of the underlying interest rate
   * cap. 
   * @param dLowerBarrier The lower barrier for float rate. 
   * @param rModel The reference to the implementation of cfl::InterestRateModel.
   * 
   * @return The price of the option as the function of the initial
   * values of the state processes in the model.
   */
  cfl::MultiFunction downOutCap(const cfl::Data::CashFlow &rCap,
				double dLowerBarrier,
				cfl::InterestRateModel &rModel);

  /** 
   * Computes  <strong>futures price on LIBOR</strong>.
   * The set of times, when the futures price is evaluated is given by 
   * \f[
   * t_i = t_0 + i\frac{T-t_0}{M}, \quad i=1,\dots,M, 
   * \f]
   * where \f$t_0=\f$ \p rModel.initialTime(), \f$T=\f$ \p
   * dFuturesMaturity, and \f$M=\f$ \p iFuturesTimes.
   * At maturity \p dFuturesMaturity, the settlement price is 
   * \f[
   * 1 - L(T,T+\Delta), 
   * \f]
   * where \f$\Delta = \f$ \p dLiborPeriod and \f$L(s,t)\f$ is the
   * LIBOR computed at \f$s\f$ for maturity \f$t\f$.
   * 
   * @param dLiborPeriod The LIBOR period in the futures. 
   * @param iFuturesTimes The number of futures times. 
   * @param dMaturity The maturity. 
   * @param rModel The reference to the implementation of cfl::InterestRateModel.
   * 
   * @return The price of the option as the function of the initial
   * values of the state processes in the model.
   */
  cfl::MultiFunction futuresOnLibor(double dLiborPeriod,
                                    unsigned iFuturesTimes, double dMaturity,
                                    cfl::InterestRateModel &rModel);

    /**
   * Computes the price of <strong>drop-lock swap</strong>.  The contract
   * behaves as a standard swap with the difference that the first payment
   * time the market swap rate is above \p dUpperRate or below \p dLowerRate
   * the fixed rate in the contract is reset to \p dUpperRate or \p
   * dLowerRate, respectively, and then remains constant. The fixed rate
   * before the reset time equals \p rSwap.rate. The market swap rate used for
   * resets corresponds to the swap contract with the same parameters as in
   * the original \p rSwap, that is, the same number of payments and the
   * period. Note that the initial time is <em>not</em> a reset time.
   *
   * @param rSwap The parameters of the underlying interest rate
   * swap.
   * @param dLowerRate The lower value for swap rate after reset.
   * @param dUpperRate The upper bound for swap rate after reset.
   * @param rModel The reference to the implementation of cfl::InterestRateModel.
   *
   * @return The price of the option as the function of the initial
   * values of the state processes in the model.
   */
  cfl::MultiFunction dropLockSwap(const cfl::Data::Swap &rSwap,
                                  double dLowerRate, double dUpperRate,
                                  cfl::InterestRateModel &rModel);

  /**
   * Computes the price of <strong>auto interest rate cap</strong>.  The
   * holder receives first \p iNumberOfCaplets in-the-money caplets and then
   * the contract is terminated.
   *
   * @param rCap The parameters of interest rate cap.
   * @param iNumberOfCaplets The maximal number of paid caplets. It is
   * less or equal \p rCap.numberOfPayments.
   * @param rModel The reference to the implementation of cfl::InterestRateModel.
   *
   * @return The price of the option as the function of the initial
   * values of the state processes in the model.
   */
  cfl::MultiFunction autoCap(const cfl::Data::CashFlow &rCap,
                             unsigned iNumberOfCaplets,
                             cfl::InterestRateModel &rModel);
  /** @} */  
}

#endif // of __Examples_hpp__
