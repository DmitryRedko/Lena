#ifndef __quant2_hpp__
#define __quant2_hpp__

/**
 * @file quant2.hpp
 * @author Dmitry Kramkov (kramkov@andrew.cmu.edu)
 * @brief Quantathon: set 2
 * @version 1
 * @date 2021-08-25
 *
 * @copyright Copyright (c) 2021
 *
 */

#include "cfl/Data.hpp"
#include "cfl/InterestRateModel.hpp"

/**
 * @mainpage Quantathon: set 2
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
   * Computes the price of <strong>callable capped floater</strong>.
   * In this contract, at an exercise time \f$t_i\f$ the holder of the
   * option receives the coupon
   * \f[
   *    N \delta t \times \min(L(t_{i-1},t_i)+ \delta L, C)
   * \f]
   * where \f$L(s,t)\f$ is the LIBOR rate computed at \f$s\f$ for maturity
   * \f$t\f$, \f$N\f$  is the notional amount (\p rCap.notional),
   * \f$\delta L\f$ is the spread over LIBOR (\p dLiborSpread),
   * \f$C\f$ is the cap rate (\p rCap.rate) and
   * \f$\delta t = t_{i} - t_{i-1}\f$
   * is the time interval between two payments (\p rCap.period).
   * The seller can terminate the contract at any exercise time.
   * In this case, in addition to the above coupon he pays the
   * notional. If the contract has not been terminated before,
   * then at maturity the holder receives the above coupon plus notional.
   *
   * @param rCap The parameters of the contract. Here <code>rCap.rate</code>
   *  defines the cap rate.
   * @param dLiborSpread The spread over LIBOR rate.
   * @param rModel The reference to the implementation of cfl::InterestRateModel.
   *
   * @return The price of the option as the function of the initial
   * values of the state processes in the model.
   */
  cfl::MultiFunction callableCappedFloater(const cfl::Data::CashFlow &rCap,
                                           double dLiborSpread,
                                           cfl::InterestRateModel &rModel);

  /**
   * Computes the price of <strong>cap on swap rate</strong>.
   * In this contract, the payments occur at times
   * \f[
   * t_i = t_0 + i \delta t, \quad i=1, \dots, M,
   * \f]
   * where \f$t_0=\f$ \p rModel.initialTime(), \f$\delta t=\f$ \p
   * rCap.period, and \f$M=\f$ \p rCap.numberOfPayments. The payment
   * at \f$t_i\f$ has the form:
   * \f[
   * N\delta t \max(R(t_{i-1}) - C,0),
   * \f]
   * where \f$N=\f$ \p rCap.notional and \f$R(t_{i-1})\f$ is the swap
   * rate computed at <em>previous</em> time \f$t_{i-1}\f$ in the swap
   * contract with number of payments \p iSwapPayments and the
   * interval between the payments \p dSwapPeriod.
   *
   * @param rCap The parameters of interest rate cap.
   * @param dSwapPeriod The period in the interest rate swap.
   * @param iSwapPayments The number of payments in the interest rate swap.
   * @param rModel The reference to the implementation of cfl::InterestRateModel.
   *
   * @return The price of the option as the function of the initial
   * values of the state processes in the model.
   */
  cfl::MultiFunction capOnSwapRate(const cfl::Data::CashFlow &rCap,
                                   double dSwapPeriod, unsigned iSwapPayments,
                                   cfl::InterestRateModel &rModel);

  /**
   * Computes the price of
   * <strong>callable range accrued note (CRAN)</strong>.
   * In this note the coupon paid at the end of coupon period is
   * proportional to the number of lookup times inside of the coupon period
   * when the LIBOR belongs to the range specified by the
   * barriers. After the coupon payment the issuer has the right to buy
   * the note back for the notional.
   *
   * @param rNote The parameters of the note: notional, coupon rate,
   * number of coupons,
   * time interval between coupon payments given as year fraction.
   * @param iNumberOfLookupDates The number of lookup dates in the coupon
   * period.
   * @param dLowerBarrier The lower value for LIBOR.
   * @param dUpperBarrier The upper value for LIBOR.
   * @param dLiborPeriod The period of LIBOR.
   * @param rModel The reference to the implementation of cfl::InterestRateModel.
   *
   * @return The price of the option as the function of the initial
   * values of the state processes in the model.
   */
  cfl::MultiFunction callableRangeAccruedNote(const cfl::Data::CashFlow &rNote,
                                              unsigned iNumberOfLookupDates,
                                              double dLowerBarrier,
                                              double dUpperBarrier,
                                              double dLiborPeriod,
                                              cfl::InterestRateModel &rModel);

  /**
   * Computes the price of <strong>putable annuity</strong>.
   * Denote \f$F\f$ <code>= rAnnuity.notional</code>,
   * \f$Q\f$ <code>=rAnnuity.rate</code>,
   * \f$\delta t\f$ <code>=rAnnuity.period</code>,
   * and \f$m\f$ <code>=rAnnuity.numberOfPeriods</code>.
   * The payment times of the annuity are given by
   * \f[
   * t_i = t_0 + i \delta t, \quad i=1,\dots,m.
   * \f]
   * At every payment time \f$t(i)\f$ annuity's holder receives
   * the payment \f$ A \f$ given by
   * \f[
   * A \sum_{k=1}^m \frac1{(1+Q\delta t)^k} = F.
   * \f]
   * After the payment  <em>issuer</em> has the right to terminate
   * the annuity by paying to the holder the remaining notional amount
   * \f$N(i)\f$ computed by
   * \f[
   * A \sum_{k=1}^{m-i} \frac1{(1+Q\delta t)^k} = N(i).
   * \f]
   * Note that \f$N(0) = F\f$.
   *
   * @param rAnnuity The parameters of annuity.
   * @param rModel The reference to the implementation of cfl::InterestRateModel.
   *
   * @return The price of the option as the function of the initial
   * values of the state processes in the model.
   */
  cfl::MultiFunction putableAnnuity(const cfl::Data::CashFlow &rAnnuity,
                                    cfl::InterestRateModel &rModel);

  /**
   * Computes the price of <strong>constant maturity
   * swaption</strong>.  At maturity \p dMaturity a holder of the
   * option can enter into the underlying CMS (constant maturity
   * swap) agreement. The maturity \p dMaturity becomes the issue
   * time of CMS. In the CMS the float interest is paid according to
   * the current swap rate in the swap contract which expires after
   * \p iCMSPeriods.
   *
   * @param rSwap The parameters of the underlying interest rate
   * swap.
   * @param dMaturity The maturity of the option.
   * @param iCMSPeriods The number of periods in the swap contract
   * which determines the float rate.
   * @param rModel The reference to the implementation of cfl::InterestRateModel.
   *
   * @return The price of the option as the function of the initial
   * values of the state processes in the model.
   */
  cfl::MultiFunction CMSwaption(const cfl::Data::Swap &rSwap,
                                double dMaturity,
                                unsigned iCMSPeriods,
                                cfl::InterestRateModel &rModel);

  /**
   * Computes the price of <strong>American constant maturity
   * swaption</strong>.  A holder of the option can enter into the
   * underlying CMS (constant maturity swap) agreement at any
   * exercise time. This time then becomes the issue time of CMS. In
   * the CMS the float interest is paid according to the market
   * swap rate in the swap contract expiring after \p iCMSPeriods.
   *
   * @param rSwap The parameters of the underlying interest rate
   * swap.
   * @param rExerciseTimes The set of exercise times. The first
   * exercise time is strictly greater than the initial time in the
   * model.
   * @param iCMSPeriods The number of periods in the swap contract
   * that determines the float rate.
   * @param rModel The reference to the implementation of cfl::InterestRateModel.
   *
   * @return The price of the option as the function of the initial
   * values of the state processes in the model.
   */
  cfl::MultiFunction americanCMSwaption(const cfl::Data::Swap &rSwap,
                                        const std::vector<double> &rExerciseTimes,
                                        unsigned iCMSPeriods,
                                        cfl::InterestRateModel &rModel);
  /** @} */
}

#endif // of __quant2_hpp__
