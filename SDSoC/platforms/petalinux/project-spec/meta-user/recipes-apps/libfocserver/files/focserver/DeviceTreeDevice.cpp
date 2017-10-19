/// \file	DeviceTreeDevice.h
/// \brief	Implementation of the class DeviceTreeDevice.
///
/// \version 	1.0
/// \date		2017
/// \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH

#include <alloca.h>		// alloca
#include <dirent.h>		// scandir
#include <errno.h>	// errno, EEXIST
#include <stdio.h>		// fopen/read, etc.
#include <string.h>		// strncmp
#include <sys/stat.h>	// stat
#include <sys/types.h>
#include <unistd.h>		// getpagesize

#include <smart/string.h>

#include "DeviceTreeDevice.h"



using namespace smart;


#define	DEVICE_TREE_DIR	"/sys/firmware/devicetree/base/amba_pl"

const char* const	DeviceTreeDevice::PROPERTY_COMPATIBLE = "compatible";
const char* const	DeviceTreeDevice::PROPERTY_TRENZ_BIZ_NAME = "trenz.biz,name";

// --------------------------------------------------------------------------------------------------------------------
static int	read_all_bytes(void* buffer, const unsigned int buffer_size, const std::string& device_dir, const char* filename)
{
	std::string	full_path;
	ssprintf(full_path, "%s/%s", device_dir.c_str(), filename);

	FILE*	f = fopen(full_path.c_str(), "rb");
	if (f == nullptr) {
		return -1;
	}

	const int	r = fread(buffer, 1, buffer_size, f);
	fclose(f);
	return r;
}

// --------------------------------------------------------------------------------------------------------------------
static int read_all_text(std::string& buffer, const std::string& device_dir, const char* filename)
{
	buffer.resize(4096);
	const int r = read_all_bytes(&buffer[0], buffer.size(), device_dir, filename);
	if (r>=0) {
		buffer.resize(r);
	}
	return r;
}

// --------------------------------------------------------------------------------------------------------------------
static uint32_t cpu_of_be32u(const uint32_t be32u)
{
	return ((be32u >> 24) & 0x000000FFu)
			| ((be32u >> 8) & 0x0000FF00u)
			| ((be32u << 8) & 0x00FF0000u)
			| ((be32u << 24) & 0xFF000000u);
}

// --------------------------------------------------------------------------------------------------------------------
static int read_uint32_array(uint32_t* value, const unsigned int nValues, const std::string& device_dir, const char* propertyName)
{
	const int	bytes_to_read = sizeof(uint32_t) * nValues;
	uint32_t*	p = reinterpret_cast<uint32_t*>(alloca(bytes_to_read));
	const int	r_read = read_all_bytes(p, bytes_to_read, device_dir, propertyName);

	if (r_read >= 0) {
		const unsigned int	n = r_read / sizeof(uint32_t);
		for (unsigned int i=0; i<n; ++i) {
			value[i] = cpu_of_be32u(p[i]);
		}
		return n;
	}
	else {
		return -1;
	}
}

// --------------------------------------------------------------------------------------------------------------------
DeviceTreeDevice::DeviceTreeDevice(const std::string& pDeviceDirectoryPath, const std::string& pName, const std::string& pCompatible, const uintptr_t pAddress, const unsigned int pLength)
: deviceDirectoryPath(pDeviceDirectoryPath),
  name(pName),
  compatible(pCompatible),
  address(pAddress),
  length(pLength)
{
}


// --------------------------------------------------------------------------------------------------------------------
std::shared_ptr<DeviceTreeDevice>	DeviceTreeDevice::findByProperty(const char* propertyName, const char* propertyValue)
{
	const unsigned int	value_length = strlen(propertyValue);

	// Scan the device tree directory for files.
	DIR*	dir = opendir(DEVICE_TREE_DIR);
	if (dir == nullptr) {
		return std::shared_ptr<DeviceTreeDevice>();
	}

	std::string	device_dir;
	std::string	p_value;
	std::string	p_name;
	uint32_t	p_reg[2];

	struct stat	st;

	for (struct dirent* ent=readdir(dir); ent!=nullptr; ent=readdir(dir)) {
		ssprintf(device_dir, "%s/%s", DEVICE_TREE_DIR, ent->d_name);

		// Must be directory.
		if (stat(device_dir.c_str(), &st) != 0 || (st.st_mode & S_IFDIR)==0) {
			continue;
		}
		// Compatible string must match.
		if (read_all_text(p_value, device_dir, propertyName) <= 0  || strncmp(p_value.c_str(), propertyValue, std::min<unsigned int>(value_length, p_value.size())) != 0) {
			continue;
		}
		// Parameters must be readable.
		if (read_all_text(p_name, device_dir, "name") <= 0
				|| read_uint32_array(p_reg, sizeof(p_reg), device_dir, "reg") < 2) {
			continue;
		}
		closedir(dir);
		std::string	p_compatible;
		if (strcmp(propertyName, PROPERTY_COMPATIBLE)==0) {
			p_compatible = propertyValue;
		}
		else {
			read_all_text(p_compatible, device_dir, PROPERTY_COMPATIBLE);
		}
		return std::make_shared<DeviceTreeDevice>(device_dir, p_name, p_compatible, p_reg[0], p_reg[1]);
	}
	closedir(dir);

	// Nothing found :(
	return std::shared_ptr<DeviceTreeDevice>();
}

// --------------------------------------------------------------------------------------------------------------------
int DeviceTreeDevice::readUInt32Array(uint32_t* value, const unsigned int nValues, const char* propertyName) const
{
	return read_uint32_array(value, nValues, deviceDirectoryPath, propertyName);
}

// --------------------------------------------------------------------------------------------------------------------
int DeviceTreeDevice::readUInt32(uint32_t& value, const char* propertyName) const
{
	return read_uint32_array(&value, 1, deviceDirectoryPath, propertyName);
}

// --------------------------------------------------------------------------------------------------------------------
void DeviceTreeDevice::demo()
{
	const char*	foc1 = "xlnx,foc-";
	const char*	name_addr_width = "xlnx,s-axi-axilites-addr-width";
	const char*	name_data_width = "xlnx,s-axi-axilites-data-width";
	std::shared_ptr<DeviceTreeDevice>	fd = DeviceTreeDevice::findByProperty(DeviceTreeDevice::PROPERTY_COMPATIBLE, foc1);
	if (fd) {
		uint32_t	addr_width = 0;
		uint32_t	data_width = 0;
		const char*	s_compatible = fd->compatible.c_str();
		printf("%s: addr=%p, length=%u bytes\n", s_compatible, (void*)fd->address, fd->length);

		if (fd->readUInt32(addr_width, name_addr_width) == 1) {
			printf("%s: %s = <%u>\n", s_compatible, name_addr_width, addr_width);
		}
		if (fd->readUInt32(data_width, name_data_width) == 1) {
			printf("%s: %s = <%u>\n", s_compatible, name_data_width, data_width);
		}
	}
	else {
		printf("%s: not found in the device tree.\n", foc1);
	}
}
