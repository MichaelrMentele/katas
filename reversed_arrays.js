///////////////////////
// Problem Statement //
///////////////////////

// Reversed Arrays (Part 1)

// Write a method that takes an Array as an argument, and 
// reverses its elements in place; that is, mutate the Array
// passed in to this method. The return value should be the 
// same Array object.

// Examples:

// list = [1,2,3,4]
// result = reverse!(list) # => [4,3,2,1]
// list == [4, 3, 2, 1]
// list.object_id == result.object_id

// list = %w(a b c d e)
// reverse!(list) # => ["e", "d", "c", "b", "a"]
// list == ["e", "d", "c", "b", "a"]

// list = ['abc']
// reverse!(list) # => ["abc"]
// list == ["abc"]

// list = []
// reverse!([]) # => []
// list == []

////////////////
// Psuedocode //
////////////////

// [1, 2, 3, 4]
// store ele1 in a temp var and ele 2 in a temp var
// write first to last, and last to first
// Will need an incrementing index and a decrementing index
	// The rightIndex = array.length - 1 - leftIndex
// When the indexes are adjacent we are done
	// When the indexes match, we are done (odd # of elements)
	// When the right index is less than the left index we are done (when the indexes have crossed eachother)
	// Or when the indexes have a difference of 1, that means they are adjacent

//////////
// Code //
//////////

function reverseInPlace(array) {
	var leftTemp;
	var rightTemp;
	array.forEach(function(ele, leftIndex) {
		rightIndex = array.length - 1 - leftIndex;
		leftTemp = array[leftIndex];
		rightTemp = array[rightIndex];

		// Put left where right was, and right where left was
		array[leftIndex] = rightTemp;
		array[rightIndex] = leftTemp;
	});

	return array;
}
