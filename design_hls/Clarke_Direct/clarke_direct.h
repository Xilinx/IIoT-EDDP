/*!
 * \file clarke_direct.h
 * \brief		Header file for the Clarke transform
 * \author 		Oleksandr Kiyenko
 * \version 	1.0
 * \date		2017
 * \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH
 */

#ifndef CLARKE_DIRECT_H
#define CLARKE_DIRECT_H

#include <hls_stream.h>
#include <ap_axi_sdata.h>
#include <ap_int.h>
#include <ap_cint.h>
#include <stdint.h>

/// \brief Maximum positive value for saturated arithmetic.
#define MAX_LIM				32767

/// \brief Minimum negative value for saturated arithmetic.
#define MIN_LIM				-32767

/// \brief The number \f$\frac{1}{\sqrt{3}}\f$ in the Q16.16 format.
#define SQRT3A				0x000093CD

/**
 * \brief Clark transform as AXI4-Stream IP core
 *
 * It calculates the values \f$I_\alpha\f$ and \f$I_\beta\f$ in the ouput AXI4-Stream \p m_axis
 * by using the following equations:
 * \f{equation}{
 *  I_\alpha = I_a,
 * \f}
 * \f{equation}{
 *  I_\beta = \frac{I_a + 2I_b}{\sqrt{3}},
 * \f}
 * where \f$I_a\f$ and \f$I_b\f$ are from the input AXI4-Stream \p s_axis.
 * 
 * \param s_axis Input AXI4-Stream with the following layout:
 * <ul>
 *   <li> Bits 0..15: First phase current \f$I_a\f$, from the ADC.
 *   <li> Bits 16..31: Second phase current \f$I_b\f$, from the ADC.
 *   <li> Bits 32..47: Speed, in RPM, just passed through.
 *   <li> Bits 48..63: Angle, in encoder steps, just passed through.
 * </ul>
 * All values are 16-bit signed integers.
 *
 * \param m_axis Output AXI4-Stream with the following layout:
 * <ul>
 *   <li> Bits 0..15: \f$I_\alpha\f$
 *   <li> Bits 16..31: \f$I_\beta\f$
 *   <li> Bits 32..47: Speed, in RPM.
 *   <li> Bits 48..63: Angle, in encoder steps.
 * </ul>
 * All values are 16-bit signed integers.
 *
 * \return void - functions implementing an IP core do not return a value.
 */
void Clarke_Direct(hls::stream<int64_t> &s_axis, hls::stream<int64_t> &m_axis);

#endif	// CLARKE_DIRECT_H
