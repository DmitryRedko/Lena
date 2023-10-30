#ifndef __test_all_HullWhite_h__
#define __test_all_HullWhite_h__

/**
 * @file HullWhite.hpp
 * @author Dmitry Kramkov (kramkov@andrew.cmu.edu)
 * @brief Testing of Hull and White models. 
 * @version 1.0
 * @date 2021-01-18
 * 
 * @copyright Copyright (c) 2021
 * 
 */

#include "cfl/HullWhiteModel.hpp"
#include "test/Print.hpp"


namespace test
{
  /**
   * @brief Testing in Hull and White model. 
   * 
   */
  namespace HullWhite
  {
    /** 
     *
     * @defgroup test_all_HW Testing in Hull and White model. 
     * 
     * This module contains testing functions for the 
     * Hull and White model of interest rates. 
     *
     * @{
     */

    /**
     * The default interest rate. 
     * 
     */
    const double c_dYield = 0.07;

    /**
     * The default volatility of short-term interest rate. 
     * 
     */
    const double c_dHullWhiteSigma = 0.02;

    /**
     * The default mean-reversion rate. 
     * 
     */
    const double c_dLambda = 0.05;

    /**
     * The default initial time. 
     * 
     */
    const double c_dInitialTime = 0;

    /**
     * Returns input data for Hull and White model of interest rates. 
     * 
     * @param dYield The interest rate. 
     * @param dSigma The volatility of short-term interest rate. 
     * @param dLambda The mean-reversion rate. 
     * @param dInitialTime The initial time. 
     * @return cfl::HullWhite::Data 
     */
    cfl::HullWhite::Data data(double dYield = c_dYield,
                              double dSigma = c_dHullWhiteSigma,
                              double dLambda = c_dLambda,
                              double dInitialTime = c_dInitialTime);

    /**
     * The quality parameter of model implementation. 
     * 
     */
    const double c_dQuality = 200;

    /**
     * The default implementation of Hull-White model for testing purposes. 
     * 
     * @param dQuality The quality of model's implementation. 
     * @return cfl::InterestRateModel 
     */
    cfl::InterestRateModel model(double dQuality = c_dQuality);
    
    /**
     * The default maturity for an option. 
     * 
     */
    const double c_dMaturity = c_dInitialTime + 1.5;

    /**
     * The default notional. 
     * 
     */
    const double c_dNotional = 1000.;

    /**
     * The default interval between two payments. 
     * 
     */
    const double c_dPeriod = 0.25;

    /**
     * The default number of payments. 
     * 
     */
    const unsigned c_iNumberOfPeriods = 6;

    /**
     * Returns some default vector of exercise times. 
     * 
     * @return std::vector<double> 
     */
    std::vector<double> exerciseTimes();

    /**
     * Returns some default vector of barrier times. 
     * 
     * @return std::vector<double> 
     */
    std::vector<double> barrierTimes();

    /**
     * Returns some default parameters for an interest rate swap. 
     * 
     * @return cfl::Data::Swap 
     */
    cfl::Data::Swap swapParameters();

    /**
     * The interval of initial values for short-term rates. 
     * 
     */
    const double c_dInterval = 0.2;

    /**
     * The number of points in the output. 
     * 
     */
    const unsigned c_iPoints = 10;

    /**
     * Prints results of valuation of an option on a single stock. 
     * 
     * @param f The testing function. 
     * @param rModel The reference to InterestRateModel. 
     */
    void report(cfl::MultiFunction (*f)(cfl::InterestRateModel &rModel),
		cfl::InterestRateModel &rModel);

    /**
     * Prints results of valuation of an option on a single stock. 
     * 
     * @param f The testing function; \p bPayFloat is a parameter for some
     * swap-like derivatives. 
     * @param rModel The reference to InterestRateModel. 
     */
    void report(cfl::MultiFunction (*f)(cfl::InterestRateModel &rModel, bool bPayFloat),
                cfl::InterestRateModel &rModel);

    /** @} */
  } // namespace HullWhite
} // namespace test

#include "test/Inline/iHullWhite.hpp"
#endif // of __test_all_HullWhite_h__
