///////////////////////
// Problem Statement //
///////////////////////

// Rotation (Part 1)

// Write a method that rotates an array by moving the first element 
// to the end of the array. The original array should not be modified.

// Example:

// rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
// rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
// rotate_array(['a']) == ['a']

// x = [1, 2, 3, 4]
// rotate_array(x) == [2, 3, 4, 1]   # => true
// x == [1, 2, 3, 4]                 # => true

////////////////
// Psuedocode //
////////////////

// slice from the beg
// push to the array

//////////
// Code //
//////////

function rotate_array(array) {
	var rotatedArray = array.slice(1, array.length);
	return rotatedArray.push(array[0]);
}

