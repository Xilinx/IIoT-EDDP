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
/// \file  Disk.h
/// \brief	Declarations of the namespace Disk.
///
/// \version 	1.0
/// \date		2017
/// \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH

#pragma once

#include <string>	// std::string
#include <functional>	// std::function

namespace smart {
/// Disk operations: list partitions, list mounted filesystems, mount and unmount disk.
namespace Disk {
	/// Partition; entry in /proc/partitions.
	struct Partition {
		/// Major device number.
		unsigned int	major;

		/// Minor device number.
		unsigned int	minor;

		/// Number of blocks.
		unsigned int	blocks;

		/// Name of the disk.
		std::string	name;
	}; // struct Partition

	/// Mount; entry in /proc/mounts.
	struct Mount {
		/// Device name, "/dev/sda1", etc.
		std::string	device;

		/// Mount point.
		std::string	mount_point;

		/// Type of the filesystem.
		std::string	filesystem;

		std::string	options;

		/// Is the filesystem mounted read-only?
		bool		isReadonly() const;
	}; // struct Mount

	/// List partitions.
	/// Can throw errors on failure.
	void getPartitions(std::vector<Partition>& partitions);

	/// List mounts.
	void getMounts(std::vector<Mount>& mounts);

	/// Get device path by reading the link /sys/block/block_device.
	/// Returns empty string when nothing found.
	std::string getSystemDevicePath(const std::string& blockDeviceName);

	/// Get a filtered list of partitions.
	void getPartitions(std::vector<Partition>& partitions, std::function<bool(const Partition& part, const std::string& systemDevice)> filter);
} // namespace Disk.
} // namespace smart
