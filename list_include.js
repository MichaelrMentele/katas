///////////////////////
// Problem Statement //
///////////////////////

// Does My List Include This?

// Write a method named include? that takes an Array 
// and a search value as arguments. This method should 
// return true if the search value is in the array, false
// if it is not. You may not use the Array#include? method 
// in your solution.

// include?([1,2,3,4,5], 3) == true
// include?([1,2,3,4,5], 6) == false
// include?([], 3) == false
// include?([nil], nil) == true
// include?([], nil) == false

////////////////
// Psuedocode //
////////////////
// include(array, search)
// iterate through the array and compare each value to the search value
// return true if equal...

//////////
// Code //
//////////

function include(array, term) {
	var result = array.filter(function(element) {
		return term === element;
	});

	return result.length === 1;
}
