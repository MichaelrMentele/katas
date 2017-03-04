///////////////////////
// Problem Statement //
///////////////////////

Tri-Angles

A triangle is classified as follows:

right - One angle of the triangle is a right angle (90 degrees)
acute - All 3 angles of the triangle are less than 90 degrees
obtuse - One angle is greater than 90 degrees.
To be a valid triangle, the sum of the angles must be exactly 180 degrees, 
and all angles must be greater than 0: 
if either of these conditions is not satisfied, the triangle is invalid.

Write a method that takes the 3 angles of a triangle as arguments, 
and returns a symbol :right, :acute, :obtuse, or :invalid depending 
on whether the triangle is a right, acute, obtuse, or invalid triangle.

You may assume integer valued angles so you don't have to worry about 
floating point errors. You may also assume that the arguments are specified in degrees.

Examples:

triangle(60, 70, 50) == :acute
triangle(30, 90, 60) == :right
triangle(120, 50, 10) == :obtuse
triangle(0, 90, 90) == :invalid
triangle(50, 50, 50) == :invalid

////////////////
// Psuedocode //
////////////////

// isValid triangle
	// if a1 + a2 + a3 === 180 && a1 > 0 && a2 > 0 && a3 > 0
// classify
	// all angles < 90
	// one > 90
	// on angle is 90 degrees

//////////
// Code //
//////////

function classifyTriangle(a1, a2, a3) {
	if (a1 + a2 + a3 === 180 && a1 > 0 && a2 > 0 && a3 > 0) {
		if (a1 < 90 && a2 < 90 && a3 < 90) { return "Acute"; }
		else if ( a1 > 90 || a2 > 90 || a3 > 90) { return "Obtuse"; }
		else if ( a1 === 90 || a2 === 90 || a3 === 90 ) { return "Right"; }
	}

	return "Invalid"
}
