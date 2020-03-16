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
/// \file	WebsocketBuffer.cpp
/// \brief	Implementation of the class WebsocketBuffer.
///
/// \version 	1.0
/// \date		2017
/// \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH

#include <stdarg.h>		// va_list, etc.
#include <string.h>		// memcpy

#include "WebsocketBuffer.h"

/// Buffer element
typedef uint64_t			buffer_element_t;


/// Limit of the write queue length.
constexpr unsigned int	QUEUE_LENGTH_LIMIT	= 500;

/// Limit of the total data size in a queue, in bytes.
constexpr unsigned int	QUEUE_BYTES_LIMIT	= 10 * 1024 * 1024;

/// Alignment, in bytes.
constexpr unsigned int	ALIGNMENT = (sizeof(buffer_element_t));

/// Align a value.
#define	ALIGN(x_align)	(ALIGNMENT*(((x_align) + ALIGNMENT - 1u)/ALIGNMENT))

/// Size of pre-padding, in bytes, aligned.
constexpr unsigned int	PRE_PADDING = ALIGN(LWS_SEND_BUFFER_PRE_PADDING);

/// Size of post-paddding, in bytes, aligned.
constexpr unsigned int	POST_PADDING = ALIGN(LWS_SEND_BUFFER_POST_PADDING);

/// Size above which messages will be fragmentized.
constexpr unsigned int	FRAGMENT_SIZE = 32*1024;


// --------------------------------------------------------------------------------------------------------------------
WebsocketBuffer::WebsocketBuffer(struct lws* wsi)
:
 _write_buffer((PRE_PADDING + FRAGMENT_SIZE + POST_PADDING) / sizeof(_write_buffer[0])),
 _wsi(wsi),
 _max_queue_size(0),
 _max_write_size(0),
 _was_write_error(false)
{
}

// --------------------------------------------------------------------------------------------------------------------
void WebsocketBuffer::writeMessage(const std::string& msg)
{
	unsigned int	queue_count = 0;
	unsigned int	queue_bytes = 0;
	if (!_checkQueue(queue_count, queue_bytes)) {
		return;
	}
	const bool was_empty = queue_count==0u;

	_write_queue.emplace_back();
	WriteRecord& packet = _write_queue.back();
	packet.type = LWS_WRITE_TEXT;
	packet.buffer.resize(msg.size());
	memcpy(&packet.buffer[0], msg.c_str(), msg.size());
	packet.bytesWritten = 0;

	const unsigned int	qsize = _write_queue.size();
	if (qsize > _max_queue_size) {
		_max_queue_size = qsize;
	}

	if (was_empty) {
		lws_callback_on_writable(_wsi);
	}
}

// --------------------------------------------------------------------------------------------------------------------
void WebsocketBuffer::writeBinary(const void* message1, unsigned int size1, ...)
{
	unsigned int	queue_count = 0;
	unsigned int	queue_bytes = 0;
	unsigned int	total_size = size1;
	const void*		message2;
	unsigned int	size2;
	unsigned int	so_far = size1;
	va_list			ap;

	// Check the queue.
	if (!_checkQueue(queue_count, queue_bytes)) {
		return;
	}
	const bool was_empty = queue_count==0u;

	// Count the total number of bytes.
	va_start(ap, size1);
	for (;;) {
		message2 = va_arg(ap, const void*);
		if (message2 == nullptr) {
			break;
		}
		size2 = va_arg(ap, unsigned int);
		total_size += size2;
	}
	va_end(ap);

	// Create new write record.
	_write_queue.emplace_back();
	WriteRecord& packet = _write_queue.back();
	packet.type = LWS_WRITE_BINARY;
	packet.buffer.resize(total_size);

	// Copy stuff over.
	memcpy(&packet.buffer[0], message1, size1);
	va_start(ap, size1);
	for (;;) {
		message2 = va_arg(ap, const void*);
		if (message2 == nullptr) {
			break;
		}
		size2 = va_arg(ap, unsigned int);
		memcpy(&packet.buffer[so_far], message2, size2);
		so_far += size2;
	}
	va_end(ap);

	packet.bytesWritten = 0;

	// Statistics.
	const unsigned int	qsize = _write_queue.size();
	if (qsize > _max_queue_size) {
		_max_queue_size = qsize;
	}

	// To start writing again, mark us as writable.
	if (was_empty) {
		lws_callback_on_writable(_wsi);
	}
}

