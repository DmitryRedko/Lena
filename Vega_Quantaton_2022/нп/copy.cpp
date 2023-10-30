#include "prep2/prep2.hpp"
#include <cassert>
#include <cmath>
#include <numeric>
#include <algorithm>

using namespace std;

#define PRECONDITION assert
#define ASSERT assert
#define ASSERT assert

namespace vega
{
    const double EPS = 1E-10;
}

std::function<double(double)>
vega::carryBlack(double dTheta, double dLambda, double dSigma,
           double dInitialTime)
{
    return [](double dT)
    {
        return 0;
    };
}

std::function<double(double)>
vega::discountLogLinInterp(const std::vector<double> &rDiscountTimes,
                     const std::vector<double> &rDiscountFactors,
                     double dInitialTime)
{
    return [](double dT)
    {
        return 0;
    };
}

std::function<double(double)>
vega::discountVasicek(double dTheta, double dLambda, double dSigma,
                double dR0, double dInitialTime)
{
    return [](double dT)
    {
        return 0;
    };
}

std::function<double(double)>
vega::forwardAnnuity(double dRate, double dPeriod, double dMaturity,
               const std::function<double(double)> &rDiscount,
               bool bClean)
{
    return [](double dT)
    {
        return 0;
    };
}

std::function<double(double)>
vega::forwardStockDividends(double dSpot,
                      const std::vector<double> &rDividendsTimes,
                      const std::vector<double> &rDividends,
                      const std::function<double(double)> &rDiscount)
{
    return [](double dT)
    {
        return 0;
    };
}

std::function<double(double)>
vega::forwardSwapRate(double dPeriod, unsigned iNumberOfPayments,
                const std::function<double(double)> &rDiscount)
{
    return [](double dT)
    {
        return 0;
    };
}

std::function<double(double, double)>
vega::volatilityHullWhite(double dSigma, double dLambda,
                    double dInitialTime)
{
    return [](double dT, double dD)
    {
        return 0;
    };
}

std::function<double(double)>
vega::volatilityVar(const std::function<double(double)> &rVar, double dInitialTime)
{
    return [](double dT)
    {
        return 0;
    };
}

std::function<double(double)>
vega::volatilityVarLinInterp(const std::vector<double> &rTimes,
                       const std::vector<double> &rVols,
                       double dInitialTime)
{
    return [](double dT)
    {
        return 0;
    };
}

std::function<double(double)>
vega::yieldVasicek(double dTheta, double dLambda, double dSigma,
             double dR0, double dInitialTime)
{
    return [](double dT)
    {
        return 0;
    };
}
