#ifndef __test_all_Numeric_hpp__
#define __test_all_Numeric_hpp__

/**
 * @file Numeric.hpp
 * @author Dmitry Kramkov (kramkov@andrew.cmu.edu)
 * @brief Collections of testing functions. 
 * @version 1.0
 * @date 2021-01-12
 * 
 * @copyright Copyright (c) 2020
 * 
 */

#include "test/Print.hpp"

namespace test
{
  /**
   * @ingroup test_all
   * 
   * @{
   */

  /**
   * Returns distribution function for the gaussian distribution with
   * mean \p dMean and standard deviation \p dVar. 
   * 
   * @param dMean The mean. 
   * @param dSigma The standard deviation. 
   * @return std::function<double(double)> 
   */
  std::function<double(double)> gauss_cdf(double dMean, double dSigma);
  /** @} */
} // namespace test

#endif // of __test_all_Numeric_hpp__
