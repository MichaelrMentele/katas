///////////////////////
// Problem Statement //
///////////////////////

// Word to Digit

// Write a method that takes a sentence string as input, and 
// returns a new string that contains the original string with 
// any sequence of the words 
// 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'
// converted to a string of digits.

// Example:

// word_to_digit('Please call me at five five five one two three four. 
// Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

////////////////
// Psuedocode //
////////////////

// this is just search and replace

//////////
// Code //
//////////


function wordToDigit(string) {
	var CODEX = {
		zero: 0,
		one: 1,
		two: 2,
		three: 3,
		four: 4,
		five: 5,
		six: 6,
		seven: 7,
		eight: 8,
		nine: 9,
	};

	for (word in CODEX) {
		string = string.replace(new RegExp(word, "g"), CODEX[word]);
		console.log(word);
	}

	return string;
}
 
a = wordToDigit