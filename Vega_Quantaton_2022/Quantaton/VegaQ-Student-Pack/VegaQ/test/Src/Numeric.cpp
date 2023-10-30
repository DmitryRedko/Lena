#include "test/Numeric.hpp"
#include <gsl/gsl_cdf.h>

using namespace cfl;
using namespace std;
using namespace test;

std::function<double(double)> test::gauss_cdf(double dMean, double dSigma)
{
  return [dMean, dSigma](double dX) {
	   double dP = gsl_cdf_gaussian_P(dX-dMean, dSigma);
	   return dP;
	 };
}
