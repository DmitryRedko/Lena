#ifndef __quant1_hpp__
#define __quant1_hpp__

/**
 * @file quant1.hpp
 * @author Dmitry Kramkov (kramkov@andrew.cmu.edu)
 * @brief Quantathon: set 1
 * @version 1
 * @date 2022-10-25
 * 
 * @copyright Copyright (c) 2021
 * 
 */

#include "cfl/Data.hpp"
#include "cfl/InterestRateModel.hpp"

/**
 * @mainpage Quantathon: set 1
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
   * Computes the price of <strong>forward swap lock</strong>.
   * In this contract, at maturity \p dMaturity the holder of the
   * contract enters the interest rate swap with the
   * parameters defined in \p rSwap and the issue time \p dMaturity.
   *
   * @param rSwap The parameters of the underlying swap.
   * @param dMaturity The maturity of the forward contract.
   * @param rModel The reference to the implementation of cfl::InterestRateModel.
   *
   * @return The price of the option as the function of the initial
   * values of the state processes in the model.
   */
  cfl::MultiFunction forwardSwapLock(const cfl::Data::Swap &rSwap,
                                     double dMaturity,
                                     cfl::InterestRateModel &rModel);

  /** 
   * Computes the price of <strong>interest rate collar</strong>.
   * 
   * @param rCap The parameters of the underlying interest rate
   * collar. Here \p rCap.rate defines the cap rate. 
   * @param dFloorRate The floor rate in the underlying interest
   * rate collar. 
   * @param rModel Reference to implementation of cfl::InterestRateModel.
   * 
   * @return The price of the option as the function of the initial
   * values of the state processes in the model.
   */
  cfl::MultiFunction collar(const cfl::Data::CashFlow &rCap, double dFloorRate,
                            cfl::InterestRateModel &rModel);

  /** 
   * Computes the price of <strong>American put on forward rate
   * agreement</strong>. In this contract, at any exercise time <em>t(i)</em>
   * holder of the option has the right to borrow notional amount \p
   * dNotional at interest rate \p dFixedRate for the period \p dPeriod. 
   * 
   * @param dFixedRate The fixed interest rate. 
   * @param dPeriod The period of interest rate loan. 
   * @param dNotional The notional amount. 
   * @param rExerciseTimes The vector of exercise times. The first
   * time is strictly greater than the initial time of the model. 
   * @param rModel The reference to the implementation of cfl::InterestRateModel.
   * 
   * @return The price of the option as the function of the initial
   * values of the state processes in the model.
   */
  cfl::MultiFunction americanPutOnFRA(double dFixedRate, double dPeriod,
                                      double dNotional,
                                      const std::vector<double> &rExerciseTimes,
                                      cfl::InterestRateModel &rModel);

  /** 
   * Computes the price of <strong>American swaption</strong>.
   * A holder of the option can enter into the underlying swap agreement at
   * any exercise time. This time then becomes the issue time of the swap.   
   * 
   * @param rSwap The parameters of the underlying interest rate
   * swap. 
   * @param rExerciseTimes The set of exercise times. The first
   * exercise time is strictly greater than the initial time in the
   * model. 
   * @param rModel Reference to implementation of cfl::InterestRateModel.
   * 
   * @return The price of the option as the function of the initial
   * values of the state processes in the model.
   */
  cfl::MultiFunction americanSwaption(const cfl::Data::Swap &rSwap,
                                      const std::vector<double> &rExerciseTimes,
                                      cfl::InterestRateModel &rModel);
  /** 
   * Computes the price of <strong>puttable and callable coupon
   * bond</strong>. 
   * In this contract, at any coupon time less than maturity the
   * following events take place in their respective order: 
   * <ol>
   * <li> The coupon payment. 
   * <li> Holder of the bond has the right to sell the bond to the
   * issuer. In this case, the holder receives the redemption amount
   * <code>rCouponBond.notional * dRedemptionPrice</code> and the bond is
   * terminated. 
   * <li> Issuer of the bond has the right to buy the bond back. In this
   * case, he pays the repurchase amount <code>rCouponBond.notional *
   * dRepurchasePrice</code> and the bond is terminated. 
   * </ol>
   *
   * @param rCouponBond The parameters of the underlying coupon
   * bond. The issue time for the bond coincides with the initial
   * time of the model. 
   * @param dRedemptionPrice The redemption price of the bond given
   * as a percentage of the notional. After the coupon payment, the
   * holder of the bond can sell it back to the issuer for the
   * amount <code>rCouponBond.notional * dRedemptionPrice</code>.
   * Typically, this amount is less than the notional.  
   * @param dRepurchasePrice The repurchase price of the bond given
   * as a percentage of the notional. After the coupon payment, 
   * the issuer of the bond can buy the bond back from the holder
   * for the amount <code>rCouponBond.notional *
   * dRepurchasePrice</code>. Usually, this amount is greater than
   * the notional. 
   * @param rModel Reference to implementation of cfl::InterestRateModel.
   * 
   * @return The price of the option as the function of the initial
   * values of the state processes in the model.
   */
  cfl::MultiFunction putCallBond(const cfl::Data::CashFlow &rCouponBond,
                                 double dRedemptionPrice,
                                 double dRepurchasePrice,
                                 cfl::InterestRateModel &rModel);

  /** 
   * Computes the <strong>futures price of  the cheapest bond to
   * deliver</strong>. 
   * The set of times, when the futures price is evaluated is given by 
   * \f[
   * t_i = t_0 + i\frac{T-t_0}{M}, \quad i=1,\dots,M, 
   * \f]
   * where \f$t_0=\f$ \p rModel.initialTime(), \f$T=\f$ \p
   * dFuturesMaturity, and \f$M=\f$ \p iFuturesTimes.  At the
   * maturity, the seller of the contract can deliver any bond from \p
   * rBonds.
   * 
   * @param dFuturesMaturity The maturity of the futures contract. 
   * @param iFuturesTimes The number of futures times, that is, the
   * times when the futures price is determined. 
   * @param rBonds The parameters of the underlying bonds. We assume
   * that the issue times for all bonds equal \p dFuturesMaturity. 
   * @param rModel The reference to the implementation of
   * cfl::InterestRateModel.
   * 
   * @return The price of the option as the function of the initial
   * values of the state processes in the model.
   */
  cfl::MultiFunction
  futuresOnCheapToDeliver(double dFuturesMaturity,
                          unsigned iFuturesTimes,
                          const std::vector<cfl::Data::CashFlow> &rBonds,
                          cfl::InterestRateModel &rModel);
  /** @} */
}

#endif // of __quant1_hpp__
