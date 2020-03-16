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
/// \file foc.cpp
/// \brief Implementation of the function foc().
/// This file contains the function implementing the Field-Oriented Control.
///
/// \author 		Oleksandr Kiyenko
/// \version 	1.0
/// \date		2017
/// \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH
#include <ap_int.h>
#include <stdint.h>			// int16_t, etc.
#include <hls_stream.h>
#include <ap_axi_sdata.h>

#include "foc.h"
#include "sin_cos_table.h"

/// Number of samples to be accumulated in the DC filters.
#define DC_ACC_SAMPLES	(1 << DC_ACC_BITS)

/// Length of the speed averaging filter.
#define FILTER_LENGTH		(1 << FILTER_ORDER)

/// Maximum positive value for the integral error.
#define MAX_LIM_E			16777215
/// Minimum negative value for the integral error.
#define MIN_LIM_E			-16777215

/// \brief A 4-bit unsigned integer
typedef ap_uint<4>	uint4_t;

/// \brief A 12-bit unsigned integer.
typedef	ap_uint<12>	uint12_t;

/// \brief A 48-bit signed integer type.
typedef ap_int<48>	int48_t;

/// \brief Clip the 32-bit argument in the given range, in the form of an inline HLS function.
/// \param x Value to be clipped.
/// \param x_min Minimum limit for the value.
/// \param x_max Maximum limit for the value.
/// \return Value #x clipped into the range #x_min ... #x_max.
static int32_t Clip32(const int32_t x, const int32_t x_min, const int32_t x_max)
{
#pragma HLS INLINE
	if (x < x_min) {
		return x_min;
	}
	else if (x > x_max) {
		return x_max;
	}
	else {
		return x;
	}
}

/// \brief Clip the 48-bit argument in the given range, in the form of an inline HLS function.
/// \param x Value to be clipped.
/// \param x_min Minimum limit for the value.
/// \param x_max Maximum limit for the value.
/// \return Value #x clipped into the range #x_min ... #x_max.
static int48_t Clip48(const int48_t x, const int48_t x_min, const int48_t x_max)
{
#pragma HLS INLINE
	if (x < x_min) {
		return x_min;
	}
	else if (x > x_max) {
		return x_max;
	}
	else {
		return x;
	}
}

/// \brief PI control in the form of an inline HLS function.
/// \param in_data	Measured process value.
/// \param s_axis	Input AXI4-Stream Feedback data as 16 bit signed integer values.
/// \param m_axis	Output AXI4-Stream Control.
/// \param Sp		Setpoint.
/// \param Kp		Proportional coefficient.
/// \param Ki		Integral coefficient.
/// \param GiE_prev	Reference to a variable storing the value of an integral error.
/// \return			New control variable.
static int16_t PI_Control(
		const int16_t	in_data,
		const int16_t	Sp,
		const int16_t	Kp,
		const int16_t	Ki,
		const bool		mode_change,
		int32_t&		GiE_prev
		)
{
#pragma HLS INLINE
	int32_t Err, GpE, GiE, Res_Out;

	Err = Clip32(Sp-in_data, MIN_LIM, MAX_LIM);
	GpE = Err;
	GiE = Clip32(Err + (mode_change ? 0 : GiE_prev), MIN_LIM_E, MAX_LIM_E);
	Res_Out = Clip48((int48_t(Kp*GpE) + (int48_t(Ki)*int48_t(GiE) >> 8)) >> 8, MIN_LIM, MAX_LIM);

	// Calculate results
	GiE_prev = GiE;
	return Res_Out;
}

/// Create 64-bit value out of four 16-bit ones.
#define	MAKE_DATA4(s0, s1, s2, s3)								\
	(((int64_t)(s3)      << 48) & 0xFFFF000000000000LL) |	\
	(((int64_t)(s2)      << 32) & 0x0000FFFF00000000LL) |	\
	(((int64_t)(s1)      << 16) & 0x00000000FFFF0000LL) |	\
	( (int64_t)(s0)             & 0x000000000000FFFFLL)


#define	GET_INT16(data64, int16index)	((int16_t)((data64 >> (int16index*16)) & 0xFFFF))

static hls::stream<unsigned int> A("input_stream");
static hls::stream<unsigned int> B("output_stream");
static hls::stream<unsigned int> C("output_debug_stream");

