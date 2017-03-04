///////////////////////
// Problem Statement //
///////////////////////

Madlibs Revisited

Make a madlibs program that reads a text 
file that you have created, and then plugs in a selection of 
randomized nouns, verbs, adjectives, and adverbs into that 
text and prints it. You can build your lists of nouns, verbs, 
adjectives, and adverbs directly into your program, but the 
text data should come from a file or other external source. 
Your program should read this text, and for each line, it 
should place random words of the appropriate types into the 
text, and print the result.

The challenge of this program isn't about writing your program; 
it's about choosing how to represent your data. Choose the right 
way to structure your data, and this problem becomes a whole lot 
easier.

Example output:

The sleepy brown cat noisily
licks the sleepy yellow
dog, who lazily licks his
tail and looks around.

////////////////
// Psuedocode //
////////////////

// CONSTANTS
// nouns
// verbs
// adjectives
// adverbs

// Read in text with placeholders: NOUN, VERB, ADJ, ADVERB. 
// Replace placeholders with a random value from the 
// appropriate constant.

// Clarify:
// - What is an adverb?

// Steps:
// Read in text, if string I can use RegExp for replace
// replace placeholders with appropriate random value
// log the result

//////////
// Code //
//////////
