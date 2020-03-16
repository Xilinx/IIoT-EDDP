/// \file  FocDevice.cpp
/// \brief Implementation of the class FocDevice.
///
/// \version 	1.0
/// \date		2017
/// \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH

#include <stdexcept>	// std::runtime_error

#include <string.h>		// strcmp

#include <smart/string.h>	// ssprintf
#include <smart/time.h>		// msleep

#include "FocDevice.h"

#include "foc.h"	// FOC register definitions.


using namespace smart;

/// FOC clock frequency, in Hz,
static constexpr unsigned int	FOC_CLOCK_HZ = 100u * 1000u * 1000u;

/// Name of the /dev/mem
static const char* const	FILENAME_DEV_MEM = "/dev/mem";

/// Name of the FOC device in the device tree.
static const char* const	UIO_FOC_DEVICE_NAME = "foc";

/// Name of the Xilinx FOC device.
static const char* const	UIO_XILINX_DEVICE_NAME = "xilinx-xlnk-eng.0";

/// Prefix of a FOC-compatible device.
static const char* const	FOC_COMPATIBLE_DEVICE_PREFIX = "xlnx,foc-";

/// \brief Write a parameter register. Ensure index is in the correct range before calling this function.
/// \param index	Index of the parameter register.
/// \param value	Value to be written to the parameter register.
#define	write_parameter(index, value)	_registers->write32(_parameter_registers_offset + (index), (value))

/// \brief Read a parameter register. Ensure index is in the correct range before calling this function.
/// \param index	Index of the parameter register to be read.
#define	read_parameter(index)			_registers->read32(_parameter_registers_offset + (index))


const char* const	FocDevice::NAME_SDSOC = "SDSoC";

const char* const	FocDevice::NAME_HLS = "HLS";

const char* const	FocDevice::NAME_UNKNOWN = "Unknown";

// --------------------------------------------------------------------------------------------------------------------
static const FocDevice::RegisterAccess	parameter_registers[] = {
		// 0 ... 4
		{ "Control", CONTROL_REG, FocDevice::RegisterType::UINT32, 0, UINT32_MAX },
		{ "FluxSp", FLUX_SP_REG, FocDevice::RegisterType::INT32, 0, UINT32_MAX },
		{ "FluxKp", FLUX_KP_REG, FocDevice::RegisterType::INT32, 0, UINT32_MAX },
		{ "FluxKi", FLUX_KI_REG, FocDevice::RegisterType::INT32, 0, UINT32_MAX },
		{ "TorqueSp", TORQUE_SP_REG, FocDevice::RegisterType::INT32, 0, UINT32_MAX },
		// 5 ... 9
		{ "TorqueKp", TORQUE_KP_REG, FocDevice::RegisterType::INT32, 0, UINT32_MAX },
		{ "TorqueKi", TORQUE_KI_REG, FocDevice::RegisterType::INT32, 0, UINT32_MAX },
		{ "RPMSp", RPM_SP_REG, FocDevice::RegisterType::INT32, 0, UINT32_MAX },
		{ "RPMKp", RPM_KP_REG, FocDevice::RegisterType::INT32, 0, UINT32_MAX },
		{ "RPMKi", RPM_KI_REG, FocDevice::RegisterType::INT32, 0, UINT32_MAX },
		// 10 ... 14
		{ "Shift", ANGLE_SH_REG, FocDevice::RegisterType::INT32, 0, UINT32_MAX },
		{ "Vd", VD_REG, FocDevice::RegisterType::INT32, 0, UINT32_MAX },
		{ "Vq", VQ_REG, FocDevice::RegisterType::INT32, 0, UINT32_MAX },
		{ "Fa", FA_REG, FocDevice::RegisterType::UINT32, 0, UINT32_MAX },
		{ "Fb", FB_REG, FocDevice::RegisterType::UINT32, 0, UINT32_MAX },

		// 15
		{ "Control2", CONTROL2_REG, FocDevice::RegisterType::UINT32, 0, UINT32_MAX },
		// 16 .. 19
		{ "Mode", CONTROL_REG, FocDevice::RegisterType::UINT32, CONTROL_BIT_MODE, CONTROL_MAX_MODE },
		{ "FixedDelay", CONTROL_REG, FocDevice::RegisterType::UINT32, CONTROL_BIT_FIXPERIOD, CONTROL_MAX_FIXPERIOD },
		{ "SpreadSpectrum", CONTROL_REG, FocDevice::RegisterType::UINT32, 0, 0u },
		{ nullptr, 0, FocDevice::RegisterType::UINT32 },
};

