#ifndef __cflBrownian_hpp__
#define __cflBrownian_hpp__

/**
 * @file Brownian.hpp
 * @author Dmitry Kramkov (kramkov@andrew.cmu.edu)
 * @brief Financial model driven by Brownian motion.
 * @version 1.0
 * @date 2021-01-12
 *
 * @copyright Copyright (c) 2020
 *
 */

#include "Slice.hpp"
#include "GaussRollback.hpp"
#include "Interp.hpp"
#include "Ind.hpp"

namespace cfl
{
  /**
   * @ingroup cflCommonElements
   *
   * @defgroup cflBrownian Basic model with Brownian motion.
   *
   * This module contains implementation of the basic financial
   * model where the state process is a one-dimensional Brownian motion.
   * @{
   */

  /**
   * Returns cfl::Model representing a Brownain motion given
   * - \a rVar The vector of variances of the Brownian motion.
   *   \a rVar[i] defines the average variance between \a rEventTimes[0]
   *   and \a rEventTimes[i]. This vector has the same size as
   *   the vector of event times.
   * - \a rEventTimes The vector of event times in the model.
   * - \a dInterval The width of the interval of initial values for
       the Brownian motion.
   */
  typedef std::function<Model(const std::vector<double> &rVar,
                              const std::vector<double> &rEventTimes,
                              double dInterval)>
      TBrownian;

  /**
   * Implements the constructor of Brownian model.  The storage in the
   * Brownian model will be in the form of symmetric equally spaced
   * grid with \f$ 2^n \f$ elements (to facilitate the use of radix-2
   * Fast Fourier Transform).
   *
   * @param dQuality A trade-off between speed and accuracy of the
   * implementation of the basic state process.
   * @param rRollback An implementation of the operator of conditional
   * expectation with respect to gaussian distribution.
   * @param rInd A numerically efficient implementation of
   * discontinuous functions.
   * @param rInterp An implementation of numerical interpolation.
   * @return TBrownianModel The constructor of Brownian motion.
   */
  TBrownian
  brownian(double dQuality,
           const GaussRollback &rRollback = cfl::NGaussRollback::chain(),
           const Ind &rInd = cfl::NInd::linear(),
           const Interp &rInterp = cfl::NInterp::cspline());
  /** @} */
} // namespace cfl

#endif // of __cflBrownian_hpp__
