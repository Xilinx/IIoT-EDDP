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
