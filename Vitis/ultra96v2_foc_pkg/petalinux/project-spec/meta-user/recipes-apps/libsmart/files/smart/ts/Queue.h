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
/// \file  Queue.h
/// \brief	Interface and implementation of the class Queue.
///
/// \author 	Peeter Vois
/// \version 	1.0
/// \date		2016
/// \copyright	SPDX: BSD-3-Clause 2016-2017 Trenz Electronic GmbH

#pragma once

#include <cstddef>
#include <deque>
#include <mutex>


namespace smart {
/**
 * This namespace contains thread-safe template classes
 */
namespace ts {

/**
 * FIFO style thread safe queue of elements.
 *
 * Makes copy of elements into and out of container.
 */
template<class T>
class Queue
{
public:
	/**
	 * Push an element into FiFo
	 *
	 * Makes a copy of the element
	 */
	void push( const T &element ){
		std::lock_guard<std::recursive_mutex> guard(_mutex);
		_list_of_elements.push_back( element );
	}

	/**
	 * Pop the element from FiFo
	 *
	 * fills the elemente
	 * returns true if the element is modified
	 * returns false if no elements in queue
	 */
	bool pop( T &element ){
		std::lock_guard<std::recursive_mutex> guard(_mutex);
		if( _list_of_elements.empty() )
			return false;
		element = _list_of_elements.front();
		_list_of_elements.pop_front();
		return true;
	}

	/**
	 * Peek the element in FiFo
	 *
	 * fills the element
	 * returns true if the element is modified
	 * returns false if no elements in queue
	 */
	bool peek( T & element ){
		std::lock_guard<std::recursive_mutex> guard(_mutex);
		if( _list_of_elements.empty() )
					return false;
		element = _list_of_elements.front();
		return true;
	}

	/**
	 * Get the number of elements in fifo
	 */
	std::size_t size(){
		std::lock_guard<std::recursive_mutex> guard(_mutex);
		return _list_of_elements.size();
	}

private:
	/// the holder array of elements
	std::deque<T> _list_of_elements;
	/// the mutex to keep back other threads
	std::recursive_mutex _mutex;
};

} // namespace ts

} // namespace smart