// --------------------------------------------------------------------------------------------------------------------
int WebsocketBuffer::onWriteable()
{
	// NB! Fragments:
	//
	// The write_mode should be set as below:
	// int write_mode;
	// write_mode = LWS_WRITE_BINARY; // single frame, no fragmentation
	// write_mode = LWS_WRITE_BINARY | LWS_WRITE_NO_FIN; // first fragment
	// write_mode = LWS_WRITE_CONTINUATION | LWS_WRITE_NO_FIN; // all middle fragments
	// write_mode = LWS_WRITE_CONTINUATION; // last fragment
	//
	// More details can be found in the fragmentation section of the WebSocket RFC: https://tools.ietf.org/html/rfc6455#section-5.4
	//
	// Source: http://stackoverflow.com/questions/33916549/libwebsocket-send-big-messages-with-limited-payload
	bool			stop_sending = false;
	unsigned char*	write_buffer = reinterpret_cast<unsigned char*>(&_write_buffer[PRE_PADDING / sizeof(_write_buffer[0])]);

	while (!stop_sending && !_write_queue.empty()) {
		WriteRecord&				msg = _write_queue.front();
		const unsigned int			msg_size = msg.buffer.size();

		do {
			unsigned int				todo;
			int							write_protocol;

			if (msg_size <= FRAGMENT_SIZE) {
				todo = msg_size;
				write_protocol = msg.type;
			}
			else {
				// Fragmented write.
				if (msg.bytesWritten == 0u) {
					// First fragment.
					todo = FRAGMENT_SIZE;
					write_protocol = msg.type | LWS_WRITE_NO_FIN;
				}
				else {
					const unsigned int	real_todo = msg_size - msg.bytesWritten;
					if (real_todo > FRAGMENT_SIZE) {
						// Middle fragments.
						todo = FRAGMENT_SIZE;
						write_protocol = LWS_WRITE_CONTINUATION | LWS_WRITE_NO_FIN;
					}
					else {
						todo = real_todo;
						write_protocol = LWS_WRITE_CONTINUATION;
					}
				}
			}

			// sorry, have to memcpy. Memcpy is cheap, guys :)
			memcpy(write_buffer, &msg.buffer[0] + msg.bytesWritten, todo);
			const auto r = lws_write(_wsi, write_buffer, todo, (lws_write_protocol)write_protocol);
			if (static_cast<unsigned int>(r) == todo) {
				if (todo > _max_write_size)
				{
					_max_write_size = todo;
				}
				_was_write_error = false;
				msg.bytesWritten += todo;
			}
			else {
				if (r > 0) {
					msg.bytesWritten += r;
					_was_write_error = false;
					break;
				}
				else {
					if (!_was_write_error) {
						lwsl_err("Write error: %d.\n", r);
					}
					_was_write_error = true;
				}
				stop_sending = true;
				break;
			}
			if (lws_partial_buffered(_wsi)) {
				stop_sending = true;
				break;
			}
			if (lws_send_pipe_choked(_wsi)) {
				stop_sending = true;
				break;
			}
		} while (!stop_sending && msg.bytesWritten!=msg_size);

		if (msg.bytesWritten == msg_size) {
			_write_queue.pop_front();
		}
	}

	if (!_write_queue.empty()) {
		lws_callback_on_writable(_wsi);
	}
	return _was_write_error ? -1 : 0;
}

// --------------------------------------------------------------------------------------------------------------------
bool WebsocketBuffer::_checkQueue(unsigned int& queue_count, unsigned int& queue_bytes)
{
	unsigned int	qc = 0;
	unsigned int	qb = 0;

	if (_was_write_error) {
		return false;
	}

	for (const auto& wr : _write_queue) {
		++qc;
		qb += wr.buffer.size();
	}
	queue_count = qc;
	queue_bytes = qb;

	if (queue_count>QUEUE_LENGTH_LIMIT || queue_bytes>QUEUE_BYTES_LIMIT) {
		_was_write_error = true;
		lwsl_notice("WebsocketBuffer: Write queue limit exceeded (%u bytes in %u items).\n", qb, qc);
		_write_queue.clear();
		return false;
	}

	return true;
}
