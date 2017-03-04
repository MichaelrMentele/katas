///////////////////////
// Problem Statement //
///////////////////////

// Halvsies

// Write a method that takes an Array as an argument, 
// and returns two Arrays that contain the first half 
// and second half of the original Array, respectively. 
// If the original array contains an odd number of elements, 
// the middle element should be placed in the first half Array.

// Examples:

// halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
// halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
// halvsies([5]) == [[5], []]
// halvsies([]) == [[], []]

////////////////
// Psuedocode //
////////////////

// split the array in half
// take the length / 2 that is the middle index
// round up to keep any odd numbers of elements
// [1, 2, 3, 4, 5] -> 5 / 2 = 2.5 -> 3 -> 3 - 1 = 2
// [1, 2, 3, 4] -> 4 / 2 = 2 -> 2 -> 2 - 1 = 1
// round down the result of length / 2 because we are basically always subtracting one from length
// we can subtract one before or after from length just changes which side we round
// and in which direction
// [1, 2, 3, 4, 5] -> 4 / 2 = 2 -> 2
// [1, 2, 3, 4] -> 3 / 2 = 1.5 -> 1

//////////
// Code //
//////////

function halvsies(array) {
	var sliceIndex = Math.floor((array.length - 1) / 2);
	var first = array.slice(0, sliceIndex + 1);
	var second = array.slice(sliceIndex + 1, array.length);

	return [first, second]
}

a = halvsies;
b = a([1,2,3,4])
c = a([1,2,3])