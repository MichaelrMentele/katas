///////////////////////
// Problem Statement //
///////////////////////

// Letter Counter (Part 2)

// Modify the word_sizes method from the previous exercise 
// to exclude non-letters when determining word size. For 
// instance, the length of "it's" is 3, not 4.

// Examples

// word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
// word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
// word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
// word_sizes('') == {}

////////////////
// Psuedocode //
////////////////

// Only difference is replacing all non-letters (except spaces) with ""

//////////
// Code //
//////////

function word_sizes(text) {
	text = removeNonAlpha(text);
	var words = text.split(" ");
	if (words[0].length === 0) { return {}}; // If text is empty, ruturn empty hash

	var wordLengths = words.map(function(word) { return word.length	});
	var keys = new Set(wordLengths);

	var wordSizes = {};
	keys.forEach(function(key) {
		var count = 0;
		wordLengths.forEach(function(length) {
			if ( key === length ) { count += 1 };
		});
		wordSizes[key] = count;
	});
	return wordSizes;
}

function removeNonAlpha(text) {
	return text.replace(/([^a-z\s])/ig, "");
}


word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
word_sizes('') == {}