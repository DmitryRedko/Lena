#include "prepExam/prepExam.hpp"
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

    double shape1(double dX)
    {
        PRECONDITION(dX >= 0);

        double dY = (dX > vega::EPS) ? (1 - std::exp(-dX)) / dX : (1. - dX / 2. + dX * dX / 6.);
        return dY;
    }

    double shape2(double dX)
    {
        PRECONDITION(dX >= 0);

        double dY = (dX > vega::EPS) ? (1 - std::exp(-dX) * (1. + dX)) / dX : (dX / 2. - dX * dX / 3.);
        return dY;
    }

}

std::function<double(double, double)>
vega::costOfCarry(double dSpot, double dInitialTime)
{
    return [dSpot, dInitialTime](double dF, double dT)
    {
        PRECONDITION(dT >= dInitialTime);

        double q = 0;
        if ((abs(log(dF) - log(dSpot)) < vega::EPS) && (abs(dT - dInitialTime) < vega::EPS))
        {
            q = (log(dF) - log(dSpot) + vega::EPS) / (dT - dInitialTime);
        }
        else
        {
            q = (log(dF) - log(dSpot)) / (dT - dInitialTime);
        }
        return q;
    };
}

std::function<double(double)>
vega::forwardFX(double dSpotFX, const std::function<double(double)> &rDomesticDiscount,
                const std::function<double(double)> &rForeignDiscount)
{
    return [dSpotFX, rDomesticDiscount, rForeignDiscount](double dT)
    {
        return dSpotFX * rForeignDiscount(dT) / rDomesticDiscount(dT);
    };
}

std::function<double(double)>
vega::yieldSvensson(double dC0, double dC1, double dC2, double dC3,
                    double dLambda1, double dLambda2, double dInitialTime)
{
    PRECONDITION(dLambda1 != dLambda2);

    return [dC0, dC1, dC2, dC3, dLambda1, dLambda2, dInitialTime](double dT)
    {
        PRECONDITION(dT >= dInitialTime);

        double Gamma = dC0 + dC1 * vega::shape1(dLambda1 * (dT - dInitialTime)) + dC2 * vega::shape2(dLambda1 * (dT - dInitialTime)) + dC3 * vega::shape2(dLambda2 * (dT - dInitialTime));
        return Gamma;
    };
}

std::function<double(double)>
vega::volatilityBlack(double dSigma, double dLambda, double dInitialTime)
{
    PRECONDITION(dLambda >= 0);
    PRECONDITION(dSigma >= 0);

    return [dSigma, dLambda, dInitialTime](double dT)
    {
        PRECONDITION(dT >= dInitialTime);
        double E = dSigma * sqrt(vega::shape1(2 * dLambda * (dT - dInitialTime)));
        return E;
    };
}

std::function<double(double)>
vega::forwardLibor(double dLiborPeriod,
                   const std::function<double(double)> &rDiscount)
{
    return [dLiborPeriod, rDiscount](double dT)
    {
        double L = 1 / (dT - dT + dLiborPeriod) * (rDiscount(dT));
        return L;
    };
}

std::function<double(double)>
vega::forwardCarryLinInterp(double dSpot,
                            const std::vector<double> &rDeliveryTimes,
                            const std::vector<double> &rForwardPrices,
                            double dInitialTime)
{
    return [dSpot, rDeliveryTimes, rForwardPrices, dInitialTime](double dT)
    {
        return 0;
    };
}
