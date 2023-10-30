// do not include this file

inline cfl::InterestRateModel
cfl::HullWhite::model(const Data &rData,
                      double dInterval, double dQuality)
{
  return cfl::HullWhite::model(rData, dInterval, brownian(dQuality));
}
