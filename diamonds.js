///////////////////////
// Problem Statement //
///////////////////////

// Diamonds!

// Write a method that displays a 4-pointed diamond in an 
// n x n grid, where n is an odd integer that is supplied 
// as an argument to the method. You may assume that the 
// argument will always be an odd integer.

// Examples

// diamond(1)

// *
// diamond(3)

//  *
// ***
//  *
// diamond(9)

//     *
//    ***
//   *****
//  *******
// *********
//  *******
//   *****
//    ***
//     *

////////////////
// Psuedocode //
////////////////

// S1
//     *			[(n - count) / 2 * ' '] + '*' * count + ...same as left...
//    ***			[(n - 2) / 2 * ' '] + '*' * 2 + ...
//   *****
//  *******
// *********
//  *******
//   *****
//    ***
//     *

// For an nxn grid, for each row
// print: (n - count) / 2 * ' ' + '*' * count + ... same as left ...
// until: n - count === 0
// then do: bottom half in reverse

// S2
// for each row: 
// stars = rowIndex * 2 + 1
// spaces = n - stars

// UNLESS n = stars
// THEN Reverse count index (decrement)
// stars = rowIndex * 2 + 1
// spaces =  n - stars

// for 3x3 diamond:
// '*' pad string evenly to length n
// '***' string length is n, switch to decrementing
// '*' pad string evenly to length n

// incrementing loop
	// calulate # of stars
	// pad stars on line till line length is equal to n
// SWITCH when stars = n
// decrementing loop
	// same as incrementing
// when count is 0, we are done

// S3 -> IMPLEMENTED
// Build a triangle and cache all rows until middle,
// when middle is reached THEN print all rows in reverse order.
// wind up, wind down


//////////
// Code //
//////////

function diamond(n) {
	
	// print tip
	for (var rowIndex = 0; rowIndex < n / 2 - 1; rowIndex++) {
		var line = makeLine(rowIndex, n);
		console.log(line);
	}

	// print bottom
	for (var rowIndex = (n - 1)/ 2; rowIndex >= 0; rowIndex--) {
		var line = makeLine(rowIndex, n);
		console.log(line);
	}
}

function makeLine(rowIndex, n) {
	var stars = makeStars(rowIndex * 2 + 1 );
	return padToLength(stars, n);

}

function makeStars(n) {
	stars = '';
	for (var count = 1; count <= n; count++) {
		stars += '*';
	}

	return stars;
}

function padToLength(string, n) {
	while(string.length < n) {
		string = ' ' + string + ' ';
	}

	return string;
}

a = diamond;
b = makeStars;
c = padToLength;