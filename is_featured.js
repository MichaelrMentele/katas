///////////////////////
// Problem Statement //
///////////////////////

Next Featured Number Higher than a Given Value

A featured number (something unique to this exercise) 
is an odd number that is a multiple of 7, and whose  
digits occur exactly once each. So, for example, 49 
is a featured number, but 98 is not (it is not odd), 
97 is not (it is not a multiple of 7), and 133 is not 
(the digit 3 appears twice).

Write a method that takes a single integer as an argument, 
and returns the next featured number that is greater than 
the argument. Issue an error message if there is no next 
featured number.

Examples:

featured(12) == 21
featured(20) == 21
featured(21) == 35
featured(997) == 1029
featured(1029) == 1043
featured(999_999) == 1_023_547
featured(999_999_987) == 1_023_456_987

featured(9_999_999_999) # -> There is no possible number that 
fulfills those requirements

////////////////
// Psuedocode //
////////////////

// find next featured number
	// increment from num and check
	// is there a next FN? 
		// cannot be unique digits if more than 10 digits
	// is featured number?
		// FN % 2 !== 0
		// FN / 7 == Integer
		// FN digits are unique

//////////
// Code //
//////////

function featuredNumber(num) {
	while (true) {
		num += 1;
		if (String(num).length > 10) { return "Error: No Next Featured Number";}
		if (isFeatured(num)) { return true; }
	}
}

function isFeatured(num) {
	if (num % 2 !== 0 
			&& Number.isInteger(num / 7) 
			&& String(num).length === (new Set(String(num))).size) 
	{ return true; }
	return false;
}