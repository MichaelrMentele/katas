///////////////////////
// Problem Statement //
///////////////////////

Seeing Stars

Write a method that displays an 8-pointed star in an 
nxn grid, where n is an odd integer that is supplied 
as an argument to the method. The smallest such star 
you need to handle is a 7x7 grid.

Examples

star(7)

*  *  *
 * * *
  ***
*******
  ***
 * * *
*  *  *
star(9)

*   *   *
 *  *  *
  * * *
   ***
*********
   ***
  * * *
 *  *  *
*   *   *

////////////////
// Psuedocode //
////////////////

// S1: Algorithm line by line
// Can look at this like two crowns separated by a line in the middle
// On any axis, top to bottom probably the easiest. Can use distance from center.
// Advantage, simple. 3 part solution.

// S2: Algorithm, 8 rotated lines, 0, 45, 90, 135, 180, ... 360
// Can look at this as 8 lines around a center point
// Advantage: more concise, a little more difficult to think about.
// Don't know how to rotate

// each line is n long
// center row/col is: n/2 rounded up
// @ 0:  (4,4) (4,5) (4,6) (4,7) (4,8) row = row, col += 1
// @ 45: (4,4) (3,5) (2,6) (1,7) (0,8) row -= 1, col += 1
// @ 90: (4,4) (3,4) (2,4) (1,4) (0,4) row -= 1, col = col
// @ 135:(4,4) ()											 row -= 1, col -= col
//																		 row = row, col -= col

// S3: Algorithm 4 lines rotated. Draw four line on same grid.
// Start from edge, draw to other edge.
// We can represent the grid as a 2d array.
// [[*, *, *]
//	[*, *, *]
//	[*, *, *]]
// This seems most concise

// Initialize Grid
	// create n arrays of length n with default ' '
// Draw Stars
	// Y-Axis Line: 	col = col, row += 1 -> [0][mid], [1][mid]
	// X-Axis Line: 	col -= 1, row = row -> [mid][0], [mid][1]
	// L-R Diagonal: 	col += 1, row += 1  -> [0][0], [1][1]
	// R-L Diagonal: 	col += 1, row -= 1  -> [n][0], [n-1][1]

	// at each coordinate insert a star
// console.log each row array joined

//////////
// Code //
//////////
