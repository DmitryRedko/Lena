#include "cfl/Interp.hpp"
#include "cfl/Error.hpp"
#include <gsl/gsl_spline.h>

using namespace cfl;

// class Interp

cfl::Interp::Interp(IInterp *pNewP)
    : m_uP(pNewP) {}

// class Interp_GSL

class Interp_GSL : public IInterp
{
public:
  Interp_GSL(const gsl_interp_type *pT) : m_pT(pT) {}

  Function
  interpolate(const std::vector<double> &rArg, const std::vector<double> &rVal) const
  {
    PRECONDITION((rArg.size() == rVal.size()) && (rArg.size() >= 2));
    PRECONDITION(is_sorted(rArg.begin(), rArg.end(), std::less_equal<double>()));

    // if size is 1 or 2 we do linear interpolation
    const gsl_interp_type *pT = (rArg.size() > 2) ? m_pT : gsl_interp_linear;

    std::shared_ptr<gsl_spline> uS(gsl_spline_alloc(pT, rArg.size()), &gsl_spline_free);
    //copies of rArg and rVal will be created
    gsl_spline_init(uS.get(), rArg.data(), rVal.data(), rArg.size());

    std::shared_ptr<gsl_interp_accel> uAcc(gsl_interp_accel_alloc(), &gsl_interp_accel_free);

    std::function<double(double)> uF = [uS, uAcc](double dX)
    {
      return gsl_spline_eval(uS.get(), dX, uAcc.get());
    };

    return Function(uF, rArg.front(), rArg.back());
  }

private:
  const gsl_interp_type *m_pT;
};

// functions from NInterp

cfl::Interp cfl::NInterp::linear()
{
  return Interp(new Interp_GSL(gsl_interp_linear));
}

cfl::Interp cfl::NInterp::cspline()
{
  return Interp(new Interp_GSL(gsl_interp_cspline));
}

cfl::Interp cfl::NInterp::steffen()
{
  return Interp(new Interp_GSL(gsl_interp_steffen));
}

cfl::Interp cfl::NInterp::akima()
{
  return Interp(new Interp_GSL(gsl_interp_akima));
}

cfl::Interp cfl::NInterp::polynomial()
{
  return Interp(new Interp_GSL(gsl_interp_polynomial));
}
