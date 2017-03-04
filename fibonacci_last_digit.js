///////////////////////
// Problem Statement //
///////////////////////

// Fibonacci Numbers (Last Digit)

// In the previous exercise, we developed a procedural method 
// for computing the value of the nth Fibonacci numbers. This 
// 	method was really fast, computing the 20899 digit 100,001st 
// Fibonacci sequence almost instantly.

// In this exercise, you are going to compute a method that returns 
// the last digit of the nth Fibonacci number.

// Examples:

// fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
// fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
// fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
// fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
// fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
// fibonacci_last(123456789) # -> 4

////////////////
// Psuedocode //
////////////////

// compute fib num
// get last val

//////////
// Code //
//////////

function fibonacci_last(n) {
	var num = String(fibonacci(n));
	return num[num.length - 1];
}

function fibonacci(n) {
	var series = [0, 1, 1];
	for (var nth = 3; nth < n; nth++) {
		series.push(series[nth - 1] + series[nth - 2])
	}

	return series[n - 1] + series[n - 2];
}


a = fibonacci