// --------------------------------------------------------------------------------------------------------------------
static const FocDevice::RegisterAccess status_registers[] {
		{ "Angle", ANGLE_REG, FocDevice::RegisterType::UINT32, 0, UINT32_MAX  },
		{ "Speed", RPM_REG, FocDevice::RegisterType::INT32, 0, UINT32_MAX  },
		{ "Id", ID_REG, FocDevice::RegisterType::INT32, 0, UINT32_MAX  },
		{ "Iq", IQ_REG, FocDevice::RegisterType::INT32, 0, UINT32_MAX  },
		{ nullptr, 0 },
};

// --------------------------------------------------------------------------------------------------------------------
static void add_parameter_value(std::vector<FocConfiguration::ParameterValue>& dst, const struct FocDevice::RegisterAccess* paramRegisters, const unsigned int index, const uint32_t value)
{
	const struct FocDevice::RegisterAccess*		pr = &paramRegisters[index];
	FocConfiguration::ParameterValue			pv;
	pv.name = pr->name;
	pv.index = index;
	pv.value = value;
	dst.push_back(pv);
}

// --------------------------------------------------------------------------------------------------------------------
FocDevice::FocDevice(std::shared_ptr<FocConfiguration> pConfig)
: designName(NAME_UNKNOWN),
  config(pConfig),
  parameterCount(0),
  parameterRegisters(parameter_registers),
  statusCount(0),
  statusRegisters(status_registers),
  _parameter_registers_offset(0x10),
  _status_registers_offset(0x20)
{
	// Are we running on SDSoC or HLS?
	_sdsoc_info = DeviceTreeDevice::findByProperty(DeviceTreeDevice::PROPERTY_COMPATIBLE, FOC_COMPATIBLE_DEVICE_PREFIX);
	if (_sdsoc_info) {
		designName = NAME_SDSOC;
		_sdsoc_device = std::unique_ptr<smart::MappedFile>(new smart::MappedFile(FILENAME_DEV_MEM, _sdsoc_info->address, MappedFile::pageSize()));
		_registers = _sdsoc_device.get();
		_hw_address = _sdsoc_info->address;
	}
	else {
		designName = NAME_HLS;
		_hls_device = std::unique_ptr<smart::UioDevice>(new smart::UioDevice(UIO_FOC_DEVICE_NAME));
		_registers = _hls_device->getRequiredMap(0);
		_hw_address = _hls_device->maps[0].addr;
	}

	unsigned int i;

	for (i=0; parameterRegisters[i].name!=nullptr; ++i) {
	}
	parameterCount = i;

	for (i=0; statusRegisters[i].name!=nullptr; ++i) {
	}
	statusCount = i;

	/// Setup the default configuration.
	if (!config) {
		config = std::make_shared<FocConfiguration>();
		add_parameter_value(config->init, parameterRegisters, CONTROL_REG, 0);			// Motor OFF
		add_parameter_value(config->init, parameterRegisters, PSEUDO_PARAMETER::FIXED_PERIOD, 50);			// Reasonably slow rotation.
		add_parameter_value(config->init, parameterRegisters, FLUX_SP_REG, 0);			// Flux Sp = 0
		add_parameter_value(config->init, parameterRegisters, FLUX_KP_REG, 0xFFFFF000);	// Flux Kp = -4096
		add_parameter_value(config->init, parameterRegisters, FLUX_KI_REG, 0);			// Flux Ki = 0
		add_parameter_value(config->init, parameterRegisters, TORQUE_SP_REG, 0);		// Torque Sp (used only in debug modes)
		add_parameter_value(config->init, parameterRegisters, TORQUE_KP_REG, 5000);		// Torque Kp = 1.0
		add_parameter_value(config->init, parameterRegisters, TORQUE_KI_REG, 0);		// Torque Ki = 0
		add_parameter_value(config->init, parameterRegisters, RPM_SP_REG, 3000);		// Speed Sp = 3000 RPM
		add_parameter_value(config->init, parameterRegisters, RPM_KP_REG, -200);		// Speed Kp = 2.88
		add_parameter_value(config->init, parameterRegisters, RPM_KI_REG, -5);			// Speed Ki
		add_parameter_value(config->init, parameterRegisters, ANGLE_SH_REG, 719);		// Angle between encoder index and Phase A
		add_parameter_value(config->init, parameterRegisters, VD_REG, 0xFFFFE300);		// Vd (used only in debug modes)
		add_parameter_value(config->init, parameterRegisters, VQ_REG, 0xFFFFc100);			// Vq (used only in debug modes)
		add_parameter_value(config->init, parameterRegisters, FA_REG, 18120);			// Filter coefficient A = 0.553
		add_parameter_value(config->init, parameterRegisters, FB_REG, 14647);			// Filter coefficient A = 0.447

		// The last registers already have suitable default values.
		add_parameter_value(config->init, parameterRegisters, CONTROL2_REG, CONTROL2_BV_RESET_ERROR);
		add_parameter_value(config->init, parameterRegisters, CONTROL2_REG, 100u << CONTROL2_BIT_ERROR_LIMIT);

		add_parameter_value(config->speed, parameterRegisters, TORQUE_SP_REG, 0);
		add_parameter_value(config->speed, parameterRegisters, TORQUE_KP_REG, 5000);
		add_parameter_value(config->speed, parameterRegisters, TORQUE_KI_REG, 0);

		add_parameter_value(config->torque, parameterRegisters, TORQUE_KP_REG, -20000);
		add_parameter_value(config->torque, parameterRegisters, TORQUE_KI_REG, -5000);
	}
}

