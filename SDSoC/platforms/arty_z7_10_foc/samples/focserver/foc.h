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
/// \file foc.h
/// \brief Main header file required for using Field-Oriented Control.
/// This file contains all the necessary definitions for using the Field-Oriented Control C function.
///
/// \author 		Oleksandr Kiyenko
/// \version 	1.0
/// \date		2017
/// \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH
#ifndef SRC_FOC_H_
#define SRC_FOC_H_

#if defined(__SDSCC__)
#include "ap_int.h"
#endif

/// @defgroup macros_user User-configurable macros
/// These macros should be configured by the user to match particular hardware setup.
/// Most important is to have #CPR and #PPR correctly set.
/// @{


/// \brief Number of encoder steps per one full revolution.
/// Important: Change the sine and cosine tables in the file sin_cos_table.h accordingly when changing this.
#define CPR 				1000

/// \brief Number of pole pairs per phase of the motor; full sinus periods per revolution.
#define PPR					2

/// \brief Number of extra bits in the DC accumulators.
/// The number of samples is 2 to the power of extra bits.
///
/// The DC level is determined when the motor is stopped (#CONTROL_REG = 0)
/// and the correction is applied when the motor is energized (#CONTROL_REG != 0).
#define DC_ACC_BITS			15

/// \brief Order of the RPM boxcar filter.
/// Filter length is 2 to the power of filter order.
#define FILTER_ORDER		5

/// @}

/// @defgroup macros_arguments Arguments register block
/// Indices of the registers in the argument register block.
/// The size of the argument register block is determined by #ARGS_SIZE.
/// @{

/// Number of argument registers of the FOC.
#define ARGS_SIZE			16

/// \brief Control register.
/// Register number in the arguments register block.
///
/// Layout of the control register:
/// \li Bits 0 .. 3: Mode of the FOC operation, one of #MODE_STOPPED, #MODE_SPEED, #MODE_MANUAL_TORQUE_FLUX, #MODE_MANUAL_TORQUE, #MODE_SPEED_WITHOUT_TORQUE, #MODE_TORQUE_WITHOUT_SPEED, #MODE_MANUAL_TORQUE_FLUX_FIXED_SPEED, #MODE_FIXED_POSITION.
/// \li Bits 4 .. 15: Delay in the fixed speed mode #MODE_MANUAL_TORQUE_FLUX_FIXED_SPEED. The bigger the delay, the slower the motor rotates.
///
/// The mode selects the function of the FOC according to the following table:
/// | Mode    | V<sub>q</sub>    | V<sub>d</sub>    | &Theta;              | I<sub>q,sp</sub> | Description |
/// |---------|------------------|------------------|----------------------|------------------|-------------|
/// |       0 |   0              |   0              |     0                | I<sub>q,in</sub> | Motor stopped. DC offset of the current  |
/// |       1 | I<sub>q,pi</sub> | I<sub>d,pi</sub> | &Theta;<sub>in</sub> | n<sub>pi</sub>   | Speed control |
/// |       2 | V<sub>q,in</sub> | V<sub>d,in</sub> | &Theta;<sub>in</sub> | I<sub>q,in</sub> | Manual torque and flux |
/// |       3 | V<sub>q,in</sub> | I<sub>d,pi</sub> | &Theta;<sub>in</sub> | I<sub>q,in</sub> | Manual torque |
/// |       4 | n<sub>pi</sub>   | I<sub>d,pi</sub> | &Theta;<sub>in</sub> | I<sub>q,in</sub> | Speed control without torque control |
/// |       5 | I<sub>q,pi</sub> | I<sub>d,pi</sub> | &Theta;<sub>in</sub> | I<sub>q,in</sub> | Torque control without speed control |
/// |       6 | V<sub>q,in</sub> | V<sub>d,in</sub> | Internal counter     | I<sub>q,in</sub> | Manual torque and flux at low fixed speed |
/// |       7 | N/A              | N/A              | N/A                  | N/A              | Motor position fixed; only phase C is powered |
/// 
/// See the chapter \ref block_diagram for the block diagram.
#define CONTROL_REG			0

/// \brief Flux setpoint.
/// Register number in the arguments register block.
/// Unit: Resolution of the current ADC-s.
#define FLUX_SP_REG			1

/// \brief Flux PI loop proportional factor.
/// Register number in the arguments register block.
/// Format: Q16.16.
#define FLUX_KP_REG			2

/// \brief Flux PI loop integral factor.
/// Register number in the arguments register block.
///
/// Format: Q16.16.
#define FLUX_KI_REG			3

/// \brief Torque setpoint.
/// Register number in the arguments register block.
///
/// Unit: Resolution of the current ADC-s.
#define TORQUE_SP_REG		4

