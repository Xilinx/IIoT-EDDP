/*
The 3-Clause BSD License

SPDX short identifier: BSD-3-Clause

Copyright 2016-2017 Trenz Electronic GmbH

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/
/*!
 * \file clarke_inverse.h
 * \brief		Header file for the inverse Clarke transform
 * \author 		Oleksandr Kiyenko
 * \version 	1.0
 * \date		2017
 * \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH
 */

#ifndef CLARKE_INVERSE_H
#define CLARKE_INVERSE_H

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
#define SQRT3C				0x0000DDB4

/**
 * \brief Inverse Clarke transform as AXI4-Stream IP core.
 *
 * It calculates the values \f$V_a\f$, \f$V_b\f$ and \f$V_c\f$ in the ouput AXI4-Stream \p m_axis
 * by using the following equations:
 * \f{equation}{
 *  V_a = V_\alpha,
 * \f}
 * \f{equation}{
 *  V_b = \frac{ -V_\alpha + \sqrt{3}V_\beta}{2},
 * \f}
 * \f{equation}{
 *  V_c = \frac{ -V_\alpha - \sqrt{3}V_\beta}{2}.
 * \f}
 * where \f$V_\alpha\f$ and \f$V_\beta\f$ are from the input AXI4-Stream \p s_axis.
 *
 * \param s_axis Input AXI4-Stream with the following layout:
 * <ul>
 *   <li> Bits 0..16: \f$V_\alpha\f$
 *   <li> Bits 17..31: \f$V_\beta\f$
 *   <li> Bits 32..47: Angle, in encoder steps.
 *   <li> Bits 48..63: Unused.
 * </ul>
 * All values are 16-bit signed integers.
 *
 * \param m_axis Output AXI4-Stream with the following layout:
 * <ul>
 *   <li> Bits 0..15: \f$V_a\f$.
 *   <li> Bits 16..31: \f$V_b\f$.
 *   <li> Bits 32..47: \f$V_c\f$.
 *   <li> Bits 48..63: Angle, in encoder steps.
 * </ul>
 * All values are 16-bit signed integers.
 *
 * \return void - functions implementing an IP core do not return a value.
 */
void Clarke_Inverse(hls::stream<int64_t> &s_axis, hls::stream<int64_t> &m_axis);

#endif	// CLARKE_INVERSE_H
