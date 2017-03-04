///////////////////////
// Problem Statement //
///////////////////////

// Reversed Arrays (Part 2)

// Write a method that takes an Array, and returns a new Array 
// with the elements of the original list in reverse order. 
// Do not modify the original list.

// Examples:

// reverse([1,2,3,4]) == [4,3,2,1]          # => true
// reverse(%w(a b c d e)) == %w(e d c b a)  # => true
// reverse(['abc']) == ['abc']              # => true
// reverse([]) == []                        # => true

// list = [1, 2, 3]                      # => [1, 2, 3]
// new_list = reverse(list)              # => [3, 2, 1]
// list.object_id != new_list.object_id  # => true
// list == [1, 2, 3]                     # => true
// new_list == [3, 2, 1]                 # => true

////////////////
// Psuedocode //
////////////////

// same as before, save to new array
// reverse(array)
	// reverse iterate through array from the end
	// get each value and push it to a new array
	// for (var index = arr.length -1; index > -1; index--) {
		//
	//}

//////////
// Code //
//////////

function reverse(array) {
	var newArray = [];

	for (var index = array.length - 1; index > -1; index--) {
		newArray.push(array[index]);
	}

	return newArray
}

a = [1, 2, 3, 4]
b = reverse(a);
a != b;