// See the header file for documentation comment.
//Extern C is used to prevent compiler name mangling
extern "C" {
//void foc(hls::stream<int64_t> &A, hls::stream<int64_t> &B, hls::stream<int64_t> &C, int args[ARGS_SIZE], int status[STATUS_SIZE])
void foc(hls::stream<ap_axis<64,0,0,0> > &A, hls::stream<ap_axis<64,0,0,0> > &B, hls::stream<ap_axis<64,0,0,0> > &C, int args[ARGS_SIZE], int status[STATUS_SIZE])
{
	
//JM look into 	hls::stream<ap_int<64,0,0,0> >
		
		
#pragma HLS pipeline enable_flush
#pragma HLS interface axis port=A
#pragma HLS interface axis port=B
#pragma HLS interface axis port=C
#pragma HLS interface s_axilite port=args offset=64 bundle=args
#pragma HLS interface s_axilite port=status offset=128 bundle=args
#pragma HLS interface ap_ctrl_none port=return

	//--------------------------------------------------------------------------
	// Decode Input stream
	//--------------------------------------------------------------------------
	short Ia;										// Phase A current
	short Ib;										// Phase B current
	short RPM;										// RPM
	unsigned short Angle;							// Encoder count 
	int Angle_shift;								// Angle shift between encoder index and motor rotor phase A
	int Theta;										// Rotor Angle
	int Control_Reg;								// Copy of the control register
	static uint4_t Mode_Prev = MODE_STOPPED;	// Previous Control Register.
	bool Mode_Change;
	ap_axis<64,0,0,0>	A_copy;
	uint4_t Mode;
	uint12_t FixPeriod;

	A_copy = A.read();
	Ia    = (A_copy.data & 0x000000000000FFFF);				// Extract phase A current from input stream
	Ib    = (A_copy.data & 0x00000000FFFF0000) >> 16;		// Extract phase B current from input stream
	RPM   = (A_copy.data & 0x0000FFFF00000000) >> 32;		// Extract RPM from input stream
	Angle = (A_copy.data & 0xFFFF000000000000) >> 48;		// Extract encoder count from input stream
	Angle_shift = args[ANGLE_SH_REG];				// Read angle shift parameter
	Theta = (int)Angle - Angle_shift;				// Apply angle correction
	Theta = (Theta < 0) ? (Theta + CPR) : Theta;	// Correct negative angle
	Theta = (Theta >= CPR) ? (Theta - CPR) : Theta;	// Correct angle overload
	status[ANGLE_REG] = Theta;						// Pass current Angle to Status
	Control_Reg = args[CONTROL_REG];
	Mode = (uint32_t)(Control_Reg >> CONTROL_BIT_MODE) & CONTROL_MAX_MODE;
	FixPeriod = (uint32_t)(Control_Reg >> CONTROL_BIT_FIXPERIOD) & CONTROL_MAX_FIXPERIOD;
	Mode_Change = Mode != Mode_Prev;

	//--------------------------------------------------------------------------
	// Input filters
	//--------------------------------------------------------------------------
	// RPM Filtering (simple average filter)
	int RPM_filtered;								// Output of the RPM filter
	int RPM_filtered_negative;						// Output of the RPM filter
	static int rpm_filt_acc;						// Accumulator for the RPM filter
	static int rpm_filt_mem[FILTER_LENGTH];			// Memory for the RPM filter
	int fi;											// Loop index
	int rpm_filt_res;								// Result of the RPM filter

	rpm_filt_acc -= rpm_filt_mem[FILTER_LENGTH-1];	// Remove tail value from the accumulator
	rpm_filt_acc += RPM;							// Add new value to the accumulator
	for(fi = (FILTER_LENGTH-1); fi > 0; fi--){		// Loop to shift rpm filter memory to the right
		rpm_filt_mem[fi] = rpm_filt_mem[fi - 1];
	}
	rpm_filt_mem[0] = RPM;							// Add head value to memory
	rpm_filt_res = rpm_filt_acc >> FILTER_ORDER;	// Divide accumulator to memory size

	unsigned short filt_a;							// Filter coefficient A
	unsigned short filt_b;							// Filter coefficient B
	filt_a = (unsigned short)args[FA_REG];
	filt_b = (unsigned short)args[FB_REG];

	// First IIR filter stage
	int Ia_filtered;								// Result of filter stage A
	int Ib_filtered;								// Result of filter stage B
	int Y1a, Y1b;									// Partial result
	static int Y1a_prev;							// Variable to store previous value
	static int Y1b_prev;							// Variable to store previous value
	int Ia1_filtered;								// First stage result
	int Ib1_filtered;								// First stage result

	Y1a = Ia*filt_a + Y1a_prev*filt_b;				// Y(i) = Ia*A + Y(i-1)*B
	Y1b = Ib*filt_a + Y1b_prev*filt_b;				// Y(i) = Ia*A + Y(i-1)*B
	Ia1_filtered	= Y1a >> 15;					// Remove fractional part
	Ib1_filtered	= Y1b >> 15;					// Remove fractional part
	Y1a_prev = Ia1_filtered;						// Store result for next round
	Y1b_prev = Ib1_filtered;						// Store result for next round

	// Second filter stage
	int Y2a, Y2b;									// Partial result
	static int Y2a_prev;							// Variable to store previous value
	static int Y2b_prev;							// Variable to store previous value
	int Ia2_filtered;								// Second stage result
	int Ib2_filtered;								// Second stage result

	Y2a = Ia1_filtered*filt_a + Y2a_prev*filt_b;	// Y(i) = Ia*A + Y(i-1)*B
	Y2b = Ib1_filtered*filt_a + Y2b_prev*filt_b;	// Y(i) = Ia*A + Y(i-1)*B
	Ia2_filtered	= Y2a >> 15;					// Remove fractional part
	Ib2_filtered	= Y2b >> 15;					// Remove fractional part
	Y2a_prev = Ia2_filtered;						// Store result for next round
	Y2b_prev = Ib2_filtered;						// Store result for next round

	Ia_filtered = Ia2_filtered;						// Pass data to next step
	Ib_filtered = Ib2_filtered;						// Pass data to next step
	RPM_filtered = rpm_filt_res;					// Pass data to next step
	RPM_filtered_negative = -RPM_filtered;
	status[RPM_REG] = RPM_filtered_negative;					// Pass filtered RPM to Status
	
	//--------------------------------------------------------------------------
	// Calculate DC
	//--------------------------------------------------------------------------
	static int Ia_DC_acc = 0;						// Ia Accumulator
	static int Ib_DC_acc = 0;						// Ib Accumulator
	static int Ia_DC_val = 0;						// Ia DC
	static int Ib_DC_val = 0;						// Ib DC
	static int dc_cnt = 0;							// Counter
	static int Ia_corr;								// Correction for phase A current
	static int Ib_corr;								// Correction for phase B current

	if(dc_cnt >= (DC_ACC_SAMPLES-1)){				// End of accumulation
		Ia_DC_val	= Ia_DC_acc >> DC_ACC_BITS;		// Divide
		Ib_DC_val	= Ib_DC_acc >> DC_ACC_BITS;		// Divide
		Ia_DC_acc	= Ia_filtered;					// Reset Accumulation and load new value
		Ib_DC_acc	= Ib_filtered;					// Reset Accumulation and load new value
		dc_cnt		= 0;
	}
	else{											// Accumulation
		Ia_DC_acc	= Ia_DC_acc + Ia_filtered;		// Accumulate Ia
		Ib_DC_acc	= Ib_DC_acc + Ib_filtered;		// Accumulate Ib
		dc_cnt++;
	}
	if (Mode == MODE_STOPPED) {			// Save DC in Idle mode
		Ia_corr = Ia_DC_val;						// Save Ia correction
		Ib_corr = Ib_DC_val;						// Save Ib correction
	}

	//--------------------------------------------------------------------------
	// Apply DC correction
	//--------------------------------------------------------------------------
	int Ia_AC;										// Corrected phase A current
	int Ib_AC;										// Corrected phase B current

	Ia_AC = Ia2_filtered - Ia_corr;					// Apply Ia correction
	Ib_AC = Ib2_filtered - Ib_corr;					// Apply Ib correction

	//--------------------------------------------------------------------------
	// Clarke Direct
	// Ialpha = Ia
	// Ibeta = (Ia + 2Ib)/sqrt(3)
	// Where Ia+Ib+Ic = 0
	//--------------------------------------------------------------------------
	int Ibd;										// Partial result
	int Ialpha, Ibeta;								// Transfom result

	Ialpha = (int)Ia_AC;							// Type conversion
	Ibd = (int)Ia_AC + ((int)Ib_AC << 1);			// calculate Ia+2*Ib
	Ibeta = Clip32((Ibd * SQRT3A) >> 16, MIN_LIM, MAX_LIM);					// * 1/SQRT(3)

	//--------------------------------------------------------------------------
	// Park Direct
	// Id = Ialpha*cos(Theta) + Ibeta*sin(Theta)
	// Iq = Ibeta*cos(Theta) - Ialpha*sin(Theta)
	//--------------------------------------------------------------------------
	int cos_theta, sin_theta;						// Common Park Direct/Inverse
	int Ia_cos, Ib_sin, Ib_cos, Ia_sin;				// Park Direct variables
	int Id, Iq;										// Park Direct -> PI

	cos_theta = (int)cos_table[Theta];				// Read con(theta)
	sin_theta = (int)sin_table[Theta];				// Read sin(theta)
	Ia_cos = (int)Ialpha * cos_theta;				// Ialpha*con(theta)
	Ib_sin = (int)Ibeta * sin_theta;				// Ibeta*sin(theta)
	Ib_cos = (int)Ibeta * cos_theta;				// Ibeta*cos(theta)
	Ia_sin = (int)Ialpha * sin_theta;				// Ialpha*sin(theta)
	Id = Clip32((Ia_cos + Ib_sin) >> 15, MIN_LIM, MAX_LIM);		// Remove fractional part
	Iq = Clip32((Ib_cos - Ia_sin) >> 15, MIN_LIM, MAX_LIM);		// Remove fractional part
	status[ID_REG] = ~Id;
	status[IQ_REG] = ~Iq;

	//--------------------------------------------------------------------------
	// RPM PI Controller
	//--------------------------------------------------------------------------
	static int32_t RPM_GiE_prev = 0;					// Variable for previous value
	int16_t RPM_Out;									// Partial results
	RPM_Out = PI_Control(RPM_filtered, -args[RPM_SP_REG], args[RPM_KP_REG], args[RPM_KI_REG], Mode_Change, RPM_GiE_prev);

	//--------------------------------------------------------------------------
	// Flux PI Controller
	//--------------------------------------------------------------------------
	static int32_t Flux_GiE_prev = 0;					// Variable for previous value
	int16_t Flux_Out;									// Partial results
	Flux_Out = PI_Control(Id, -args[FLUX_SP_REG], args[FLUX_KP_REG], args[FLUX_KI_REG], Mode_Change, Flux_GiE_prev);

	//--------------------------------------------------------------------------
	// Torque PI Controller
	//--------------------------------------------------------------------------
	static int32_t Torque_GiE_prev = 0;					// Variable for previous value
	int16_t Torque_Sp;									// PI parameters
	int16_t Torque_Out;									// Partial results
	Torque_Sp = (Mode == MODE_SPEED) ? RPM_Out : (-args[TORQUE_SP_REG]);
	Torque_Out = PI_Control(Iq, Torque_Sp, args[TORQUE_KP_REG], args[TORQUE_KI_REG], Mode_Change, Torque_GiE_prev);

	//--------------------------------------------------------------------------
	// Control
	//--------------------------------------------------------------------------
	volatile int Vd, Vq;								// Control outs
	static uint16_t gen_delay = 0;							// Generator period counter
	static uint16_t gen_angle = 0;							// Generator angle counter

	// Simple angle generator for manual mode
	// The motor should rotate regardless of the encoder output 
	if (gen_delay >= FixPeriod) { 				// Period loop
		gen_delay = 0;
		if (gen_angle >= (CPR-1)) {				// Angle loop
			gen_angle = 0;
		}
		else {
			++gen_angle;
		}
	}
	else {
		++gen_delay;
	}

	// Control Vd and Vq depending on work mode
	switch (Mode) {
		case MODE_STOPPED:					// Motor stop
			Vd = 0;								// Set zero Vd
			Vq = 0;								// Set zero Vq
			break;
		case MODE_SPEED:						// Work mode speed loop
			Vd = Flux_Out;						// Sorce Vd from Flux PI
			Vq = Torque_Out;					// Sorce Vq from Torque PI
			break;
		case MODE_MANUAL_TORQUE_FLUX:		// Manual Vd/Vq with real angle
			Vd = args[VD_REG];					// Sorce Vd from register
			Vq = args[VQ_REG];					// Sorce Vq from register
			break;
		case MODE_MANUAL_TORQUE:				// Manual torque
			Vd = Flux_Out;						// Sorce Vd from Flux PI
			Vq = args[VQ_REG];					// Sorce Vq from register
			break;
		case MODE_SPEED_WITHOUT_TORQUE:		// RPM loop (Torque PI bypass)
			Vd = Flux_Out;						// Sorce Vd from Flux PI
			Vq = RPM_Out;						// Sorce Vq from RPM PI
			break;
		case MODE_TORQUE_WITHOUT_SPEED:		// Disable RPM PI
			Vd = Flux_Out;						// Sorce Vd from Flux PI
			Vq = Torque_Out;					// Sorce Vq from Torque PI
			break;
												// Manual mode with angle generator
		case MODE_MANUAL_TORQUE_FLUX_FIXED_SPEED:
			cos_theta = cos_table[gen_angle];	// Generated angle cos
			sin_theta = sin_table[gen_angle];	// Generated angle sin
			Vd = args[VD_REG];					// Sorce Vd from register
			Vq = args[VQ_REG];					// Sorce Vq from register
			break;
		default:								// Motor OFF
			Vd = 0;								// Set zero Vd
			Vq = 0;								// Set zero Vq
			break;
	}

	//--------------------------------------------------------------------------
	// Park Inverse
	// Valpha = Vd*cos(Theta) - Vq*sin(Theta)
	// Vbeta = Vq*cos(Theta) + Vd*sin(Theta)
	//--------------------------------------------------------------------------
	int Vd_cos, Vq_sin, Vq_cos, Vd_sin;				// Partial results
	int Valpha, Vbeta;								// Transfom result

	/* It's already done in Park Direct
	cos_theta = cos_table[Theta];
	sin_theta = sin_table[Theta];
	*/
	Vd_cos = Vd * cos_theta;						// Vd*con(theta)
	Vq_sin = Vq * sin_theta;						// Vq*sin(theta)
	Vq_cos = Vq * cos_theta;						// Vq*con(theta)
	Vd_sin = Vd * sin_theta;						// Vd*sin(theta)
	Valpha = Clip32((Vd_cos - Vq_sin) >> 15, MIN_LIM, MAX_LIM);	// Remove fractional part
	Vbeta  = Clip32((Vq_cos + Vd_sin) >> 15, MIN_LIM, MAX_LIM);	// Remove fractional part

	//--------------------------------------------------------------------------
	// Clarke Inverse
	// Va = Valpha
	// Vb = [-Valpha + sqrt(3)*Vbeta]/2
	// Vc = [-Valpha - sqrt(3)*Vbeta]/2
	//--------------------------------------------------------------------------
	int s3vb;									// Partial results
	int Va, Vb, Vc;								// Transfom result

	Va = Valpha;								// Va = Valpha
	s3vb = Vbeta * SQRT3C;						// (sqrt(3)*(2^15))*Vbeta
	Vb = Clip32(((s3vb >> 15) - Valpha) >> 1, MIN_LIM, MAX_LIM);	// (-Valpha + sqrt(3)*Vbeta)/2
	Vc = Clip32((0 - Valpha - (s3vb >> 15)) >> 1, MIN_LIM, MAX_LIM);	// (-Valpha - sqrt(3)*Vbeta)/2
	
	//--------------------------------------------------------------------------
	// SPWM
	// Vanew = Va
	// Vbnew = Vb 
	// Vcnew = Vc (naming used for consistency with next steps converting SPWM -> SVPWM) 
	//--------------------------------------------------------------------------
	int Vmin, Vmax, Voff;						// SPWM internals
	int Van, Vbn, Vcn;							// SPWM data

	Vmin = (Va < Vb) ? Va : Vb;					// min(Va,Vb)
	Vmin = (Vc < Vmin) ? Vc : Vmin;				// min( ,Vc)
	Vmax = (Va > Vb) ? Va : Vb;					// max(Va,Vb)
	Vmax = (Vc > Vmax) ? Vc : Vmax;				// max( ,Vc)
	Van = Clip32(Va , MIN_LIM, MAX_LIM);	// Vanew = Va 
	Vbn = Clip32(Vb , MIN_LIM, MAX_LIM);	// Vbnew = Vb 
	Vcn = Clip32(Vc , MIN_LIM, MAX_LIM);	// Vcnew = Vc


	//--------------------------------------------------------------------------
	// SVPWM
	// Voff= [min(Va, Vb, Vc)+max(Va, Vb, Vc)]/2
	// Vanew = Va - Voff
	// Vbnew = Vb - Voff
	// Vcnew = Vc - Voff
	//--------------------------------------------------------------------------
	//int Vmin, Vmax, Voff;						// SVPWM internals
	//int Van, Vbn, Vcn;							// Normalized SVPWM data

	//Vmin = (Va < Vb) ? Va : Vb;					// min(Va,Vb)
	//Vmin = (Vc < Vmin) ? Vc : Vmin;				// min( ,Vc)
	//Vmax = (Va > Vb) ? Va : Vb;					// max(Va,Vb)
	//Vmax = (Vc > Vmax) ? Vc : Vmax;				// max( ,Vc)
	//Voff = (Vmin + Vmax) >> 1;					// Division
	//Van = Clip32(Va - Voff, MIN_LIM, MAX_LIM);	// Vanew = Va - Voff
	//Vbn = Clip32(Vb - Voff, MIN_LIM, MAX_LIM);	// Vbnew = Vb - Voff
	//Vcn = Clip32(Vc - Voff, MIN_LIM, MAX_LIM);	// Vcnew = Vc - Voff

	//--------------------------------------------------------------------------
	// Update control register state.
	//--------------------------------------------------------------------------
	Mode_Prev = Mode;

	//--------------------------------------------------------------------------
	// Create output signal
	//--------------------------------------------------------------------------
	if (Mode == MODE_FIXED_POSITION) {	// Set the motor to a fixed position.
		Vcn	= 0;								// Zero Phase C
		Vbn	= 0;								// Zero Phase B
		Van	= 7000;								// Power Phase A
	}

	ap_axis<64,0,0,0> pwmStreamObj;							// Result
	pwmStreamObj.data = MAKE_DATA4(Van, Vbn, Vcn, 0);
	B.write(pwmStreamObj);									// SVPWM result
	//--------------------------------------------------------------------------
	// Output the data stream, too.
	//--------------------------------------------------------------------------
	ap_axis<64,0,0,0>	Data_Out_StreamObj;
	uint32_t		Control2;
	uint16_t		Decimation_Max;
	uint8_t			Data_Source;
	static uint16_t	Decimation_Counter = 0;

	Control2 = args[CONTROL2_REG];
	Data_Source = Control2 & 0x0Fu;
	Decimation_Max = (Control2 >> CONTROL2_BIT_DECIMATION) & 0xFFu;

	switch (Data_Source) {
	case DATASOURCE_ADC:
		Data_Out_StreamObj.data = MAKE_DATA4(Ia_AC, Ib_AC, RPM_filtered_negative, RPM_filtered_negative);
		break;
	case DATASOURCE_I_D_Q:
		Data_Out_StreamObj.data = MAKE_DATA4(~Id, ~Iq, RPM_filtered_negative, RPM_filtered_negative);
		break;
	case DATASOURCE_V_D_Q:
		Data_Out_StreamObj.data = MAKE_DATA4(Vd, Vq, 0, RPM_filtered_negative);
		break;
	case DATASOURCE_V_ALPHA_BETA:
		Data_Out_StreamObj.data = MAKE_DATA4(Valpha, Vbeta, 0, RPM_filtered_negative);
		break;
	case DATASOURCE_V_A_B_C:
		Data_Out_StreamObj.data = MAKE_DATA4(Va, Vb, Vc, RPM_filtered_negative);
		break;
	case DATASOURCE_PWM:
		Data_Out_StreamObj.data = MAKE_DATA4(Van, Vbn, Vcn, RPM_filtered_negative);
		break;
	default:
		Data_Out_StreamObj.data = MAKE_DATA4(0, 0, 0, RPM_filtered_negative);
		break;
	}

	if (Decimation_Counter >= Decimation_Max) {
		Decimation_Counter = 0;
		C.write(Data_Out_StreamObj);
	}
	else {
		++Decimation_Counter;
	}

	//--------------------------------------------------------------------------
//--------------------------------------------------------------------------
}
}
