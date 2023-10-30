//do not include this file

inline void
cfl::InterestRatePathModel::assignEventTimes(const std::vector<double> &rEventTimes)
{
  //initial time should be the same
  PRECONDITION(rEventTimes.front() == eventTimes().front());
  m_pModel.reset(m_pModel->newModel(rEventTimes));
}

inline unsigned
cfl::InterestRatePathModel::addState(const cfl::PathDependent &rState)
{
  m_pModel.reset(m_pModel->newModel(rState));
  return model().numberOfStates()-1;
}

inline const cfl::IModel & 
cfl::InterestRatePathModel::model() const 
{ 
  return m_pModel->model(); 
}


inline const std::vector<double> &
cfl::InterestRatePathModel::eventTimes() const
{
  return model().eventTimes();
}

inline double
cfl::InterestRatePathModel::initialTime() const
{
  return eventTimes().front();
}

inline cfl::Slice
cfl::InterestRatePathModel::cash(unsigned iTime, double dAmount) const
{
  return Slice(&model(), iTime, dAmount);
}

inline cfl::Slice
cfl::InterestRatePathModel::discount(unsigned iTime, double dBondMaturity) const
{
  PRECONDITION(eventTimes()[iTime] <= dBondMaturity);
  return m_pModel->discount(iTime, dBondMaturity);
}

inline cfl::Slice 
cfl::InterestRatePathModel::state(unsigned iEventTime, unsigned iState) const
{
  return model().state(iEventTime, iState);
}
