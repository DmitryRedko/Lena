#ifndef __cflSlice_hpp__
#define __cflSlice_hpp__

/**
 * @file Slice.hpp
 * @author Dmitry Kramkov (kramkov@andrew.cmu.edu)
 * @brief State process in cfl. 
 * @version 1.0
 * @date 2021-01-12
 * 
 * @copyright Copyright (c) 2020
 * 
 */

#include <algorithm>
#include <valarray>
#include "cfl/Model.hpp"
#include "cfl/Error.hpp"

namespace cfl
{
  class IModel;

  /**
   * @ingroup cflCommonElements 
   * 
   * @defgroup cflBasicElements Basic classes: Slice and IModel.
   * 
   * This module contains the basic classes of the library:
   * interface class IModel and concrete class Slice.
   * @{
   */

  /**
   * @brief  Representation of random variables in financial models. 
   *
   * This class models random payoffs defined at a particular event
   * time of a model. More precisely, Slice is a random variable
   * determined by the current values of the state processes.
   * 
   * @see IModel
   */
  class Slice
  {
  public:
    /** 
     * Constructs a payoff with constant value \p dValue at
     * the event time with index \p iEventTime in the framework of the
     * financial model defined by an implementation of the interface
     * class IModel.
     * 
     * @param pModel A pointer to an implementation of the interface class IModel.  
     * @param iEventTime The index of current event time.
     * @param dValue The current constant value of the payoff. 
     */
    explicit Slice(const IModel *pModel = 0, unsigned iEventTime = 0, double dValue = 0);

    /** 
     * Constructs a random payoff at given event time. 
     * 
     * @param rModel A constant reference to the underlying model which implements 
     * the interface class IModel. 
     * @param iEventTime The index of the current time in the vector of event times 
     * of the underlying model. 
     * @param rDependence A constant reference to the vector of indexes 
     * of state processes of underlying model which determine the values 
     * of \p *this. 
     * @param rValues An array of values of the random payoff represented by \p *this. 
     * The size of this array should be equal the result of  
     * \p rModel.numberOfNodes(iEventTime, rDependence).
     */
    Slice(const IModel &rModel, unsigned iEventTime, const std::vector<unsigned> &rDependence,
          const std::valarray<double> &rValues);

    /** 
     * Assignment operator. Replaces \p *this with a copy of \p rSlice.
     * 
     * @param rSlice Object that will be copied. 
     * @return Reference to \p *this. 
     */
    Slice &operator=(const Slice &rSlice);

    /** 
     * Assignment operator. Replaces \p *this with the Slice object defined at the same 
     * event time and having constant value \p dValue. 
     * 
     * @param dValue The constant value that will be assigned to \p *this.
     * @return Reference to \p *this. 
     */
    Slice &operator=(double dValue);

    /**
     * Adds to \p *this the number \p dValue. 
     * 
     * @param dValue The constant value that will be added to \p *this. 
     * @return Reference to \p *this. 
     */
    Slice &operator+=(double dValue);

    /** 
     * Subtracts from \p *this the number \p dValue.
     * 
     * @param dValue The constant value that will be subtracted from \p *this. 
     * @return Reference to \p *this. 
     */
    Slice &operator-=(double dValue);

    /**
     * Multiplies \p *this on the number \p dValue.
     * 
     * @param dValue The constant multiplier.  
     * @return Reference to \p *this. 
     */
    Slice &operator*=(double dValue);

    /**
     * Divides \p *this on the number \p dValue. 
     * 
     * @param dValue The constant divisor.  
     * @return Reference to \p *this. 
     */
    Slice &operator/=(double dValue);

    /** 
     * Adds to \p *this the value of the payoff represented by \p rSlice. 
     * Both objects \p *this and \p rSlice should be 
     * defined on the same model and at the same event time. 
     * 
     * @param rSlice The payoff that will be added to \p *this. 
     * @return Reference to \p *this. 
     */
    Slice &operator+=(const Slice &rSlice);

    /** 
     * Subtracts from \p *this the value of payoff represented by \p rSlice. 
     * Both objects \p *this and \p rSlice should be 
     * defined on the same model and at the same event time. 
     * 
     * @param rSlice The payoff that will be subtracted from \p *this. 
     * @return Reference to \p *this. 
     */
    Slice &operator-=(const Slice &rSlice);

    /** Multiplies \p *this on the value of payoff represented by \p rSlice. 
     * Both objects \p *this and \p rSlice should be defined on the same model 
     * and at the same event time.
     * 
     * @param rSlice The multiplier. 
     * @return Reference to \p *this. 
     */
    Slice &operator*=(const Slice &rSlice);