/// \brief Torque PI loop proportional factor.
/// This is the index of the torque PI loop proportional factor register in the argument register block.
///
/// Format: Q16.16.
#define TORQUE_KP_REG		5

/// \brief Torque PI loop integral factor.
/// Register number in the arguments register block.
///
/// Format: Q16.16.
#define TORQUE_KI_REG		6

/// \brief Speed setpoint, in RPM.
/// Register number in the arguments register block.
#define RPM_SP_REG			7

/// \brief Speed PI loop proportional factor.
/// Register number in the arguments register block.
///
/// Format: Q16.16.
#define RPM_KP_REG			8

/// \brief Speed PI loop integral factor.
/// Register number in the arguments register block.
#define RPM_KI_REG			9

/// \brief Angle shift, in the units of encoder steps.
/// Register number in the arguments register block.
#define ANGLE_SH_REG		10

/// \brief Fixed Vd.
/// Register number in the arguments register block.
///
/// Unit: Resolution of the PWM.
#define VD_REG				11

/// \brief Fixed Vq.
/// Register number in the arguments register block.
///
/// Unit: Resolution of the PWM.
#define VQ_REG				12

/// \brief Filter coefficient A.
/// Register number in the arguments register block.
///
/// Format: Q16.16.
///
/// Important: This is valid in the Vivado SDSoC FOC project only.
#define FA_REG				13

/// \brief Filter coefficient B.
/// Register number in the arguments register block.
///
/// Format: Q16.16.
///
/// Important: This is valid in the Vivado SDSoC FOC project only.
#define FB_REG				14

/// \brief Trigger data capture.
/// Register number in the arguments register block.
///
/// Important: This is valid in the Vivado HLS FOC project only.
#define	TRIGGER_REG		14

/// \brief Second control register.
/// Register number in the arguments register block.
///
/// Layout of the second control register:
/// \li Bits 0 .. 3: Source for the data capture, one of #DATASOURCE_ADC,  #DATASOURCE_I_ALPHA_BETA, #DATASOURCE_I_D_Q, #DATASOURCE_I_D_Q, #DATASOURCE_V_D_Q, #DATASOURCE_V_ALPHA_BETA, #DATASOURCE_V_A_B_C, #DATASOURCE_PWM.
/// \li Bits 4 .. 19:	Error limit for the speed check, unsigned integer.,
/// \li Bit 20:	User led `LD3` on the ARTY Z7 board., see #CONTROL2_BV_LED,
/// \li Bit 21:	Set to 1 to reset the built-in speed check; don't forget to reset it back to 0, see #CONTROL2_BV_RESET_ERROR,
/// \li Bit 22: Set to 1 to enable spread-spectrum mode, see #CONTROL2_BV_SPREAD_SPECTRUM,
/// \li Bits 23 .. 31:	Unused, must be zero.
///
/// Important: This is valid in the Vivado HLS FOC project only.
#define CONTROL2_REG		15

/// \brief Start of the mode bits in register #CONTROL_REG.
#define	CONTROL_BIT_MODE					0

/// \brief Maximum value for the mode bits in #CONTROL_REG.
#define	CONTROL_MAX_MODE					0x0Fu

/// \brief Start of the fixed speed delay in the register #CONTROL_REG
#define	CONTROL_BIT_FIXPERIOD				4

/// \brief Maximum value for the fixed speed delay in the register #CONTROL_REG.
#define	CONTROL_MAX_FIXPERIOD				0xFFFu

/// \brief Motor stopped.
/// Valu of the register #CONTROL_REG.
#define	MODE_STOPPED						0u

/// \brief Speed control mode.
/// Value of the register #CONTROL_REG.
#define	MODE_SPEED							1u

/// \brief Manual torque and flux.
/// Value of the register #CONTROL_REG.
#define	MODE_MANUAL_TORQUE_FLUX				2u

/// \brief Manual torque.
/// Value of the register #CONTROL_REG.
#define	MODE_MANUAL_TORQUE					3u

/// \brief Speed control without torque PI.
/// Value of the register #CONTROL_REG.
#define	MODE_SPEED_WITHOUT_TORQUE			4u

/// \brief Torque control without speed PI.
/// Value of the register #CONTROL_REG.
#define	MODE_TORQUE_WITHOUT_SPEED			5u

/// \brief Manual torque and flux, fixed speed rotation.
/// Value of the register #CONTROL_REG.
#define	MODE_MANUAL_TORQUE_FLUX_FIXED_SPEED	6u

/// \brief Motor position fixed; only phase C is powered.
/// Value of the register #CONTROL_REG.
#define	MODE_FIXED_POSITION					7u


