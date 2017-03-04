///////////////////////
// Problem Statement //
///////////////////////

Merge Sorted Lists

Write a method that takes two sorted Arrays as arguments, 
and returns a new Array that contains all elements from 
both arguments in sorted order.

You may not provide any solution that requires you to sort 
the result array. You must build the result array one element 
at a time in the proper order.

Your solution should not mutate the input arrays. [We don't want to delete]

Examples:

merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
merge([], [1, 4, 5]) == [1, 4, 5]
merge([1, 4, 5], []) == [1, 4, 5]

////////////////
// Psuedocode //
////////////////

// Find the min in both arrays
	// Since the arrays are sorted we know the leftmost value is the smallest
	// [1, 5, 9] [2, 6, 8]
	//  ^         ^
	// Compare them, 
		// if (arr1[i1] < arr2[i2]) {}
// Push min to result
	// result.push(small)
// Increase index of array pulled from
	// i1 += 1
	// [1, 5, 9] [2, 6, 8]
	//     ^      ^

//////////
// Code //
//////////
