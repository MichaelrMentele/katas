///////////////////////
// Problem Statement //
///////////////////////

// Fibonacci Numbers (Procedural)

// In the previous exercise, we developed a recursive solution 
// to calculating the nth Fibonacci number. In a language that 
// is not optimized for recursion, some (not all) recursive 
// methods can be extremely slow and require massive quantities 
// of memory and/or stack space.

// Ruby does a reasonably good job of handling recursion, but it 
// isn't designed for heavy recursion; as a result, the Fibonacci 
// solution is only useful up to about fibonacci(40). With higher 
// values of nth, the recursive solution is impractical. (Our tail 
// 	recursive solution did much better, but even that failed at 
// 	around fibonacci(8200).)

// Fortunately, every recursive method can be rewritten as a 
// non-recursive (procedural) method.

// Rewrite your recursive fibonacci method so that it computes its 
// results without recursion.

// Examples:

// fibonacci(20) == 6765
// fibonacci(100) == 354224848179261915075
// fibonacci(100_001) # => 4202692702.....8285979669707537501

////////////////
// Psuedocode //
////////////////

// calculate the fibonacci numbers up to the nth number
// 1, 1, 1+1, 2+1, 3+2..., n-1 + n-2
// series is indexed 0

//////////
// Code //
//////////

function fibonacci(n) {
	var series = [0, 1, 1];
	for (var nth = 3; nth < n; nth++) {
		series.push(series[nth - 1] + series[nth - 2])
	}

	return series[n - 1] + series[n - 2];
}


a = fibonacci