/// \brief ADC data
#define	DATASOURCE_ADC							0

/// \brief Output of the Clarke transform, the values \f$I_\alpha\f$ and \f$I_\beta\f$.
#define	DATASOURCE_I_ALPHA_BETA					1

/// \brief Output of the Park transform, the values \f$I_d\f$ and \f$I_q\f$.
#define DATASOURCE_I_D_Q						2

/// \brief Input to the inverse Park transform, the values \f$V_d\f$ and \f$V_q\f$.
#define DATASOURCE_V_D_Q						3

/// \brief Output of the inverse Park transform, the values \f$V_\alpha\f$ and \f$V_\beta\f$.
#define DATASOURCE_V_ALPHA_BETA					4

/// \brief Output of the inverse Clarke transform, the values \f$V_a\f$, \f$V_b\f$ and \f$V_c\f$.
#define DATASOURCE_V_A_B_C						5

/// \brief Direct PWM values.
#define DATASOURCE_PWM							6

/// \brief The bit position of the error limit in the register #CONTROL2_REG.
#define	CONTROL2_BIT_ERROR_LIMIT	4u

/// \brief Bitmask of the error limit in the register #CONTROL2_REG.
#define	CONTROL2_BV_ERROR_LIMIT		(0xFFFFu <<  CONTROL2_BIT_ERROR_LIMIT)

/// \brief Bit value of the user LED bit in the register #CONTROL2_REG
#define	CONTROL2_BV_LED				(1u << 20)

/// \brief Bit value of the reset error bit in the register #CONTROL2_REG.
#define	CONTROL2_BV_RESET_ERROR		(1u << 21)

/// \brief Bit value of the spread spectrum enable bit in the register #CONTROL2_REG
#define CONTROL2_BV_SPREAD_SPECTRUM	(1u << 22)

/// \brief The bit position of the decimation in the register #CONTROL2_REG.
#define	CONTROL2_BIT_DECIMATION		24

/// \brief Maximum value for the decimation factor.
#define	CONTROL2_MAX_DECIMATION		0xFFu

/// \brief The bitmask of the decimation value in the register #CONTROL2_REG.
#define	CONTROL2_BITMASK_DECIMATION		(CONTROL2_MAX_DECIMATION << CONTROL2_BIT_DECIMATION)


/// @}

/// @defgroup macros_status Status register block
/// Indices of the registers in the status register block.
///
/// Size of the status register block is determined by #STATUS_SIZE.
/// @{

/// Number of status registers of the FOC.
#define STATUS_SIZE			4

/// \brief Encoder angle, in encoder steps.
/// Register number in the status register block.
#define ANGLE_REG			0

/// \brief Speed of rotation, in RPM.
/// Register number in the status register block.
#define RPM_REG				1

/// \brief Flux.
/// Register number in the status register block.
#define	ID_REG				2

/// \brief Stator current.
/// Register number in the status register block.
#define	IQ_REG				3

/// @}

/// @defgroup math_constants Mathematical constants
/// Mathematical constants used by the FOC.
/// @{

/// \brief Maximum positive value for saturated arithmetic.
#define MAX_LIM				32767

/// \brief Minimum negative value for saturated arithmetic.
#define MIN_LIM				-32767

/// \brief The number \f$\frac{1}{\sqrt{3}}\f$ in the Q16.16 format.
#define SQRT3A				0x000093CD

/// \brief The number \f$\sqrt{3}\f$ in the Q16.16 format.
#define SQRT3C				0x0000DDB4

/// @}

/// @defgroup foc FOC function
/// Function implementing FOC.
/// @{

#if defined(__SDSCC__)
/// Implementation of the Field-Oriented Control in the FPGA.
/// See the chapter \ref block_diagram for the functional overview.
///
/// @param A Input stream. The data is structured as follows:
/// \li Bits 0 .. 15: Current on phase A,
/// \li Bits 16 .. 31:	Current on phase B,
/// \li Bits 32 .. 47:	RPM,
/// \li Bits 48 .. 63:	Angle.
/// @param B Output stream to the PWM block. The data is structured as follows:
/// \li Bits 0 .. 15:	PWM on phase A,
/// \li Bits 16 .. 31:	PWM on phase B,
/// \li Bits 32 .. 47:	PWM on phase C,
/// \li Bits 48 .. 63:	Reserved, always 0.
/// @param C Output stream to the data capture IP core.
/// @param args Control register block, size of ARGS_SIZE.
/// @param status Status register block, size of STATUS_SIZE.
void foc(long long int *A, long long int *B, long long int *C, int args[ARGS_SIZE], int status[STATUS_SIZE]);
#endif

/// @}

#endif /* SRC_FOC_H_ */
