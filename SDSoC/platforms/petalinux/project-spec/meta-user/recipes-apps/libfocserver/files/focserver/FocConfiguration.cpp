/// \file  FocConfiguration.cpp
/// \brief Implementation of the class FocConfiguration.
///
/// \version 	1.0
/// \date		2017
/// \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH

#include <stdexcept>	// std::runtime_error
#include <string>
#include <vector>

#include <stdio.h>			// printf

#include <json/reader.h>
#include <json/value.h>

#include <smart/File.h>
#include <smart/string.h>	// ssprintf

#include "foc.h"
#include "FocConfiguration.h"

using namespace smart;


static const char*	NAME_PPR = "ppr";
static const char*	NAME_ADC2A = "adc2A";
static const char*	NAME_PWM2V = "pwm2V";

static const char*	NAME_INIT = "init";
static const char*	NAME_SPEED = "speed";
static const char*	NAME_TORQUE = "torque";


// --------------------------------------------------------------------------------------------------------------------
static void load_params(std::vector<FocConfiguration::ParameterValue>& dst, Json::Value& parent, const char* name)
{
	Json::Value	v = parent.get(name, Json::Value::null);
	if (!v.isNull() && !v.empty()) {
		FocConfiguration::ParameterValue	pv;
		std::vector<std::string>		v_names(v.getMemberNames());
		for (const std::string& prop_name : v_names) {
			pv.name = prop_name;
			pv.index = FocConfiguration::INDEX_NOT_KNOWN_YET;

			Json::Value	x = v.get(prop_name, Json::Value::null);
			if (x.isNull()) {
				throw std::runtime_error(ssprintf("Configuration: root.%s.%s has no value", name, prop_name.c_str()));
			}
			if (x.isUInt()) {
				pv.value = x.asUInt();
			}
			else if (x.isInt()) {
				pv.value = x.asInt();
			}
			else if (x.isInt64()) {
				pv.value = x.asInt64();
			}
			else if (x.isString()) {
				pv.value = smart::uint_of(x.asString());
			}
			else {
				throw std::runtime_error(ssprintf("Configuration: root.%s.%s is of unknown type", name, prop_name.c_str()));
			}
			dst.push_back(pv);
		}
	}
}

// --------------------------------------------------------------------------------------------------------------------
FocConfiguration::FocConfiguration()
: ppr(PPR),
  adc2A(DEFAULT_ADC2A),
  pwm2V(DEFAULT_PWM2V)
{
}

// --------------------------------------------------------------------------------------------------------------------
FocConfiguration::FocConfiguration(const std::string& jsonString)
{
	if (jsonString.size() == 0u) {
		throw std::runtime_error("Empty configuration not permitted");
	}
	Json::Reader	reader;
	Json::Value		root;

	if (!reader.parse(&jsonString[0], &jsonString[0] + jsonString.size(), root)) {
		throw std::runtime_error("Invalid JSON");
	}

	// Load the values from JSONCPP.
	ppr = root.get(NAME_PPR, PPR).asInt();
	adc2A = root.get(NAME_ADC2A, DEFAULT_ADC2A).asDouble();
	pwm2V = root.get(NAME_PWM2V, DEFAULT_PWM2V).asDouble();
	load_params(init, root, NAME_INIT);
	load_params(speed, root, NAME_SPEED);
	load_params(torque, root, NAME_TORQUE);
}

// --------------------------------------------------------------------------------------------------------------------
std::shared_ptr<FocConfiguration>	FocConfiguration::fromFile(const std::string& filepath)
{
	std::string	s = File::readAllText(filepath);
	return std::make_shared<FocConfiguration>(s);
}

// --------------------------------------------------------------------------------------------------------------------
static void dump_params(const char* name, std::vector<FocConfiguration::ParameterValue>& params)
{
	printf("%s:\n", name);

	for (unsigned int i=0; i<params.size(); ++i) {
		const FocConfiguration::ParameterValue&	pv = params[i];
		printf("%10s: %u\n", pv.name.c_str(), pv.value);
	}
}

// --------------------------------------------------------------------------------------------------------------------
void FocConfiguration::dump()
{
	printf("Pulses per revolution: %u\n", ppr);
	printf("Amperes per ADC code:  %g\n", adc2A);
	printf("Volts per PWM code:    %g\n", pwm2V);

	dump_params(NAME_INIT, init);
	dump_params(NAME_SPEED, speed);
	dump_params(NAME_TORQUE, torque);
}
