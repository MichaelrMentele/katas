///////////////////////
// Problem Statement //
///////////////////////

// Letter Counter (Part 1)

// Write a method that takes a string with one or more space separated words 
// and returns a hash that shows the number of words of different sizes.

// Words consist of any string of characters that do not include a space.

// Examples
// word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
// word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
// word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
// word_sizes('') == {}

////////////////
// Psuedocode //
////////////////

// Solution 1:
// word_sizes
	// get words (split)
		// returns array by splitting on spaces
		// ex. "hello there" -> ["hello", "there"]
	// map to lengths
		// for each word return the length
		// ex. "hello".length -> 5
	// get unique lengths (keys)
		// return a set of the lengths array
		// ex. [5, 5] -> {5}
	// count matches for each key, (can use keys of set object)
		// for each key if it is equal to an element add + 1 to count for that key
		// ex. [5, 5] -> {5: 2}
	// Tradeoff: we will be iterating over the array many times, 
	// much more difficult to do all at once more efficient.

// Solution 2:
// word_sizes
	// get words
		// for each word, if its length is not a key already, make it a key with value of 1
		// ex. wordSizes = {}, word.length = 5 -> wordSizes = {5: 1}
		// if it is a key, increment count for that value
		// ex. wordSizes = {5: 1}, word.length = 5 -> wordSizes = {5: 2};

//////////
// Code //
//////////
function word_sizes(text) {
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

var a = word_sizes('Four score and seven.') // == { 3: 1, 4: 1, 5: 1, 6: 1 }
var b = word_sizes('Hey diddle diddle, the cat and the fiddle!') // == { 3: 5, 6: 1, 7: 2 }
var c = word_sizes("What's up doc?") // == { 6: 1, 2: 1, 4: 1 }
var d = word_sizes("") // == {}
array = [a, b, c, d]
array.forEach(function(obj) {console.log(obj)});