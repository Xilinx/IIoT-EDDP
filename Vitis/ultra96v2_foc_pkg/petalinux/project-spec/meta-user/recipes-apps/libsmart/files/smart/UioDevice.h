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
/// \file  UioDevice.h
/// \brief	Interface of the class UioDevice.
///
/// \version 	1.0
/// \date		2017
/// \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH

#pragma once

#include <cstdint>			// std::uintptr_t
#include <map>				// std::map
#include <memory>			// shared_ptr
#include <string>			// std::string
#include <vector>			// std::vector

#include "File.h"			// File
#include "MappedFile.h"		// MappedFile



namespace smart {

/// Address map.
class UioMap {
public:
	/// Hardware address.
	std::uintptr_t	addr;
	/// Name of the memory area.
	std::string	name;
	/// Offset, must be null.
	std::uintptr_t	offset;
	/// Size of the memory area.
	std::uintptr_t	size;

	/// Memory-mapped file.
	MappedFile*	map;
};

/// Userspace IO device.
class UioDevice {
public:
	typedef std::map<std::string, std::vector<std::uint8_t>>	IpCoreConfigurationMap;

	/// Index of the device.
	unsigned int		index;

	/// Name of the device.
	std::string		name;

	/// Version of the device.
	std::string		version;

	/// Memory map of the device.
	std::vector<UioMap>	maps;

	/// Configuration of the device as described in the device tree.
	IpCoreConfigurationMap	ipCoreConfiguration;

	/// Get a 32-bit unsigned integer from the IP Core configuration.
	/// Throws an exception when not found.
	std::uint32_t getConfigurationUInt32(const std::string& name);

	/// Get a 32-bit unsigned integer from the IP core configuration.
	/// Returns the default value when not found.
	std::uint32_t getConfigurationUInt32(const std::string& name, const std::uint32_t defaultValue);

	/// Get an array of 32-bit unsigned integers from the IP Core configuration.
	/// Note: This doesn't throw exceptions, but fails silently.
	void getConfigurationUInt32Array(
		std::vector<std::uint32_t>&	buffer,
		const std::string&		name);

	/// Get a string. Throws an exception when not found.
	std::string getConfigurationString(const std::string& name);

	/// Get map. Throw error if not found.
	MappedFile* getRequiredMap(unsigned int mapIndex);

	/// Get the device filehandle for handling IRQ-s.
	std::intptr_t getFileHandle();
public:
	/// Open an UIO device of a given index.
	UioDevice(const unsigned int	device_index);

	/// Open an UIO device of a given name.
	UioDevice(const char* device_name);

	/// Is the device present?
	static bool isDevicePresent(const unsigned int device_index);

	/// Open an UIO device by the given name, if any.
	/// \param name	Name of the uio device (not uio0, etc).
	static std::shared_ptr<UioDevice> openByName(const char* name);

	/// Print device information to stderr.
	void debug_print();

private:
	/// Open an UIO device of a given index and given name.
	UioDevice(const char* uio_name, const unsigned int device_index, const char* device_name);

	/// Initialize the UIO device.
	void _init(const char* uio_name, const unsigned int device_index, const char* device_name);

	std::shared_ptr<File>	_file;
	/// Get the iterator to the configuration of the device as described in the device tree.
	/// Note: this doesn't throw exceptions.
	IpCoreConfigurationMap::const_iterator	_find_config(const std::string& name);

	/// Get a 32-bit unsigned integer from the IP Core configuration.
	bool _getConfigurationUInt32(std::uint32_t& destination, std::string& errorMessage, const std::string& name);
}; // class UioDevice

} // namespace smart
