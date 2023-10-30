#ifndef __quantExam_hpp__
#define __quantExam_hpp__

/**
 * @file quantExam.hpp
 * @author Dmitry Kramkov (kramkov@andrew.cmu.edu)
 * @brief Quantathon: final exam 
 * @version 1.0
 * @date 2022-10-28
 *
 * @copyright Copyright (c) 2022
 *
 */

#include "cfl/Data.hpp"
#include "cfl/InterestRateModel.hpp"

/**
 * @mainpage Quantathon: final exam
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
   * Computes the price of <strong>up-and-out interest rate
   * floor</strong>. 
   * The option makes the same payments as the standard interest rate floor
   * with parameters \p rFloor until the first payment time
   * <code>t(i)</code>,  when the float rate is above the upper barrier
   * \p dUpperBarrier. Then  the payment at <code>t(i)</code> takes
   * place and the contract is terminated. 
   * 
   * @param rFloor The parameters of the underlying interest rate
   * floor. 
   * @param dUpperBarrier The upper barrier for float rate. 
   * @param rModel The reference to the implementation of cfl::InterestRateModel.
   * 
   * @return The price of the option as the function of the initial
   * values of the state processes in the model.
   */
  cfl::MultiFunction upOutFloor(const cfl::Data::CashFlow &rFloor,
                                double dUpperBarrier,
                                cfl::InterestRateModel &rModel);

   /**
   * Computes the price of <strong>American put option on futures
   * price of zero-coupon bond</strong>. In this contract, the holder of
   * the option can exercise it at any time from the set:
   * \f[
   * t_i = t_0 + i\frac{T-t_0}{M}, \quad i=1,\dots,M,
   * \f]
   * where \f$t_0=\f$ \p rModel.initialTime(), \f$T=\f$ \p
   * dFuturesMaturity, and \f$M=\f$ \p iFuturesTimes.  He then
   * receives strike \p dStrike and pays the futures price.
   *
   * The futures contract is written on the zero-coupon bond with
   * notional \p dNotional and maturity \p dBondMaturity. The delivery
   * time of the contract is given by \p dFuturesMaturity.
   *
   * @param dNotional The notional amount of the underlying
   * zero-coupon bond.
   * @param dBondMaturity The maturity of the underlying zero-coupon
   * bond.
   * @param dFuturesMaturity The maturity of the futures contract.
   * @param iFuturesTimes The number of "futures" times, that is the
   * times when futures transactions in the contract take place. The
   * set of futures times coincides with the set of exercise
   * times. This set includes the
   * delivery time \p dFuturesMaturity, but does not contain the
   * initial time of the model (the issue time of the contract).
   * @param dStrike The strike of the option.
   * @param rModel The reference to the implementation of cfl::InterestRateModel.
   *
   * @return The price of the option as the function of the initial
   * values of the state processes in the model.
   */
  cfl::MultiFunction americanPutOnFutures(double dNotional, double dBondMaturity,
                                          double dFuturesMaturity,
                                          unsigned iFuturesTimes,
                                          double dStrike,
                                          cfl::InterestRateModel &rModel);

  /**
   * Computes the price of <strong>cancellable swap set and paid in
   * arrears</strong>.  In this contract, the holder of the option has
   * the right to cancel the swap at any payment time (after the
   * payments). The fixed payments are as in the usual swap. However,
   * the float payments are set in <em>arrears</em>. This means that
   * the float payment at a given payment time is determined by the
   * Libor rate computed at <em>this</em> payment time (in the case of
   * standard swap the float payment is set at the <em>previous</em>
   * payment time).
   *
   * @param rSwap The parameters of the swap.
   * @param rModel The reference to the implementation of cfl::InterestRateModel.
   *
   * @return The price of the option as the function of the initial
   * values of the state processes in the model.
   */
  cfl::MultiFunction cancelSwapArrears(const cfl::Data::Swap &rSwap,
                                       cfl::InterestRateModel &rModel);
  
  /**
   * Computes the value of the <strong>double-up interest rate
   * swap</strong>.
   * Denote by \f$(t_m)_{m=1,\dots,M}\f$ the payment times of the swap:
   * \f[
   * t_m = t_0 + m \delta t, \quad m=1,\dots, M,
   * \f]
   * and by \f$\tau\f$ the first payment time the float (LIBOR) rate with
   * period \f$\delta t\f$ is below \f$L\f$:
   * \f[
   * \tau = \min\{t_m: r(t_m,t_m+\delta t) \leq L\}.
   * \f]
   * At and after time \f$\tau\f$, that is, at payment times \f$t_n\geq \tau\f$,
   * the holder is given the right to double the notional (like American
   * option). The exercise at \f$t_n\f$ doubles the future swap payments (both
   * float and fixed), that is, the payments at
   * \f[
   * t_n+\delta t, t_n+2\delta t, \dots, t_M.
   * \f]
   * In these formulas, \f$L\f$ = \a dLowerBarrier,
   * \f$M\f$ = \a rSwap.numberOfPayments, and \f$\delta t\f$ = \a rSwap.period.
   *
   * @param dLowerBarrier The lower barrier for float rate.
   * @param rSwap The parameters of the underlying swap.
   * @param rModel The reference to the implementation of cfl::InterestRateModel.
   *
   * @return The price of the option as the function of the initial
   * values of the state processes in the model.
   */

  cfl::MultiFunction
  doubleUpSwap(double dLowerBarrier, const cfl::Data::Swap &rSwap,
               cfl::InterestRateModel &rModel);

  /**
   * Computes the price of <strong>callable capped floater with
   * resettable coupon</strong>.
   * At any coupon time <code>t(i)</code> the holder receives the coupon
   * \code
   *  N * rCap.period * D(j-1),
   * \endcode
   * where <code>D(j-1)</code> is the coupon rate determined at the previous
   * reset time <code>r(j-1)</code> or is given by \p dInitialCouponRate
   * if there were no reset times before <code>t(i)</code>.
   * If, in addition, the coupon time <code>t(i)</code> is also a reset
   * time <code>r(j)</code>, then
   * <ol>
   * <li> the seller of the option <em>has the right to cancel</em> the
   * contract by paying <code>rCap.notional * dRepaymentPrice</code> in
   * addition to coupon.
   * <li> the value of the coupon changes to
   * \code
   * D(j) = min(L(r(j),r(j)+rCap.period*iCouponsBetweenResets)+dLiborSpread, rCap.rate),
   * \endcode
   * where <code>L(s,t)</code> is the LIBOR rate computed at <code>s</code>
   * for maturity <code>t</code>.  This rate is used to compute coupons at
   * times
   * \code
   * r(j)+rCap.period,..., r(j)+rCap.period*iCouponsBetweenResets.
   * \endcode
   * </ol>
   * If the contract has not been terminated before, then at maturity
   * the buyer receives the above coupon and \p rCap.notional.
   *
   * @param rCap The parameters of the contract. Here <code>rCap.rate</code>
   *  defines the cap rate.
   * @param iCouponsBetweenResets The number of coupons between resets.
   * @param dLiborSpread The spread over LIBOR rate in the computation
   * of resettable coupon.
   * @param dInitialCouponRate The initial coupon rate (valid before
   * first reset).
   * @param dRepaymentPrice The callable price in percentage to the
   * notional.
   * @param rModel The reference to the implementation of cfl::InterestRateModel.
   *
   * @return The price of the option as the function of the initial
   * values of the state processes in the model.
   */
  cfl::MultiFunction callableCappedResetFloater(const cfl::Data::CashFlow &rCap,
                                                unsigned iCouponsBetweenResets,
                                                double dLiborSpread,
                                                double dInitialCouponRate,
                                                double dRepaymentPrice,
                                                cfl::InterestRateModel &rModel);
  /**
   * Computes the price of <strong>puttable bond with resettable
   * coupon</strong> at its issue time. In this contract, after a
   * coupon payment the issuer can reset the coupon rate from original
   * (higher) value <code>rBond.rate</code> to (lower) reset value \p
   * dResetCouponRate. After that, at any payment time greater or
   * equal the reset time and less than the maturity, the holder can
   * sell the bond back to the issuer for redemption value
   * <code>dRedemptionPrice*rBond.notional</code>.
   *
   * @param rBond The parameters of the underlying coupon bond. The
   * initial coupon rate is given by <code>rBond.rate</code>.
   * @param dResetCouponRate The coupon rate after reset. Usually,
   * this rate is smaller than the original coupon rate.
   * @param dRedemptionPrice The redemption price of the bond as the percentage
   * of the notional.  Typically, <code>dRedemptionPrice<1</code>.
   * @param rModel The reference to the implementation of cfl::InterestRateModel.
   *
   * @return The price of the option as the function of the initial
   * values of the state processes in the model.
   */
  cfl::MultiFunction resetCouponPutBond(const cfl::Data::CashFlow &rBond,
                                        double dResetCouponRate, double dRedemptionPrice,
                                        cfl::InterestRateModel &rModel);


  /** @} */
} // namespace prb

#endif // of __quantExam_hpp__