// --------------------------------------------------------------------------------------------------------------------
FocDevice::FocDevice()
: FocDevice(std::shared_ptr<FocConfiguration>())
{
}

// --------------------------------------------------------------------------------------------------------------------
uintptr_t FocDevice::getBaseAddress() const
{
	return _hw_address;
}

// --------------------------------------------------------------------------------------------------------------------
/// Check the parameter register index and throw an exception when it is not in the permitted range.
#define	CHECK_PARAMETER_INDEX(parameter_index)	\
	do {										\
		if ((parameter_index) >= parameterCount) {																											\
			throw std::runtime_error(ssprintf("FocDevice: parameter index %u outside range 0 ... %u", (parameter_index), parameterCount-1u));	\
		}																																					\
} while (0)

// --------------------------------------------------------------------------------------------------------------------
static constexpr uint32_t negative_of_uint32(const uint32_t x)
{
	return (uint32_t)(-((int32_t)x));
}

// --------------------------------------------------------------------------------------------------------------------
void FocDevice::writeParameter(const unsigned int argumentIndex, const uint32_t argumentValue)
{
	CHECK_PARAMETER_INDEX(argumentIndex);
	const RegisterAccess*	ra = &parameterRegisters[argumentIndex];
	const unsigned int		index = ra->index;

	if (argumentIndex == RPM_SP_REG && !_sdsoc_info) {
		write_parameter(index, negative_of_uint32(argumentValue));
	}
	else {
		const uint32_t			shift = ra->shift;
		const uint32_t			mask = ra->mask;
		if (shift==0 && mask==UINT32_MAX) {
			// just reading registers can be expensive, too.
			write_parameter(index, argumentValue);
		}
		else {
			_registers->write32Masked(_parameter_registers_offset + index, mask << shift, argumentValue << shift);
		}
	}
}

