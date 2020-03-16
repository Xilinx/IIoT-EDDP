/// \file  FocDevice.h
/// \brief Interface of the class FocDevice.
///
/// \version 	1.0
/// \date		2017
/// \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH

#pragma once

#include <limits>	// std::numeric_limits
#include <memory>	// std::memory

#include <stdint.h>	// uint32_t, etc.

#include <smart/hw/AxiDataCapture.h>
#include <smart/MappedFile.h>
#include <smart/UioDevice.h>

#include "DeviceTreeDevice.h"
#include "FocConfiguration.h"


/// Access to the FOC IP core.
///
/// Example code:
/// @code
///	FocDevice	dev;
///
///	dev.writeParameter(RPM_SP_REG, 1000);
///	dev.startMotor(CONTROL_SPEED);
/// @endcode
class FocDevice {
public:
	/// Name of the SDSoC design, constant string "SDSoc".
	static const char* const	NAME_SDSOC;
	/// Name of the HLS design, constant string "HLS".
	static const char* const	NAME_HLS;

	/// Name of an unknown design.
	static const char* const	NAME_UNKNOWN;

	/// \brief Offset to the pseudo registers.
	/// Important: this should match ARGS_SIZE in foc.h
	static constexpr unsigned int	PSEUDO_PARAMETER_OFFSET = 16u;

	/// \brief Pseudo register indices.
	/// This is common for both parameters and status registers.
	enum PSEUDO_PARAMETER : unsigned int {
		/// Operating mode of the FOC.
		MODE = PSEUDO_PARAMETER_OFFSET,
		/// Fixed speed increment.
		FIXED_PERIOD,
		/// Spread spectrum register.
		SPREAD_SPECTRUM,
	};


	/// Type of a register.
	enum class RegisterType : uint32_t {
		/// Signed 32-bit integer.
		INT32,
		/// Unsigned 32-bit integer.
		UINT32
	};

	/// Description of access to a register in a register bank.
	struct RegisterAccess {
		/// Name of the register.
		const char*			name;
		/// Register index in the register bank (parameter or status).
		const unsigned int	index;
		/// Type of the register.
		const RegisterType	registerType;
		/// Bit shift, if any.
		const int			shift;
		/// Mask of the value in the original position.
		const uint32_t		mask;
	};

	/// Name of the HW design the software is running on. This is detected automatically.
	/// One of #NAME_SDSOC or #NAME_HLS.
	const char*		designName;

	/// Configuration. This will be created anew if not existing.
	std::shared_ptr<FocConfiguration> config;

	/// Number of parameter registers
	unsigned int	parameterCount;

	/// List of the known parameter registers. End marker: nullptr as name.
	const RegisterAccess*	parameterRegisters;

	/// Number of status registers.
	unsigned int	statusCount;

	/// List of the known status registers. End marker: nullptr as name.
	const RegisterAccess*		statusRegisters;
public:
	/// Create new FOC device object.
	FocDevice(std::shared_ptr<FocConfiguration> pConfig);

	/// Create new FOC device object with the default configuration.
	FocDevice();

	/// Get the base address.
	uintptr_t getBaseAddress() const;

	/// \brief Write parameter register.
	/// \param parameterIndex	Index of the parameter register to be written to.
	/// \param parameterValue	Value of the parameter to be written.
	void writeParameter(const unsigned int parameterIndex, const uint32_t parameterValue);

	/// \brief Read parameter register.
	/// \param parameterIndex	Index of the parameter register to be read from.
	/// \return Value of the parameter register.
	uint32_t readParameter(const unsigned int parameterIndex);

	/// String representation of the parameter register in the following format:
	/// NAME CONVERTED_VALUE REGISTER_VALUE
	/// \param buffer		Buffer to store the the string to.
	/// \param parameterIndex	Index of the parameter register to be formatted.
	void readParameterString(std::string& buffer, const unsigned int parameterIndex);

	/// Read status register.
	/// \param statusIndex		Index of the status register to be read.
	/// \return Value of the status register.
	uint32_t readStatus(const unsigned int statusIndex);

	/// String representation of the status register in the following format:
	/// NAME VALUE VALUE
	/// \param buffer		Buffer to store the string to.
	/// \param statusIndex		Index of the status register to be formatted.
	void readStatusString(std::string& buffer, const unsigned int statusIndex);

	/// Perform default initialization.
	/// This does not start the motor.
	void defaultInit();

	/// Start the motor in the given mode.
	/// \param mode			Mode to start the motor in. See the control register in the user manual for the FOC SDSoC project for the applicable values.
	/// \param capture		Data capture device used for capturing the
	void startMotor(const unsigned int mode, smart::hw::AxiDataCapture* capture);

	/// Stop the motor.
	void stopMotor();

	/// Set new capture source.
	/// \param sourceIndex New capture source index.
	void writeCaptureSource(const unsigned int sourceIndex);

	/// Read the capture source index.
	/// \return Capture source index.
	unsigned int readCaptureSource() const;

	/// Read LED-s state.
	/// \return Bitfield of the leds `LD0` ... `LD3` on the ARTY Z7 platform.
	unsigned int readLeds();

	/// Reset the error flag of the speed monitor.
	void resetError();

	/// Write led state.
	/// At the moment only 1 led is supported.
	/// \param leds			0 to turn the led `LD0` on the ARTY Z7 platform off, 1 to turn it on.
	void writeLeds(const uint32_t leds);

	/// Write error limit.
	/// \param error_limit		New error limit for the speed monitor.
	void writeErrorLimit(const unsigned int error_limit);

	/// Read the test error limit.
	/// \return Error limit for the speed monitor.
	unsigned int readErrorLimit();

	/// Write decimation factor (number of samples to skip for every sample captured).
	/// \param decimationFactor	New decimation factor.
	void writeDecimate(const unsigned int decimationFactor);

	/// Read decimation factor.
	/// \return The current decimation factor.
	unsigned int readDecimate() const;

	/// Write the spread spectrum flag.
	/// \param enableSpreadSpectrum True if spread spectrum is to be enabled, false otherwise.
	void writeSpreadSpectrum(const bool enableSpreadSpectrum);

	/// Read the spread spectrum flag.
	/// \return true if the spread spectrum is enabled, false otherwise.
	bool readSpreadSpectrum();
private:
	/// Write a collection of parameter values.
	void writeParameterValues(std::vector<FocConfiguration::ParameterValue>& pvs);

	/// Device on the HW developed with HLS IP cores, if any.
	std::unique_ptr<smart::UioDevice>	_hls_device;

	/// Information about the HW developed with the Vivado SDSoC, if any.
	std::shared_ptr<DeviceTreeDevice>	_sdsoc_info;

	/// \brief Device on the HW developed with the Vivado SDSoC, if any.
	/// This is obtained by opening /dev/mem.
	std::unique_ptr<smart::MappedFile>	_sdsoc_device;

	/// Access to the FOC IP core registers.
	smart::MappedFile* 					_registers;

	/// HW address.
	uintptr_t							_hw_address;

	/// Offset to the parameter register bank.
	const unsigned int					_parameter_registers_offset;

	/// Offset to the status register bank.
	const unsigned int					_status_registers_offset;
};
