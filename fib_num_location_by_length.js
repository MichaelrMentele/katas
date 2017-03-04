///////////////////////
// Problem Statement //
///////////////////////

// Fibonacci Number Location By Length

// The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...) 
// such that the first 2 numbers are 1 by definition, and each subsequent number 
// is the sum of the two previous numbers. This series appears throughout the natural world.

// Computationally, the Fibonacci series is a very simple series, but the results 
// grow at an incredibly rapid rate. For example, the 100th Fibonacci number is 
// 354,224,848,179,261,915,075 -- that's enormous, especially considering that it 
// takes 6 iterations to enter the 2 digit numbers.

// Write a method that calculates and returns the index of the first Fibonacci number 
// that has the number of digits specified as an argument. (The first Fibonacci number has index 1.)

// Examples:

// find_fibonacci_index_by_length(2) == 7
// find_fibonacci_index_by_length(10) == 45
// find_fibonacci_index_by_length(100) == 476
// find_fibonacci_index_by_length(1000) == 4782
// find_fibonacci_index_by_length(10000) == 47847

////////////////
// Psuedocode //
////////////////

// Solution 1: Brute Force
// compute fibonacci series number,
	// start with (1, 1, 2) -> 1, 1, 2, 3, 5, 8, etc.
	// so prev1 = 1, prev2 = 1
	// next = prev1 + prev2
	// In other words for arg == 2
	// arr = [1, 1]
	// while true do
	//   next = arr[-2] + arr[-1]
	// 	 if next.length == arg break and return index as arr.length

// Solution 2: Smarter
// We can see that every power of 10 is a digit longer, this is probably
// no the first index, but we can skip many of the intervening numbers 
// maybe with a binary search
// We know that no indexs are closer than 4 or 5 numbers, how can we use this?

// Solution 2: Cache Values
// same as above but cache all first indexes for numbers of diff lengths
// in object hash
// when we reach 2 digit save as 
// {1: 1, 2: 7, 3: index...}
// next time we run this code we can check this hash first, if not there we can start
// at the last value in the hash

//////////
// Code //
//////////

// Brute Force
function find_fibonacci_index_by_length(digits) {
	var fib = [1, 1];
	var next;

	while (true) {
		next = fib[fib.length - 1] + fib[fib.length -2];
		fib.push(next)
		if (String(next).length === digits) { return fib.length };
	}
}




a = find_fibonacci_index_by_length(2) == 7
b = find_fibonacci_index_by_length(10) == 45
c = find_fibonacci_index_by_length(100) == 476
d = find_fibonacci_index_by_length(1000) == 4782
e = find_fibonacci_index_by_length(10000) == 47847

results = [a, b, c, d, e]
results.forEach(function(result) {console.log(result)})