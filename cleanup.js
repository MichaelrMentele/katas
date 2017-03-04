///////////////////////
// Problem Statement //
///////////////////////

// Clean up the words
// Given a string that consists of some words and an assortment of non-alphabetic characters, write a method that returns that string with all of the non-alphabetic characters replaced by spaces. If one or more non-alphabetic characters occur in a row, you should only have one space in the result (the result should never have consecutive spaces).

// Examples:
// cleanup("---what's my +*& line?") == ' what s my line '

////////////////
// Psuedocode //
////////////////

// Replace all non-alpha with spaces
	// String replace any sequence of non-alpha with length 1+ with a space
		// "---" -> " "
		// "'" -> " "
		// " " -> " "
		// match pattern with regex
		// replace matches with " "

// Replace all sequences of spaces 1+ with 1 space
	// "   " -> " "
	// "  " -> " "
	// " " -> " "
	// match pattern with regex
	// replace matches with " "

//////////
// Code //
//////////

function cleanUp(string) {
	var alphaString = toAlpha(string);
	return spaceCorrect(alphaString);
}

function toAlpha(string) {
	return string.replace(/[^a-z]+/gi, " ");
}

function spaceCorrect(string) {
	return string.replace(/\s+/g, " ");
}

cleanUp("---what's my +*& line?") == ' what s my line '
cleanUp("&#^(*@ Well, hell here there D><@@@@@") == ' Well hell here there D '