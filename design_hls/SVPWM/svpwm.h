/*!
 * \file svpwm.h
 * \brief		Header file for SVPWM
 * \author 		Oleksandr Kiyenko
 * \version 	1.0
 * \date		2017
 * \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH
 */

#ifndef SVPWM_H
#define SVPWM_H

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
 * \brief SVPWM transformation as AXI4-Stream IP Core
 * \param s_axis Input AXI4-Stream with the following layout:
 * <ul>
 *   <li>Bits 0..15: \f$V_a\f$
 *   <li>Bits 16.31: \f$V_b\f$
 *   <li>Bits 32..47: \f$V_a\f$
 *   <li>Bits 48..63: Carried over to the output stream unchanged.
 * </ul>
 * All values are 16-bit signed integers.
 *
 * \param m_axis Output AXI4-Stream with the following layout:
 * <ul>
 *   <li>Bits 0..15: \f$V'_a\f$
 *   <li>Bits 16.31: \f$V'_b\f$
 *   <li>Bits 32..47: \f$V'_a\f$
 *   <li>Bits 48..63: Carried over from the input stream unchanged.
 * </ul>
 *
 * All values are 16-bit signed integers.
 * \return void - functions implementinga an IP cores do not return a value.
 */
void SVPWM(hls::stream<int64_t> &s_axis, hls::stream<int64_t> &m_axis);

#endif	// SVPWM_H
