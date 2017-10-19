/*!
 * \file park_inverse.h
 * \brief		Header file for the inverse Park's transform
 * \author 		Oleksandr Kiyenko
 * \version 	1.0
 * \date		2017
 * \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH
 */

#ifndef PARK_INVERSE_H
#define PARK_INVERSE_H

#include <hls_stream.h>
#include <ap_axi_sdata.h>
#include <ap_int.h>
#include <ap_cint.h>
#include <stdint.h>

/// \brief Maximum positive value for saturated arithmetic.
#define MAX_LIM				32767

/// \brief Minimum negative value for saturated arithmetic.
#define MIN_LIM				-32767

/**
 * \brief Inverse Park's transform as an AXI4-Stream IP core
 *
 * It calculates the values \f$V_\alpha\f$ and \f$V_\beta\f$ in the output AXI4-Stream \p m_axis
 * by using the following equations:
 * \f{equation}{
 *  V_\alpha = V_d \cos \theta - V_q \sin \theta,
 * \f}
 * \f{equation}{
 *  V_\beta = V_d \sin \theta + V_q \cos \theta,
 * \f}
 * where \f$V_d\f$, \f$V_q\f$ and \f$\theta\f$ are from the input AXI4-Stream \p s_axis
 *
 * \param s_axis Input AXI4-Stream with the following layout:
 * <ul>
 *   <li> Bits 0..15: \f$V_d\f$.
 *   <li> Bits 16..31: \f$V_q\f$.
 *   <li> Bits 32..47: Angle \f$\theta\f$, in encoder steps.
 *   <li> Bits 48..63: Not used.
 * </ul>
 * All values are 16-bit signed integers.
 *
 * \param m_axis Output AXI4-Stream with the following layout:
 * <ul>
 *   <li> Bits 0..15: \f$V_\alpha\f$
 *   <li> Bits 16..31: \f$V_\beta\f$
 *   <li> Bits 32..47: Angle \f$\theta\f$, in encoder steps.
 *   <li> Bits 48..63: 0.
 * </ul>
 * All values are 16-bit signed integers.
 *
 * \return void - functions implementing an IP core do not return a value.
 */
void Park_Inverse(hls::stream<int64_t> &s_axis, hls::stream<int64_t> &m_axis);

#endif	// PARK_INVERSE_H
