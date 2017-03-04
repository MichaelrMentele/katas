///////////////////////
// Problem Statement //
///////////////////////

// Right Triangles

// Write a method that takes a positive integer, n, as an 
// argument, and displays a right triangle whose sides 
// each have n stars. The hypotenuse of the triangle 
// (the diagonal side in the images below) should have one 
// end at the lower-left of the triangle, and the other 
// end at the upper-right.

// Examples:

// triangle(5)

//     *
//    **
//   ***
//  ****
// *****
// triangle(9)

//         *
//        **
//       ***
//      ****
//     *****
//    ******
//   *******
//  ********
// *********

////////////////
// Psuedocode //
////////////////

// n - 1 spaces 
// n - 2 spaces
// n - n spaces

// for loop, count 1 to n
  // print n - count spaces and count stars
    // How do I print n - count spaces?
    // How would I print 100 spaces?
    // could have loop that just adds a space until is reaches
    // some length, nested loops?
    //
    // spaces = n - count
    // stars = count
    // line = ''
    // for (var i = 0; i < spaces; i++) { line += ' '; }
    // for (var i = 0; i < count; i++ ) { line += '*'; }

// n = 3
// count = 1
// spaces = 2
// stars = 1
// i = 0, line = ' ', i = 1, line = '  '
// i = 0, line = '  *'

//////////
// Code //
//////////

function rightTriangle(n) {
  for (var count = 1; count <= n; count++) {
    var spaces = n - count;
    var stars = count;
    var line = '';    
    for (var i = 0; i < spaces; i++) { line += ' '};
    for (var i = 0; i < count; i++) { line += '*'};
    console.log(line);
  }
}
