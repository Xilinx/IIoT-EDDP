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
/// \file  AxiDataCapture.cpp
/// \brief Implementation of the class AxiDataCapture.
///
/// \version 	1.0
/// \date		2017
/// \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH

#include <inttypes.h>		// PRIx64, etc.
#include <smart/hw/AxiDataCapture.h>

#include <smart/time.h>



namespace smart {
namespace hw {


// --------------------------------------------------------------------------------------------------------------------
const char*		AxiDataCapture::DEFAULT_UIO_NAME = "AXI-Data-Capture";

/// trenz.biz,capture-channels [UInt32] (9)
static const std::string	DEVICETREE_CAPTURE_CHANNELS("capture-channels");

/// trenz.biz,cdata-width [UInt32] (16)
static const std::string	DEVICETREE_CDATA_WIDTH("cdata-width");

/// trenz.biz,channels [UInt32] (9)
static const std::string	DEVICETREE_CHANNELS("channels");

/// Sample rate of the data capture.
static const std::string	DEVICETREE_SAMPLE_RATE("sample-rate");


namespace {
enum {
	/// Control bits:
	/// 0 - Interrupt status
	REGISTERINDEX_CONTROL = 0,

	/// Transfer size
	REGISTERINDEX_TRANSFER_SIZE = 1,

	/// Timestamp(31:0)
	REGISTERINDEX_TRANSFER_COUNT = 2,

	/// Memory buffer base address
	REGISTERINDEX_ADDRESS = 3,
};

enum {
	/// 0=>1 triggers.
	BV_CONTROL_SOFTTRIGGER = 1 << 0,

	/// Tell the internal FIFO to hold the data instead of just ignoring it.
	/// This has to be set for the duration of the data transfer.
	BV_CONTROL_DATAHOLD = 1 << 1,
};
} // anonymous namespace.

// --------------------------------------------------------------------------------------------------------------------
AxiDataCapture::AxiDataCapture(std::shared_ptr<smart::UioDevice>	pDevice)
: _device(pDevice),
  _registers(_device->getRequiredMap(0)),
  _start_time_adc(0),
  _last_transfer_count(0),
  buffer(_device->getRequiredMap(1)),
  nchannels(_device->getConfigurationUInt32(DEVICETREE_CHANNELS)),
  sample_width(_device->getConfigurationUInt32(DEVICETREE_CDATA_WIDTH)),
  sample_rate(_device->getConfigurationUInt32(DEVICETREE_SAMPLE_RATE))
{
	// Registers.
	_registers->createShadow(
		  (1u << REGISTERINDEX_CONTROL) |
		  (1u << REGISTERINDEX_TRANSFER_COUNT)
		  );

	_registers->write32(REGISTERINDEX_CONTROL, 0);
	_registers->write32(REGISTERINDEX_ADDRESS, _device->maps[1].addr);
	_registers->write32(REGISTERINDEX_TRANSFER_SIZE, buffer->size());
	_last_transfer_count = _registers->read32(REGISTERINDEX_TRANSFER_COUNT);
}

// --------------------------------------------------------------------------------------------------------------------
AxiDataCapture::AxiDataCapture(const char* uio_name)
	: AxiDataCapture(std::make_shared<smart::UioDevice>(uio_name))
{
}

// --------------------------------------------------------------------------------------------------------------------
AxiDataCapture::~AxiDataCapture()
{
	if (_registers) {
		_registers->write32(REGISTERINDEX_CONTROL, 0);
	}
}

// --------------------------------------------------------------------------------------------------------------------
std::shared_ptr<AxiDataCapture>	AxiDataCapture::openByName(const char* pName)
{
	auto	dev = UioDevice::openByName(pName);
	if (dev) {
		return std::shared_ptr<AxiDataCapture>(new AxiDataCapture(dev));
	}
	else {
		return std::shared_ptr<AxiDataCapture>();
	}
}

// --------------------------------------------------------------------------------------------------------------------
unsigned int AxiDataCapture::startCapture(const unsigned int transfer_size)
{
	const unsigned int	bytes_per_sample = (sample_width * nchannels) / 8u;
	const unsigned int	nsamples = transfer_size / bytes_per_sample;
	const unsigned int	capture_time_us = (nsamples * static_cast<uint64_t>(1000U * 1000U)) / sample_rate;

	// Transfer has to be disabled for a moment, otherwise the trigger won't work.
	_registers->write32(REGISTERINDEX_CONTROL, BV_CONTROL_DATAHOLD);
	_registers->write32(REGISTERINDEX_TRANSFER_SIZE, nsamples * bytes_per_sample);
	// Record the transfer count so far.
	_last_transfer_count = _registers->read32(REGISTERINDEX_TRANSFER_COUNT);
	// Start the trigger sequence.
	_registers->write32(REGISTERINDEX_CONTROL, BV_CONTROL_SOFTTRIGGER | BV_CONTROL_DATAHOLD);

	return capture_time_us;
}

// --------------------------------------------------------------------------------------------------------------------
bool AxiDataCapture::isCaptureInProgress()
{
	const uint32_t	new_transfer_count = _registers->read32(REGISTERINDEX_TRANSFER_COUNT);
	if (new_transfer_count == _last_transfer_count) {
		const uint32_t	control = _registers->read32(REGISTERINDEX_CONTROL);
		if ((control & BV_CONTROL_SOFTTRIGGER) != 0u) {
			return true;
		}
	}
	else {
		/// Completed.
		_registers->write32(REGISTERINDEX_CONTROL, 0);
	}
	return false;
}

} // namespace hw
} // namespace smart
