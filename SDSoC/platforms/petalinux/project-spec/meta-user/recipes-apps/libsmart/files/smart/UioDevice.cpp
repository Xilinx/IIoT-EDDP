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
/// \file  UioDevice.cpp
/// \brief	Implementation of the class UioDevice.
///
/// \version 	1.0
/// \date		2017
/// \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH

#include "UioDevice.h"


#include <cstdint>		// std::uintptr_t
#include <memory>		// std::shared_ptr
#include <limits>		// std::limits
#include <stdexcept>	// std::runtime_error
#include <string>		// std::string
#include <vector>		// std::vector

#include <ctype.h>		// isspace
#if !defined(WIN32)
#include <dirent.h>		// scandir
#include <inttypes.h>		// PRIuPTR
#include <unistd.h>		// getpagesize
#include <string.h>		// strcasecmp
#include <sys/types.h>	// stat
#include <sys/stat.h>	// stat
#endif

#include "Directory.h"		// Directory::getFiles
#include "File.h"			// File::readAllText
#include "MappedFile.h"		// MappedFile
#include "Path.h"
#include "string.h"			// ssprintf

#include "UioDevice.h"		// ourselves.


namespace smart {

/// Prefix of the UIO path.
#define	UIO_PATH		"/sys/class/uio"
#define	UIO_PATH_PREFIX	UIO_PATH	"/uio"

// -------------------------------------------------------------------------------------
static std::uintptr_t
read_uint(const std::string& base_dir, const std::string& filename)
{
	const auto	full_path = ssprintf("%s/%s", base_dir.c_str(), filename.c_str());
	const auto	s = File::readAllText(full_path);
	return uint_of(s);
}

// -------------------------------------------------------------------------------------
static std::string
read_text(const std::string& base_dir, const char* filename)
{
	const auto	full_path = ssprintf("%s/%s", base_dir.c_str(), filename);
	auto		s = File::readAllText(full_path);
	while (s.size()>0 && isspace(s[s.size()-1])) {
		s.resize(s.size()-1);
	}
	return s;
}

// -------------------------------------------------------------------------------------
static void
read_map(
	UioMap&			map,
	const std::string&	device_dir,
	const unsigned int	map_index)
{
	const auto map_dir = ssprintf("%s/maps/map%u", device_dir.c_str(), map_index);
	map.addr = read_uint(map_dir, "addr");
	map.name = read_text(map_dir, "name");
	map.offset = read_uint(map_dir, "offset");
	map.size = read_uint(map_dir, "size");
}

// --------------------------------------------------------------------------------------------------------------------
static const std::string device_tree_roots[] = {
	std::string("/sys/firmware/devicetree/base/amba_pl/"),
	std::string("/sys/firmware/devicetree/base/amba/"),
	std::string("/proc/device-tree/amba@0/"),
	std::string(),
	};

// --------------------------------------------------------------------------------------------------------------------
static void getIpCoreConfiguration(
	std::map<std::string, std::vector<std::uint8_t>>&	configuration,
	const std::string&									ipCoreName,
	const std::uintptr_t								hwAddress)
{
	const std::string	s_addr = ssprintf("@%08x", hwAddress);
	for (unsigned int root_index=0; device_tree_roots[root_index].size()>0; ++root_index) {
		const std::string&	dtr = device_tree_roots[root_index];
		if (File::exists(dtr)) {
			const auto dirs = Directory::getFiles(dtr);
			for (const auto& sdir : dirs) {
				if (ends_with(sdir, s_addr)) {
					const auto ip_core_directory = Path::combine(dtr, sdir);
					auto files = Directory::getFiles(ip_core_directory);
					for (const auto& s : files) {
						const std::string	filename = Path::combine(ip_core_directory, s);

						std::vector<std::uint8_t>	bytes;
						File::readAllBytes(bytes, filename);
						configuration.insert(std::pair<std::string, std::vector<std::uint8_t>>(s, bytes));
					}
					return;
				}
			}
		}
	}
}

// -------------------------------------------------------------------------------------
std::uint32_t UioDevice::getConfigurationUInt32(const std::string& name, const std::uint32_t defaultValue)
{
	uint32_t r = 0;
	std::string	error_message;
	if (_getConfigurationUInt32(r, error_message, name)) {
		return r;
	} else {
		return defaultValue;
	}
}


// -------------------------------------------------------------------------------------
std::uint32_t
UioDevice::getConfigurationUInt32(const std::string& name)
{
	uint32_t r = 0;
	std::string	error_message;
	if (_getConfigurationUInt32(r, error_message, name)) {
		return r;
	} else {
		throw std::runtime_error(error_message);
	}
}

// -------------------------------------------------------------------------------------
void
UioDevice::getConfigurationUInt32Array(
	std::vector<std::uint32_t>&	buffer,
	const std::string&		name)
{
	auto it = _find_config(name);
	if (it == ipCoreConfiguration.end()) {
		return;
	}
	const unsigned int	n = it->second.size() / sizeof(std::uint32_t);

	for (unsigned int i=0; i<n; ++i) {
		std::uint32_t	r = 0;
		for (unsigned int j=0; j<sizeof(std::uint32_t); ++j) {
			r = (r << 8) | it->second[i*sizeof(std::uint32_t) + j];
		}
		buffer.push_back(r);
	}
}

// -------------------------------------------------------------------------------------
std::string
UioDevice::getConfigurationString(const std::string& name)
{
	auto it = _find_config(name);
	if (it == ipCoreConfiguration.end()) {
		throw std::runtime_error(ssprintf("%s: key '%s' not found in device tree", this->name.c_str(), name.c_str()));
	}
	std::string r;
	for (const auto c : it->second) {
		// reinterpret_cast<> won't cut it.
		r += (char)(c);
	}
	return r;
}

// -------------------------------------------------------------------------------------
MappedFile*
UioDevice::getRequiredMap(unsigned int mapIndex)
{
	if (mapIndex < maps.size()) {
		return maps[mapIndex].map;
	} else {
		const auto n = maps.size();
		switch (n) {
		case 0:
			throw std::runtime_error(ssprintf("%s: No map[%u], there no maps at all", name.c_str(), mapIndex));
		case 1:
			throw std::runtime_error(ssprintf("%s: No map[%u], there is 1 map only", name.c_str(), mapIndex));
		default:
			throw std::runtime_error(ssprintf("%s: No map[%u], there %u maps only", name.c_str(), mapIndex, n));
		}
	}
}

// -------------------------------------------------------------------------------------
std::intptr_t UioDevice::getFileHandle()
{
	if (_file) {
		return _file->getHandle();
	}
	else {
		return -1;
	}
}

#if defined(WIN32)
// -------------------------------------------------------------------------------------
static const int int8_of_hexchar(const char c)
{
	if (c >= '0' && c <= '9') {
		return c - '0';
	} else if (c >= 'a' && c <= 'f') {
		return c - 'a' + 10;
	} else if (c >= 'A' && c <= 'F') {
		return c - 'A' + 10;
	} else {
		throw std::runtime_error(ssprintf("uint8_of_hex: invalid argument '%c' (0x%02X)", c, c));
	}
}
#endif

// -------------------------------------------------------------------------------------
UioDevice::UioDevice(const unsigned int	device_index)
{
	char	uio_name[30];
	char	device_dir[100];

	sprintf(uio_name, "uio%u", device_index);
	sprintf(device_dir, UIO_PATH "/%s", uio_name);
	const auto	device_name = read_text(device_dir, "name");
	_init(uio_name, device_index, device_name.c_str());
}

// -------------------------------------------------------------------------------------
/// \param uioName   	Output parameter: path to the UIO device file
/// \param deviceIndex	Output parameter: UIO device index.
/// \param deviceName	Name of the UIO device.
/// \param pdeviceName	Name of the device to search for.
/// \return True iff the device was found, false otherwise.
static bool scan_by_name(std::string& uioName, unsigned int& deviceIndex, std::string& deviceName, const char* pDeviceName)
{
	char		device_dir[100];

	for (unsigned int device_index=0; UioDevice::isDevicePresent(device_index); ++device_index) {
		ssprintf(uioName, "uio%u", device_index);
		sprintf(device_dir, UIO_PATH "/%s", uioName.c_str());
		deviceName = read_text(device_dir, "name");
		if (strcasecmp(deviceName.c_str(), pDeviceName)==0) {
			deviceIndex = device_index;
			return true;
		}
	}
	return false;
}

// -------------------------------------------------------------------------------------
UioDevice::UioDevice(const char* device_name)
{
	std::string		uio_name;
	unsigned int	uio_device_index = UINT32_MAX;
	std::string		uio_device_name;

	if (scan_by_name(uio_name, uio_device_index, uio_device_name, device_name)) {
		_init(uio_name.c_str(), uio_device_index, uio_device_name.c_str());
	}
	else {
		throw std::runtime_error(ssprintf("UIO Device '%s' not found", device_name));
	}
}

// -------------------------------------------------------------------------------------
void UioDevice::_init(const char* uio_name, const unsigned int device_index, const char* device_name)
{
	index = device_index;
	_file = std::make_shared<File>(ssprintf("/dev/%s", uio_name));

	const auto	device_dir = ssprintf(UIO_PATH_PREFIX "%u", device_index);
	const auto	maps_dir = ssprintf("%s/maps", device_dir.c_str());

	std::vector<std::string>	map_dirs(Directory::getFiles(maps_dir));

	name = device_name;
	version = read_text(device_dir, "version");

	unsigned int map_index = 0;
	for (const auto& dir : map_dirs) {
		std::string	dir2 = ssprintf("map%u", map_index);
		if (dir2 == dir) {
			UioMap	map;
			read_map(map, device_dir, map_index);
			map.map = _file->createMapping(map_index * MappedFile::pageSize(), map.size);
			maps.push_back(map);
			++map_index;
		}
		else {
			throw std::runtime_error(ssprintf("UioDevice %u: Expected map '%s', got map '%s'", map_index, dir2.c_str(), dir.c_str()));
		}
	}
	getIpCoreConfiguration(ipCoreConfiguration, name, maps.size()==0 ? 0 : maps[0].addr);
}

// -------------------------------------------------------------------------------------
bool
UioDevice::isDevicePresent(const unsigned int device_index)
{

#if (WIN32)
	return device_index == 0 || device_index == 1;
#else
	char		device_dir[200];
	struct stat	st;

	sprintf(device_dir, UIO_PATH_PREFIX "%u", device_index);
	const int	r_stat = stat(device_dir, &st);
	return r_stat == 0;
#endif
}

// -------------------------------------------------------------------------------------
std::shared_ptr<UioDevice> UioDevice::openByName(const char* name)
{
	std::string		uio_name;
	unsigned int	uio_device_index = std::numeric_limits<unsigned int>::max();
	std::string		uio_device_name;

	if (scan_by_name(uio_name, uio_device_index, uio_device_name, name)) {
		return std::shared_ptr<UioDevice>(new UioDevice(uio_name.c_str(), uio_device_index, uio_device_name.c_str()));
	}
	else
	{
		return std::shared_ptr<UioDevice>();
	}
}

// -------------------------------------------------------------------------------------
void
UioDevice::debug_print()
{
	fprintf(stderr, "uio%u: name=%s, version=%s\n", index, name.c_str(), version.c_str());
	for (unsigned int i=0; i<maps.size(); ++i) {
		const auto& map = maps[i];
		fprintf(stderr, "\tmap[%u]: name=%s, addr=0x%p, size=%" PRIuPTR ", offset=0x%p\n",
			i, map.name.c_str(), (void*)map.addr, map.size, (void*)map.offset);
	}

	fprintf(stderr, "\tIP core configuration (%zu items):\n", ipCoreConfiguration.size());
	std::string	tmp;
	for (const auto& k : ipCoreConfiguration) {
		tmp.clear();
		for (const auto b : k.second) {
			tmp += ssprintf("%02X ", (int)b);
		}
		fprintf(stderr, "\t\t%s : %s\n", k.first.c_str(), tmp.c_str());
	}
}

// -------------------------------------------------------------------------------------
UioDevice::UioDevice(const char* uio_name, const unsigned int device_index, const char* device_name)
{
	_init(uio_name, device_index, device_name);
}

// -------------------------------------------------------------------------------------
UioDevice::IpCoreConfigurationMap::const_iterator
UioDevice::_find_config(const std::string& name)
{
	auto it = ipCoreConfiguration.find(name);
	if (it == ipCoreConfiguration.end()) {
		for (auto ii=ipCoreConfiguration.begin(); ii!=ipCoreConfiguration.end(); ++ii) {
			const auto comma_pos = ii->first.find(',');
			if (comma_pos != std::string::npos) {
				const auto name2 = ii->first.substr(comma_pos+1);
				if (name2 == name) {
					it = ii;
					break;
				}
			}
		}
	}
	return it;
}

// -------------------------------------------------------------------------------------
bool UioDevice::_getConfigurationUInt32(std::uint32_t& destination, std::string& errorMessage, const std::string& name)
{
	auto it = _find_config(name);
	if (it == ipCoreConfiguration.end()) {
		ssprintf(errorMessage, "%s: key '%s' not found in device tree", this->name.c_str(), name.c_str());
		return false;
	}
	if (it->second.size() < sizeof(std::uint32_t)) {
		ssprintf(errorMessage, "%s: key '%s' in device tree is short of 4 bytes.", this->name.c_str(), name.c_str());
		return false;
	}

	std::uint32_t	r = 0;
	for (unsigned int i=0; i<sizeof(std::uint32_t); ++i) {
		r = (r << 8) | it->second[i];
	}
	destination = r;
	return true;
}

} // namespace smart
