///////////////////////
// Problem Statement //
///////////////////////

// Rotation (Part 3)

// If you take a number like 735291, and rotate it to the left, 
// you get 352917. If you now keep the first digit fixed in place, 
// and rotate the remaining digits, you get 329175. Keep the 
// first 2 digits fixed in place and rotate again to 321759. 
// Keep the first 3 digits fixed in place and rotate again to get 
// 321597. Finally, keep the first 4 digits fixed in place and 
// rotate the final 2 digits to get 321579. The resulting number 
// is called the maximum rotation of the original number.

// Write a method that takes an integer as argument, and returns 
// the maximum rotation of that argument. You can (and probably should) 
// use the rotate_rightmost_digits method from the previous exercise.

// Example:

// max_rotation(735291) == 321579
	// 352917
	// 329175
	// 321759
	// 321597
	// 321579
// max_rotation(3) == 3
// max_rotation(35) == 53
// max_rotation(105) == 15 # the leading zero gets dropped
// max_rotation(8_703_529_146) == 7_321_609_845

////////////////
// Psuedocode //
////////////////
// iterate through loop, every loop exclude rotated number
// 1234
// 2341
// 2413
// 2431
// Everytime the numDigits shrinks by one
// call rotaterightmostdigits with 1234, 4

//////////
// Code //
//////////

function maxRotations(digits) {
	for (var numDigits = String(digits).length; i > 0; i--) {
		digits = rotateRightmostDigits(digits, numDigits)
	}

	return digits;
}

function rotateRightmostDigits(digits, numDigits) {
	digits = String(digits).split('')
	var staticSubArray = digits.slice(0, digits.length - numDigits);
	var rotatingSubArray = digits.slice(staticSubArray.length, staticSubArray.length + numDigits + 1);
  
	rotatingSubArray = rotateArray(rotatingSubArray);
    
	return Number(staticSubArray.concat(rotatingSubArray).join(''));
}

function rotateArray(array) {
	var rotatedArray = array.slice(1, array.length);
	rotatedArray.push(array[0]);
	return rotatedArray;
}

a = maxRotations
b = rotateRightmostDigits