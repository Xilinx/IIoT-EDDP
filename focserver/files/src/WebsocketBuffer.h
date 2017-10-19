/// \file	WebsocketBuffer.h
/// \brief	Interface of the class WebsocketBuffer.
///
/// \version 	1.0
/// \date		2017
/// \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH

#pragma once

#include <stdint.h>		// uint8_t
#include <string>		// std::string
#include <vector>		// std::vector
#include <deque>		// std::deque

#include <libwebsockets.h>


/// \brief Write buffer, consisting of a queue of the messages to be written and a write buffer for the libwebsockets.
/// This simplifies handling of pre- and postpadding as required by libwebosckets.
///
/// Important: A WebsocketBuffer is safe to use from one thread at a time only.
///
/// Usage: Call writeMessage() any number of times. In the libwebsockets callback, call onWriteable() as needed.
class WebsocketBuffer {
public:
	/// Create new write buffer.
	/// \param wsi		Pointer to the libwebsockets object.
	WebsocketBuffer(struct lws* wsi);

	/// \brief Write a message to the write queue.
	/// It will schedule a callback when the queue was not empty before the call.
	/// \param msg	Message to be written.
	void writeMessage(const std::string& msg);

	/// \brief Write a binary message to the write queue.
	/// It will schedule a callback when the queue was not empty before the call.
	/// \param message1	First message to be written.
	/// \param size1	Size of the first message to be written.
	void writeBinary(const void* message1, unsigned int size1, ...);

	/// Call this from the libwebsockets callback.
	/// This will flush the write queue to the extent possible and schedule new callback if there was some data remaining in the queue.
	int onWriteable();

private:
	/// Check the write error and the queue size.
	/// \param queue_count	Item count in the queue.
	/// \param queue_bytes	Byte count in the queue.
	/// \return true iff and only if no error occured and queue size limit not exceeded either.
	bool _checkQueue(unsigned int& queue_count, unsigned int& queue_bytes);

	/// Write record.
	struct WriteRecord {
		/// Must be either LWS_WRITE_TEXT or LWS_WRITE_BINARY
		enum lws_write_protocol	type;
		std::vector<uint8_t>	buffer;
		unsigned int			bytesWritten;
	};

	std::deque<WriteRecord>		_write_queue;
	std::vector<uint64_t>		_write_buffer;
	struct lws*					_wsi;

	/// Statistics: maximum queue size.
	unsigned int				_max_queue_size;

	/// Statistics: maximum write size.
	unsigned int				_max_write_size;

	/// Was there any write error in the meantime?
	bool						_was_write_error;
};
