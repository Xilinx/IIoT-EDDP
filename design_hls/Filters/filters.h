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
 * \file filters.h
 * \brief		Header file for Filters
 * \author 		Oleksandr Kiyenko
 * \version 	1.0
 * \date		2017
 * \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH
 */

#ifndef FILTERS_H
#define FILTERS_H

#include <hls_stream.h>
#include <ap_axi_sdata.h>
#include <ap_int.h>
#include <ap_cint.h>
#include <stdint.h>

/// \brief Maximum positive value for saturated arithmetic.
#define MAX_LIM				32767

/// \brief Minimum negative value for saturated arithmetic.
#define MIN_LIM				-32767

/// \brief Boxcar filter order for the speed filter.
/// Order of 5 corresponds to 32 samples buffered in the boxcar filter.
#define FILTER_SHIFT		5

/// \brief This is automatically determined from #FILTER_SHIFT.
#define FILTER_ORDER		(1 << FILTER_SHIFT)

/// \brief Order of the DC averaging filter.
/// Order of 15 corresponds to 32768 samples averaged.
#define DC_ACC_BITS			15

/// \brief This is automatically determined from the #DC_ACC_BITS.
#define DC_ACC_SAMPLES		(1 << DC_ACC_BITS)

/// \brief Feedforward filter coefficient for the current filter.
/// Choose a number between 1 and 32766.
/// Higher values correspond to less filtering and lower values correspond to more filtering.
/// 
/// Note: the number 0.553 converted to Q16.16 is 18120.
#define FILT_B 18120

/// \brief Feedback filter coefficient for the current filter.
/// This is derived from #FILT_B such that the filter is not amplifying.
#define FILT_A (MAX_LIM - FILT_B)

/**
 * \brief Filters Core
 * \param s_axis Input AXI4-Stream with the following format:
 * <ul>
 *   <li> Bits 0..15: First phase current \f$I_a\f$, from the ADC.
 *   <li> Bits 16..31: Second phase current \f$I_b\f$, from the ADC.
 *   <li> Bits 32..47: Speed, in RPM.
 *   <li> Bits 48..63: Angle, in encoder steps, just passed through.
 * </ul>
 * All values are 16-bit signed integers.
 *
 * \param m_axis Output AXI4-Stream, contains filtered values of the input stream in the same format.
 * \param RPM_out Returns speed, in RPM.
 * \param control Value of the control register. Zero value indicates that the motor is off.
 * \return void - functions implementing an IP core do not return a value.
 */
void Filters(hls::stream<int64_t> &s_axis, hls::stream<int64_t> &m_axis, int16_t *RPM_out, const int32_t control);

#endif

