///////////////////////
// Problem Statement //
///////////////////////

Unlucky Days

Write a method that returns the number of Friday the 13ths 
in the year passed in as an argument. You may assume that 
the year is greater than 1752 (when the modern Gregorian 
Calendar was adopted by the United Kingdom), and you may 
assume that the same calendar will remain in use for the 
foreseeable future.

Examples:

friday_13th?(2015) == 3
friday_13th?(1986) == 1

////////////////
// Psuedocode //
////////////////

// Check the 13th of every month and see if it is a Friday
// Create Date object for every month, check day:
	// new Date(year, month, 13)
	// if day === Friday then count + 1

//////////
// Code //
//////////

function friday_13th(year) {
	var fridays = 0;
	for (var month = 0; month < 12; month++) {
		var test = new Date(year, month, 13);
		if (test.getDay() === 5) { fridays += 1; }
	}
}

friday_13th(2015);