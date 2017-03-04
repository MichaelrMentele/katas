///////////////////////
// Problem Statement //
///////////////////////

Sum Square - Square Sum

Write a method that computes the difference between 
the square of the sum of the first n positive integers 
and the sum of the squares of the first n positive integers.

Examples:

sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
sum_square_difference(10) == 2640
sum_square_difference(1) == 0
sum_square_difference(100) == 25164150


////////////////
// Psuedocode //
////////////////

// function
// Integer -> Integer
	
// generate the ints up to arg
	// arg === 3; [1, 2, 3]
	// arg === 5; [1, 2, 3, 4, 5]
	// use simple count from zero up till arg
// sumOfInts**2 -> reduce and then square 
	// forEach with a variable but a reduce is nice
	// sum = [].reduce(function(prev, cur){ return operation }, 0)
	// sum * sum
// Sum(squareOfInts) -> map and then reduce
	// [] = [].map(function(ele) { return ele * ele})
	// val2 = [].reduce ...
// return val1 - val2

// slight efficiency gain would be to calculate squares 
// and sums of arrays as we generate the array of ints 
// not as clean, but more efficient

//////////
// Code //
//////////

function sumSquareDiff(n) {
	// gen ints up to n
	var ints = [];
	for (var int = 1; int <= n; int++) { ints.push(int); }

	// sum squared
	sumSqrd = ints.reduce(function(sum, int) { return sum + int; }, 0);
	sumSqrd *= sumSqrd;

	// square then sum
	sqrsSum = ints.map(function(int) { return int * int; });
	sqrsSum = sqrsSum.reduce(function(sum, int) { return sum + int; }, 0);

	// diff
	return sumSqrd - sqrsSum;
}