// --------------------------------------------------------------------------------------------------------------------
uint32_t FocDevice::readParameter(const unsigned int argumentIndex)
{
	CHECK_PARAMETER_INDEX(argumentIndex);
	const RegisterAccess*	ra = &parameterRegisters[argumentIndex];
	const unsigned int		index = ra->index;

	const uint32_t r = _registers->read32(_parameter_registers_offset + index);
	if (argumentIndex == RPM_SP_REG && !_sdsoc_info) {
		return negative_of_uint32(r);
	}
	else {
		return (r >> ra->shift) & ra->mask;
	}
}

// --------------------------------------------------------------------------------------------------------------------
void FocDevice::readParameterString(std::string& buffer, const unsigned int argumentIndex)
{
	CHECK_PARAMETER_INDEX(argumentIndex);
	const RegisterAccess*	ra = &parameterRegisters[argumentIndex];
	const uint32_t			u_reg_0 = read_parameter(ra->index);
	uint32_t				u_reg = (u_reg_0 >> ra->shift) & ra->mask;

	if (argumentIndex == RPM_SP_REG && !_sdsoc_info) {
		u_reg = negative_of_uint32(u_reg);
	}

	switch (ra->registerType) {
	case RegisterType::UINT32:
		ssprintf(buffer, "%s %u 0x%X", ra->name, (unsigned int)u_reg, u_reg);
		break;
	case RegisterType::INT32:
		ssprintf(buffer, "%s %d 0x%X", ra->name, (int)u_reg, u_reg);
		break;
	default:
		buffer = "Error: Internal #1";
	}
}

/// Check the status register index and throw an exception when it is not in the permitted range.
#define	CHECK_STATUS_INDEX(status_index)		\
	do {										\
		if ((status_index) >= statusCount) {																							\
			throw std::runtime_error(ssprintf("FocDevice: status index %u outside range 0 ... %u", (status_index), statusCount-1u));	\
		}																																\
} while (0)

// --------------------------------------------------------------------------------------------------------------------
uint32_t FocDevice::readStatus(const unsigned int statusIndex)
{
	CHECK_STATUS_INDEX(statusIndex);
	return _registers->read32(_status_registers_offset + statusIndex);
}

// --------------------------------------------------------------------------------------------------------------------
void FocDevice::readStatusString(std::string& buffer, const unsigned int statusIndex)
{
	CHECK_STATUS_INDEX(statusIndex);
	const RegisterAccess*		ra = &statusRegisters[statusIndex];
	const uint32_t				u_reg = _registers->read32(_status_registers_offset + statusIndex);

	switch (ra->registerType) {
	case RegisterType::UINT32:
		ssprintf(buffer, "%s %u 0x%X", ra->name, u_reg, u_reg);
		break;
	case RegisterType::INT32:
		ssprintf(buffer, "%s %d 0x%X", ra->name, static_cast<int32_t>(u_reg), u_reg);
		break;
	default:
		buffer = "Error: Internal #2";
	}
}

// --------------------------------------------------------------------------------------------------------------------
void FocDevice::defaultInit()
{
	write_parameter(CONTROL_REG, 0);
	if (config) {
		writeParameterValues(config->init);
	}
}

#define	GET_INT16(data64, int16index)	((int16_t)((data64 >> (int16index*16)) & 0xFFFF))