    /** Divides \p *this on the value of payoff represented by \p rSlice. 
     * Both objects \p *this and \p rSlice should be 
     * defined on the same model and at the same event time. 
     * 
     * @param rSlice The divisor. 
     * @return Reference to \p *this. 
     */
    Slice &operator/=(const Slice &rSlice);

    /** 
     * Returns payoff in the form <code>f(*this)</code>. 
     * 
     * @param f The transformation function. 
     * @return The payoff in the form <code> f(*this) </code>. 
     */
    Slice apply(double (*f)(double)) const;

    /** 
     * This member function is usually used if \p *this represents the 
     * value of a (derivative) security. It assigns to \p *this the equivalent 
     * value of this security at event time with smaller index \p iEventTime. 
     * 
     * @param iEventTime The index of the target event time. It should be smaller or 
     * equal the initial index of event time for \p *this. 
     */
    void rollback(unsigned iEventTime);

    /** 
     * Accessor function to the implementation of IModel that was used to support 
     * current Slice object. 
     * 
     * @return The constant reference to the underlying model. 
     */
    const IModel &model() const;

    /** 
     * Accessor function to the index of event time where \p *this is defined. 
     * 
     * @return Index of event time where \p *this is defined. 
     */
    unsigned timeIndex() const;

    /** 
     * Accessor function to the vector of indexes of state processes which determine 
     * the random variable represented by \p *this. 
     * 
     * @return Constant reference to the vector of indexes on state processes 
     * that participate in the construction of the given Slice object. 
     */
    const std::vector<unsigned> &dependence() const;

    /** 
     * Constant accessor function to the values of \p *this.
     * 
     * @return The constant reference to the array of values of the given Slice object.  
     */
    const std::valarray<double> &values() const;

      /** 
     * Non-constant accessor function to the values of \p *this.
     * 
     * @return The reference to the array of values of the given Slice object.  
     */
    std::valarray<double> &values();

    /** 
     * Replaces the underlying model, the index of event times, the vector of indexes 
     * of state processes, and array of values with \p rModel, \p iEventTime, \p rDependence,
     * and \p rValues.
     * 
     * @param rModel The reference to an implementation of interface class IModel. 
     * @param iEventTime The index of new event time for \p *this. 
     * @param rDependence The new vector of indexes of state processes. 
     * @param rValues The new array of values. 
     */
    void assign(const IModel &rModel,
                unsigned iEventTime,
                const std::vector<unsigned> &rDependence,
                const std::valarray<double> &rValues);

    /** 
     * Replaces the index of event times, the vector of indexes 
     * of state processes, and array of values with \p iEventTime, \p rDependence, 
     * and \p rValues. 
     * 
     * @param iEventTime The index of new event time for \p *this. 
     * @param rDependence The new vector of indexes of state processes. 
     * @param rValues The new array of values.
     */
    void assign(unsigned iEventTime, const std::vector<unsigned> &rDependence,
                const std::valarray<double> &rValues);

    /** 
     * Replaces vector of indexes of state processes and array of values 
     * with \p rDependence and \p rValues.
     * 
     * @param rDependence The new vector of indexes of state processes. 
     * @param rValues The new array of values. 
     */
    void assign(const std::vector<unsigned> &rDependence,
                const std::valarray<double> &rValues);

    /** 
     * Replaces underlying model with \p rModel. 
     * 
     * @param rModel The reference to an implementation of interface class IModel.
     */
    void assign(const IModel &rModel);

  private:
    const IModel *m_pModel;
    unsigned m_iEventTime;
    std::vector<unsigned> m_uDependence;
    std::valarray<double> m_uValues;
    Slice &apply(const Slice &rSlice, void (*func)(std::valarray<double> &,
                                                   const std::valarray<double> &));
  };

  /** 
   * Returns minus \p rSlice. 
   * 
   * @param rSlice Some Slice object. 
   * @return Minus of \p rSlice. 
   */
  Slice operator-(const Slice &rSlice);

  /** 
   * Returns the sum of  \p rSlice1 and \p rSlice2. Both input 
   * parameters should be defined on the same model and at the 
   * same event time. 
   * 
   * @param rSlice1 The first element of the sum. 
   * @param rSlice2 The second element of the sum
   * @return The sum of \p rSlice1 and \p rSlice2. 
   */
  Slice operator+(const Slice &rSlice1, const Slice &rSlice2);

  /** 
   * Returns the difference between  \p rSlice1 and \p rSlice2. 
   * Both input parameters should be defined on the same model 
   * and at the same event time.
   * 
   * @param rSlice1 The first element of the difference. 
   * @param rSlice2 The second element of the difference.
   * @return The difference between \p rSlice1 and \p rSlice2. 
   */
  Slice operator-(const Slice &rSlice1, const Slice &rSlice2);

