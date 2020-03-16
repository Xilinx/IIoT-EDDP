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
/// \file  FocConfiguration.h
/// \brief Interface of the class FocConfiguration.
///
/// \version 	1.0
/// \date		2017
/// \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH
#pragma once

#include <memory>	// std::shared_ptr
#include <string>	// std::string
#include <vector>	// std::vector

#include <stdint.h>	// uint32_t, etc.


/// \brief Configuration of the FOC server.
class FocConfiguration {
public:
	/// \brief Value of a parameter in the configuration file.
	struct ParameterValue {
		/// Name of the register.
		std::string	name;
		/// \brief Index of the parameter, <0 when unknown.
		/// See also #INDEX_NOT_KNOWN_YET and #INDEX_INVALID_NAME.
		int			index;
		/// Value of the parameter.
		uint32_t	value;
	};

	/// \brief The index corresponding to the name is not known yet.
	static constexpr int			INDEX_NOT_KNOWN_YET = -1;
	/// \brief The name of the ParameterValue was invalid and no index can be determined.
	static constexpr int			INDEX_INVALID_NAME = -2;

	/// Default name for the configuration file.
	static constexpr const char* 	FILENAME = "/etc/focserver.conf";

	/// Default value for #adc2A.
	static constexpr double			DEFAULT_ADC2A = 0.00039;

	/// Default value for #pwm2V.
	static constexpr double			DEFAULT_PWM2V = 0.0003662;

	/// Pulses per revolution. 0 when undetermined.
	unsigned int					ppr;

	/// Conversion factor from ADC units to mA.
	double							adc2A;

	/// Conversion factor from PWM factors to voltages.
	double							pwm2V;

	/// Initialization sequence.
	std::vector<ParameterValue>		init;

	/// Sequence for changing to the speed mode.
	std::vector<ParameterValue>		speed;

	/// Sequence for changing to the torque mode.
	std::vector<ParameterValue>		torque;

	/// Create new configuration with default values.
	FocConfiguration();

	/// \brief Construct configuration from a JSON string.
	/// Throws an exception when the JSON string is faulty.
	/// \param jsonString	String in the JSON format.
	FocConfiguration(const std::string& jsonString);

	/// \brief Load configuration from a file.
	/// Throws exceptions when the file is faulty or non-existent.
	/// \param filepath	Path to the file to be read.
	/// \return			Smart pointer to the configuration.
	static std::shared_ptr<FocConfiguration>	fromFile(const std::string& filepath);

	/// Dump configuration to standard output.
	void dump();
private:

};