// --------------------------------------------------------------------------------------------------------------------
void FocDevice::startMotor(const unsigned int newMode, smart::hw::AxiDataCapture* capture)
{
	const uint32_t	old_mode = readParameter(PSEUDO_PARAMETER::MODE);
	if (old_mode == newMode) {
		// Already started, do nothing.
		return;
	}
	if (newMode != MODE_STOPPED) {
		// Stopping the motor resets various internal variables in the FOC.
		writeParameter(PSEUDO_PARAMETER::MODE, MODE_STOPPED);
		if (config) {
			if (newMode == MODE_SPEED
				|| newMode == MODE_SPEED_WITHOUT_TORQUE) {
				writeParameterValues(config->speed);
			}
			else if (newMode == MODE_TORQUE_WITHOUT_SPEED) {
				writeParameterValues(config->torque);
			}
		}
		if (old_mode == MODE_STOPPED) {
			const unsigned int	old_fixed_period = readParameter(PSEUDO_PARAMETER::FIXED_PERIOD);
			const unsigned int	fixed_period = std::max<unsigned int>(old_fixed_period + 1u, 200u);
			const float			clocks_per_rev = static_cast<float>(fixed_period) * static_cast<float>(CPR * CPR);
			const unsigned int	ms_to_sleep = static_cast<unsigned int>(2.0 * (1000.0 / FOC_CLOCK_HZ) * clocks_per_rev);

			write_parameter(ANGLE_SH_REG, 0u);
			msleep(100);
			// The forced rotation mode ensures that the encoder index is reset at least once.
			writeParameter(PSEUDO_PARAMETER::MODE, MODE_MANUAL_TORQUE_FLUX_FIXED_SPEED);
			writeParameter(PSEUDO_PARAMETER::FIXED_PERIOD, fixed_period);

			const unsigned int	old_capture_source = readCaptureSource();
			const unsigned int	old_decimate = readDecimate();
			while (capture->isCaptureInProgress()) {
				msleep(10);
			}

			writeDecimate(0);
			writeCaptureSource(DATASOURCE_V_A_B_C);

			const uint64_t				t_end = time_us() + ms_to_sleep * 1000ull;
			volatile int16_t*			buffer16 = reinterpret_cast<volatile int16_t*>(capture->buffer->data());
			// Count of Va samples.
			unsigned int				count_va = 0u;
			// Last Va sample.
			int16_t						last_va = 0;
			// Zero crossings.
			std::vector<unsigned int>	zero_cross;
			constexpr unsigned int		NSAMPLES = 32u;
			do {
				const unsigned int	current_angle = _registers->read32(_status_registers_offset + ANGLE_REG);
				capture->startCapture(NSAMPLES * sizeof(uint64_t));
				do {
					msleep(1);
				} while (capture->isCaptureInProgress());

				const int16_t		this_va = *buffer16;
				if (count_va>0 && last_va <= 0 && this_va>0) {
					zero_cross.push_back(current_angle);
				}

				++count_va;
				last_va = this_va;
			} while (time_us() < t_end);


			writeCaptureSource(old_capture_source);
			writeDecimate(old_decimate);
			writeParameter(PSEUDO_PARAMETER::FIXED_PERIOD, old_fixed_period);

			if (zero_cross.size()>0u) {
				// The offset of 150 works for the EDDP Kit.
				constexpr unsigned int	offset = (3*CPR)/(10*PPR) - 15;
				const unsigned int		new_shift = (zero_cross.back() + offset) % CPR;
				write_parameter(ANGLE_SH_REG, new_shift);
			}
			else {
				// TODO: How to report the failure?
			}
		}
	}
	writeParameter(PSEUDO_PARAMETER::MODE, newMode);			// Run motor in speed loop
}

// --------------------------------------------------------------------------------------------------------------------
void FocDevice::stopMotor()
{
	writeParameter(PSEUDO_PARAMETER::MODE, 0);			// Motor OFF
}

// --------------------------------------------------------------------------------------------------------------------
void FocDevice::writeCaptureSource(const unsigned int sourceIndex)
{
	_registers->write32Masked(_parameter_registers_offset + CONTROL2_REG, 0x7, sourceIndex);
}

// --------------------------------------------------------------------------------------------------------------------
unsigned int FocDevice::readCaptureSource() const
{
	const uint32_t	control2 = read_parameter(CONTROL2_REG);
	return control2 & 7u;
}

// --------------------------------------------------------------------------------------------------------------------
unsigned int FocDevice::readLeds()
{
	return _registers->read32(4);
}

