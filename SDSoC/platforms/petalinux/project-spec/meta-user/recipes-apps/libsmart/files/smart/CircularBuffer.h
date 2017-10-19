/// \file  CircularBuffer.h
/// \brief	Interface and implementation of the class CircularBuffer.
///
/// \version 	1.0
/// \date		2017
/// \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH

#pragma once

#include <algorithm>	// std::max
#include <atomic>		// std::atomic
#include <vector>		// std::vector


namespace smart {

/// Lock-free circular buffer.
template <class E>
class CircularBuffer {
private:
	enum class OPERATION {
		PEEK,
		POP
	};
public:
	/// Initialize buffer to empty state.
	CircularBuffer(const unsigned int size)
	: buffer_(size)
	{
		push_index_ = 0u;
		pop_index_ = 0u;
	}

	/// Push element \c e into buffer.
	/// \return true on success, false on failure.
	bool push(	const E&	e)
	{
		const auto	push_index = push_index_.load(std::memory_order_relaxed);
		const auto	next_push_index = (push_index + 1) % buffer_.size();
		if (next_push_index == pop_index_.load(std::memory_order_acquire)) {
			return false;
		} else {
			buffer_[push_index] = e;
			push_index_.store(next_push_index, std::memory_order_release);
			return true;
		}
	}

	/// Push a range of items.
	/// Return true on success, false on failure.
	bool push(const E* first, const E* last)
	{
		unsigned int		todo = last - first;
		const unsigned int	n_avail = available();

		if (n_avail >= todo) {
			auto				push_index = push_index_.load(std::memory_order_relaxed);
			const E*			src = first;

			while (todo > 0u) {
				const unsigned int	this_round = std::min<unsigned int>(buffer_.size() - push_index, todo);
				std::copy_n(src, this_round, &buffer_[push_index]);

				todo -= this_round;
				src += this_round;
				push_index = (push_index + this_round) % buffer_.size();
			}

			push_index_.store(push_index, std::memory_order_release);
			return true;
		} else {
			return false;
		}
	}

	/// Pop an element, note that it doesn't check for failure!
	/// \return Popped element.
	E pop()
	{
		const auto	pop_index = pop_index_.load(std::memory_order_relaxed);
		const E		r = buffer_[pop_index];
		pop_index_.store((pop_index + 1) % buffer_.size(), std::memory_order_release);
		return r;
	}

	/// Pop as many elements as possible.
	/// Point
	/// \return Number of elements popped.
	unsigned int pop_n(E* buffer, const unsigned int n_max)
	{
		return peek_pop(buffer, n_max, OPERATION::POP);
	}

	/// Pop the given number of elements without storing them anywhere.
	void pop_n(const unsigned int n)
	{
		const unsigned int	pop_index = pop_index_.load(std::memory_order_acquire);
		const unsigned int	new_pop_index = (pop_index + n) % buffer_.size();
		pop_index_.store(new_pop_index, std::memory_order_release);
	}

	/// Peek for an element, note that it doesn't check for a failure!
	/// The element will remain in the buffer.
	/// \return Element from the head.
	E peek()
	{
		const auto	pop_index = pop_index_.load(std::memory_order_relaxed);
		const E		r = buffer_[pop_index];
		return r;
	}

	/// Peek the given number of elements.
	/// Returns the actual number of elements copied.
	unsigned int peek(E* buffer, const unsigned int n_max)
	{
		return peek_pop(buffer, n_max, OPERATION::PEEK);
	}

	/// Get the pop index to be used for subsequent peek_at calls.
	unsigned int get_pop_index() const
	{
		return pop_index_.load(std::memory_order_relaxed);
	}

	/// Advance the pop index by n.
	unsigned int inc_pop_index(const unsigned int pop_index, const unsigned int n)
	{
		return (pop_index + n) % buffer_.size();
	}

	/// Peek the items at the given offset.
	/// \return Next pop index to be used.
	void peek_at(E* dst, unsigned int pop_index, const unsigned int n)
	{
		unsigned int		todo = n;

		while (todo > 0u) {
			const unsigned int	this_round = std::min<unsigned int>(buffer_.size() - pop_index, todo);

			std::copy_n(&buffer_[pop_index], this_round, dst);

			todo -= this_round;
			dst += this_round;
			pop_index = (pop_index + this_round) % buffer_.size();
		}
	}

	/// Pop an element, check for failure.
	/// \return true if popped, false if the buffer was empty.
	bool pop(	E&	e)
	{
		const auto	pop_index = pop_index_.load(std::memory_order_relaxed);
		if (pop_index == push_index_.load(std::memory_order_acquire)) {
			return false;
		} else {
			e = buffer_[pop_index];
			pop_index_.store((pop_index_ + 1) % buffer_.size(), std::memory_order_release);
			return true;
		}
	}

	/// Clear the buffer, by setting pop index equal to the push index.
	void clear()
	{
		const auto	push_index = push_index_.load(std::memory_order_relaxed);
		pop_index_.store(push_index, std::memory_order_release);
	}

	/// Is buffer empty? */
	bool empty() const
	{
		const auto	pop_index = pop_index_.load(std::memory_order_relaxed);
		const auto	push_index = push_index_.load(std::memory_order_acquire);
		return push_index == pop_index;
	}
	/// Is buffer full? */
	bool full() const
	{
		const auto	push_index = push_index_.load(std::memory_order_relaxed);
		const auto	pop_index =  pop_index_.load(std::memory_order_acquire);
		return ((push_index + 1) % buffer_.size()) == pop_index;
	}

	/// Number of elements currently stored in the buffer.
	unsigned int size() const
	{
		const auto	push_index = push_index_.load(std::memory_order_relaxed);
		const auto	pop_index = pop_index_.load(std::memory_order_acquire);

		return (push_index + buffer_.size() - pop_index) % buffer_.size();
	}

	/// Number of locations available.
	unsigned int available() const
	{
		const auto	push_index = push_index_.load(std::memory_order_relaxed);
		const auto	pop_index = pop_index_.load(std::memory_order_acquire);

		return (buffer_.size() - 1u + pop_index - push_index) % buffer_.size();
	}

	/// Total capacity of the buffer.
	unsigned int capacity() const
	{
		return buffer_.size() - 1u;
	}
private:
	/// Peek or pop as many elements as possible.
	/// Returns the actual number of elements copied.
	unsigned int peek_pop(E* buffer, const unsigned int n_max, const OPERATION operation)
	{
		const auto			push_index = push_index_.load(std::memory_order_relaxed);
		unsigned int		pop_index = pop_index_.load(std::memory_order_acquire);
		const unsigned int	current_size = (push_index + buffer_.size() - pop_index) % buffer_.size();
		const unsigned int	r = std::min<unsigned int>(n_max, current_size);
		unsigned int		todo = r;
		E*					dst = buffer;

		while (todo > 0u) {
			const unsigned int	this_round = std::min<unsigned int>(buffer_.size() - pop_index, todo);

			if (buffer != nullptr) {
				std::copy_n(&buffer_[pop_index], this_round, dst);
			}

			todo -= this_round;
			dst += this_round;
			pop_index = (pop_index + this_round) % buffer_.size();
		}
		if (operation == OPERATION::POP) {
			pop_index_.store(pop_index, std::memory_order_release);
		}
		return r;
	}

	/// Circular buffer.
	std::vector<E>			buffer_;

	/// Push index (heading).
	/// Index of the next item to be written.
	std::atomic_uint	push_index_;

	/// Pop index (trailing).
	/// Index of the next item to be read.
	std::atomic_uint	pop_index_;

}; // class CircularBuffer

} // namespace
