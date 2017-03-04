///////////////////////
// Problem Statement //
///////////////////////

// Write a method that takes an array of strings, and returns an array of the 
// same string values, except with the vowels (a, e, i, o, u) removed.

// Example in Ruby:

// remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
// remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
// remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

////////////////
// Psuedocode //
////////////////

// remove vowels from multiple strings
// base level proble: remove vowels froma single string
	// String.replace(regex, '')

//////////
// Code //
//////////

function remove_vowels(arrayOfStrings) {
	return arrayOfStrings.map(function(string) {
		return string.replace(/[aeiou]/gi, '');
	});
}

a = remove_vowels(["abcdefghijklmnopqrstuvwxyz"])// == ["bcdfghjklmnpqrstvwxyz"]
b = remove_vowels(['green', 'YELLOW', 'black', 'white'])// == ['grn', 'YLLW', 'blck', 'wht']
c = remove_vowels(['ABC', 'AEIOU', 'XYZ']) //== ['BC', '', 'XYZ']