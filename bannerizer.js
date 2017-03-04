///////////////////////
// Problem Statement //
///////////////////////

// Bannerizer

// Write a method that will take a short line of text, and print it within a box.

// Example:

// print_in_box('To boldly go where no one has gone before.')
// +--------------------------------------------+
// |                                            |
// | To boldly go where no one has gone before. |
// |                                            |
// +--------------------------------------------+
// print_in_box('')
// +--+
// |  |
// |  |
// |  |
// +--+
// You may assume that the input will always fit in your terminal window.

////////////////
// Psuedocode //
////////////////

// We can assume always 5 lines
// line 1: + and n*- where n is the length of the string plus 2 and + -> '+' + n*- + '+'
// line 2: | and n*' ' and | -> '|' + n*' ' '|'
// line 3: | + ' ' + string + ' ' + |
// etc...

//////////
// Code //
//////////

function print_in_box(string) {
	var innerColumns = string.length + 2;
	line1 = "+" + innerColumns + '+';
	line2 = "|" + innerColumns * ' ' + '|';
	line3 = "| " + string + " |";
	line4 = "|" + innerColumns * ' ' + '|';
	line5 = "+" + innerColumns * '-' + '+';

	[line1, line2, line3, line4, line5].forEach(console.log(line));
}

print_in_box('To boldly go where no one has gone before.')
print_in_box('')