  /** 
   * Returns the product of  \p rSlice1 and \p rSlice2. 
   * Both input parameters should be defined on the same model 
   * and at the same event time. 
   * 
   * @param rSlice1 The first multiplier. 
   * @param rSlice2 The second multiplier.
   * @return The product of \p rSlice1 and \p rSlice2. 
   */
  Slice operator*(const Slice &rSlice1, const Slice &rSlice2);

  /** 
   * Returns the ratio  \p rSlice1 and \p rSlice2. 
   * Both input parameters should be defined on the same model 
   * and at the same event time. 
   * 
   * @param rSlice1 The dividend. 
   * @param rSlice2 The divisor.
   * @return The ratio  between \p rSlice1 and \p rSlice2. 
   */
  Slice operator/(const Slice &rSlice1, const Slice &rSlice2);

  /** 
   * Returns the sum of \p rSlice and \p dValue. 
   * 
   * @param rSlice The first element of the sum. 
   * @param dValue The second element of the sum. 
   * @return The Slice object that is the sum of \p rSlice and \p dValue. 
   */
  Slice operator+(const Slice &rSlice, double dValue);

  /** 
   * Returns the difference between  \p rSlice and \p dValue.
   * 
   * @param rSlice The first element in subtraction. 
   * @param dValue The second element in subtraction. 
   * @return The Slice object that is the difference between \p rSlice and \p dValue.  
   */
  Slice operator-(const Slice &rSlice, double dValue);

  /**
   *  Returns the product of  \p rSlice and \p dValue.
   * 
   * @param rSlice The first multiplier. 
   * @param dValue The second multiplier. 
   * @return The Slice object that is the difference between \p rSlice and \p dValue.  
   */
  Slice operator*(const Slice &rSlice, double dValue);

  /** 
   * Returns the ratio of  \p rSlice and \p dValue. 
   * 
   * @param rSlice The dividend. 
   * @param dValue The constant divisor.
   * @return The ratio between \p rSlice and \p dValue. 
   */
  Slice operator/(const Slice &rSlice, double dValue);

  /** 
   * Returns the sum of  \p dValue and \p rSlice. 
   * 
   * @param dValue The first element of the sum. 
   * @param rSlice The second element of the sum. 
   * @return The sum of \p dValue and \p rSlice. 
   */
  Slice operator+(double dValue, const Slice &rSlice);

  /** 
   * Returns the difference between  \p dValue and \p rSlice.
   * 
   * @param dValue The first element in subtraction. 
   * @param rSlice The second element in subtraction. 
   * @return The difference of \p dValue and \p rSlice. 
   */
  Slice operator-(double dValue, const Slice &rSlice);

  /** 
   * Returns the product of  \p dValue and \p rSlice. 
   * 
   * @param dValue The first multiplier. 
   * @param rSlice The second multiplier. 
   * @return The product of \p dValue and \p rSlice. 
   */
  Slice operator*(double dValue, const Slice &rSlice);

  /** 
   * Returns the ratio of  \p dValue and \p rSlice. 
   * 
   * @param dValue The dividend. 
   * @param rSlice The divisor. 
   * @return The ratio of \p dValue and \p rSlice. 
   */
  Slice operator/(double dValue, const Slice &rSlice);

  /** 
   * Returns the maximum of \p rSlice and \p dValue.
   * 
   * @param dValue A number. 
   * @param rSlice Some payoff. 
   * @return The maximum of \p dValue and \p rSlice. 
   */
  Slice max(const Slice &rSlice, double dValue);

  /** 
   * Returns the minimum of \p rSlice and \p dValue.
   * 
   * @param dValue A number. 
   * @param rSlice Some payoff. 
   * @return The minimum of \p rSlice and \p dValue. 
   */
  Slice min(const Slice &rSlice, double dValue);

  /** 
   * Returns the maximum of \p rSlice1 and \p rSlice2. 
   * Both input parameters should be defined on the same model 
   * and at the same event time. 
   * 
   * @param rSlice1 Some payoff. 
   * @param rSlice2 Some payoff. 
   * @return The maximum of \p rSlice1 and \p rSlice2. 
   */
  Slice max(const Slice &rSlice1, const Slice &rSlice2);

  /** 
   * Returns the minimum of \p rSlice1 and \p rSlice2. 
   * Both input parameters should be defined on the same model 
   * and at the same event time.
   * 
   * @param rSlice1 Some payoff. 
   * @param rSlice2 Some payoff. 
   * @return The minimum of \p rSlice1 and \p rSlice2. 
   */
  Slice min(const Slice &rSlice1, const Slice &rSlice2);

  /** 
   * Returns the maximum of \p rSlice and \p dValue. 
   * 
   * @param dValue A constant value.  
   * @param rSlice Some random payoff. 
   * @return The maximum of \p dValue and \p rSlice.
   */
  Slice max(double dValue, const Slice &rSlice);

