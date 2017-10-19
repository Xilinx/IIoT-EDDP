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