// --------------------------------------------------------------------------------------------------------------------
void FocDevice::resetError()
{
	const uint32_t	m = read_parameter(CONTROL2_REG);
	write_parameter(CONTROL2_REG, m & ~CONTROL2_BV_RESET_ERROR);
	write_parameter(CONTROL2_REG, m | CONTROL2_BV_RESET_ERROR);
	write_parameter(CONTROL2_REG, m & ~CONTROL2_BV_RESET_ERROR);
}

// --------------------------------------------------------------------------------------------------------------------
void FocDevice::writeLeds(const uint32_t leds)
{
	const uint32_t	m = read_parameter(CONTROL2_REG);
	if (leds == 0) {
		write_parameter(CONTROL2_REG, m | CONTROL2_BV_LED);
	}
	else {
		write_parameter(CONTROL2_REG, m & ~CONTROL2_BV_LED);
	}
}

// --------------------------------------------------------------------------------------------------------------------
void FocDevice::writeErrorLimit(const unsigned int error_limit)
{
	const uint32_t	m = read_parameter(CONTROL2_REG);
	write_parameter(CONTROL2_REG, (m & ~CONTROL2_BV_ERROR_LIMIT) | ((error_limit << CONTROL2_BIT_ERROR_LIMIT) & CONTROL2_BV_ERROR_LIMIT));
}

// --------------------------------------------------------------------------------------------------------------------
unsigned int FocDevice::readErrorLimit()
{
	const uint32_t	m = read_parameter(CONTROL2_REG);
	return (m & CONTROL2_BV_ERROR_LIMIT) >> CONTROL2_BIT_ERROR_LIMIT;
}

// --------------------------------------------------------------------------------------------------------------------
void FocDevice::writeDecimate(const unsigned int decimationFactor)
{
	const unsigned int	df = std::min(CONTROL2_MAX_DECIMATION, decimationFactor);
	_registers->write32Masked(_parameter_registers_offset + CONTROL2_REG, CONTROL2_BITMASK_DECIMATION, df << CONTROL2_BIT_DECIMATION);
}

// --------------------------------------------------------------------------------------------------------------------
unsigned int FocDevice::readDecimate() const
{
	const uint32_t	control2 = read_parameter(CONTROL2_REG);
	return (control2 & CONTROL2_BITMASK_DECIMATION) >> CONTROL2_BIT_DECIMATION;
}

// --------------------------------------------------------------------------------------------------------------------
void FocDevice::writeSpreadSpectrum(const bool enableSpreadSpectrum)
{
	if (designName == NAME_HLS) {
		const uint32_t	m = read_parameter(CONTROL2_REG);
		if (enableSpreadSpectrum) {
			write_parameter(CONTROL2_REG, m | CONTROL2_BV_SPREAD_SPECTRUM);
		}
		else {
			write_parameter(CONTROL2_REG, m & ~CONTROL2_BV_SPREAD_SPECTRUM);
		}
	}
}

// --------------------------------------------------------------------------------------------------------------------
bool FocDevice::readSpreadSpectrum()
{
	if (designName == NAME_HLS) {
		const uint32_t	m = read_parameter(CONTROL2_REG);
		return (m & CONTROL2_BV_SPREAD_SPECTRUM) != 0u;
	}
	else {
		return false;
	}
}

// --------------------------------------------------------------------------------------------------------------------
void FocDevice::writeParameterValues(std::vector<FocConfiguration::ParameterValue>& pvs)
{
	for (FocConfiguration::ParameterValue& pv : pvs) {
		if (pv.index == FocConfiguration::INDEX_NOT_KNOWN_YET) {
			for (unsigned int i=0; i<parameterCount; ++i) {
				if (pv.name == parameterRegisters[i].name) {
					pv.index = i;
					break;
				}
			}
			if (pv.index < 0) {
				pv.index = FocConfiguration::INDEX_INVALID_NAME;
			}
		}
		if (pv.index >= 0) {
			writeParameter(pv.index, pv.value);
		}
	}
}
