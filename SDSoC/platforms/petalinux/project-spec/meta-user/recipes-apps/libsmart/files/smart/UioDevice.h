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
