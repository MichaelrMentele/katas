///////////////////////
// Problem Statement //
///////////////////////

Triangle Sides

A triangle is classified as follows:

equilateral All 3 sides are of equal length
isosceles 2 sides are of equal length, while the 3rd is different
scalene All 3 sides are of different length
To be a valid triangle, the sum of the lengths of the two shortest 
sides must be:
- greater than the length of the longest side
- all sides must have lengths greater than 0: 
if either of these conditions is not satisfied, the triangle is invalid.

Write a method that takes the lengths of the 3 sides of a triangle 
as arguments, and returns a symbol :equilateral, :isosceles, :scalene, or 
:invalid depending on whether the triangle is equilateral, isosceles, scalene, 
or invalid.

Examples:

triangle(3, 3, 3) == :equilateral
triangle(3, 3, 1.5) == :isosceles
triangle(3, 4, 5) == :scalene
triangle(0, 3, 3) == :invalid
triangle(3, 1, 1) == :invalid

////////////////
// Psuedocode //
////////////////

// Method to classify a triangle
// 3 numbers -> String

// 3, 3, 3 
// All greater than 0
// All equal
// return "Equilateral"

// 3, 3, 2
// All greater than 0
// Two equal, one different
// 3 + 2 > 3
// return "Isoceles"

// 1 2 3 
// none equal
// all greater than 0
// 1 + 2 === 3
// return Invalid

// 2 4 5
// none equal
// all greter than 0
// 2 + 4 > 5 
// return "Scalene"

// else
// Invalid

// if all greater than 0 AND two shortest > longest, classify
	// all equal, return equilateral
	// two equal, isoceles
	// none equal, return scalene
// otherwise invalid

//////////
// Code //
//////////

function classifyTriangle(s1, s2, s3) {

	if (s1 !== 0 && s2 !== 0 && s3 !== 0) {
		if 			(s1 === s2 && s1 === s3) 																		{ return 'Equilateral'; } 
		else if (s1 === s2 || s2 === s3 || s1 === s3) 											{	return 'Isoceles'; }
		else if (s1 - s2 - s3 > 0 || s2 - s1 - s3 > 0 || s3 - s1 - s2 > 0) 	{ return "Scalene" }
	}

	return 'Invalid';
}