  /** 
   * Returns the minimum of \p rSlice and \p dValue. 
   * 
   * @param dValue A constant value.  
   * @param rSlice Some random payoff. 
   * @return The minimum of \p dValue and \p rSlice.
   */
  Slice min(double dValue, const Slice &rSlice);

  /** 
   * Returns the representation of the random variable given by \p rSlice
   * in the power \p dPower.
   * 
   * @param rSlice Some random payoff.
   * @param dPower The power. 
   * @return The random variable given by <code> rSlice^dPower </code>. 
   */
  Slice pow(const Slice &rSlice, double dPower);

  /** 
   * Returns the absolute value of \p rSlice.
   * 
   * @param rSlice Some random payoff. 
   * @return The absolute value of \p rSlice. 
   */
  Slice abs(const Slice &rSlice);

  /** 
   * Returns exponential of \p rSlice. 
   * 
   * @param rSlice Some random payoff. 
   * @return The random variable given by <code>exp(rSlice)</code>. 
   */
  Slice exp(const Slice &rSlice);

  /** 
   * Returns logarithm of \p rSlice. 
   * 
   * @param rSlice Some random payoff. 
   * @return The random variable given by <code> log(rSlice) </code>. 
   */
  Slice log(const Slice &rSlice);

  /** 
   * Returns squire root of \p rSlice. 
   * 
   * @param rSlice Some random payoff. 
   * @return The random variable given by <code> sqrt(rSlice) </code>. 
   */
  Slice sqrt(const Slice &rSlice);

  /** 
   * Returns the indicator of the event: \p rSlice is greater than \p dBarrier.
   * 
   * @param rSlice Some random payoff. 
   * @param dBarrier Lower barrier. 
   * @return The random variable given by <code> I(rSlice > dBarrier) </code>. 
   */
  Slice indicator(const Slice &rSlice, double dBarrier);

  /** 
   * Returns the indicator of the event: \p dBarrier is greater than \p rSlice.
   * 
   * @param dBarrier Upper barrier. 
   * @param rSlice Some random payoff. 
   * @return The random variable given by <code> I(dBarrier > rSlice) </code>. 
   */
  Slice indicator(double dBarrier, const Slice &rSlice);

  /** 
   * Returns the indicator of the event: \p rSlice is greater than \p rBarrier.
   * Both input parameters should be defined on the same model 
   * and at the same event time.
   * 
   * @param rSlice Some random payoff. 
   * @param rBarrier Random variable describing lower barrier. 
   * @return The random variable given by <code> I(rSlice > rBarrier) </code>. 
   */
  Slice indicator(const Slice &rSlice, const Slice &rBarrier);

  /** 
   * Returns the equivalent value of the derivative security 
   * represented by \p rSlice at event time with index \p iEventTime. 
   * The index of event time for \p rSlice should be greater or equal 
   * \p iEventTime. 
   * 
   * @param rSlice A random payoff. 
   * @param iEventTime Index of event time, when the price of \p rSlice will 
   * be computed. 
   * @return The price of the random payoff given by \p rSlice at 
   * event time with the index \p iEventTime. 
   */
  Slice rollback(const Slice &rSlice, unsigned iEventTime);

  /**
   * @copydoc IModel::interpolate
   */
  MultiFunction interpolate(const Slice &rSlice);

  /** 
   * Returns the function that interpolates \p rSlice with respect to 
   * state processes with indexes \p rStates. Other states are set to 
   * to their initial values. 
   * 
   * @param rSlice Some random payoff. 
   * @param rState The indexes of state processes that will be present in 
   * the result. 
   * @return The explicit functional dependence of the random payoff
   * represented by \p rSlice on state processes with indexes \p rState. 
   */
  MultiFunction interpolate(const Slice &rSlice,
                            const std::vector<unsigned> &rState);

  /** 
   * Returns the function that interpolates \p rSlice with respect to 
   * state processes with indexes less than \p iStates. Other states are set to 
   * to their initial values. 
   * 
   * @param rSlice Some random payoff. 
   * @param iStates The number of first state processes that will be present in 
   * the result. 
   * @return The explicit functional dependence of the random payoff
   * represented by \p rSlice on state processes with indexes less
   * than \p iStates. 
   */
  MultiFunction interpolate(const Slice &rSlice, unsigned iStates);

  /** 
   * Returns the value of random variable represented by \p rSlice at
   * initial values of state processes. This function is 
   * usually used at initial time. 
   * 
   * @param rSlice Some random payoff. 
   * @return The value of random variable represented by \p rSlice at initial 
   * values of state processes. 
   */
  double atOrigin(const Slice &rSlice);
  /** @} */
} // namespace cfl

#include "cfl/Inline/iSlice.hpp"
#endif // of__cflSlice_hpp__
