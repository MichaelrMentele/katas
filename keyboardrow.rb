# Given a List of words, return the words that can be typed using letters of alphabet on
# only one row's of American keyboard like the image below.
#
# example 1:
# Input: ["Hello", "Alaska", "Dad", "Peace"]
# Output: ["Alaska", "Dad"]
# Note:
# You may use one character in the keyboard more than once.
# You may assume the input string will only contain letters of alphabet.

# @param {String[]} words
# @return {String[]}
def find_words(words)
    # check which row the first character of a word is in
    # then check if the rest are in that row

    one_row_words = []
    words.each_with_index do |word, i|
        word = word.upcase
        homerow = homerow(word)

        all_chars_in_homerow = true
        word.upcase.chars do |char|
           all_chars_in_homerow = false unless homerow.include?(char)
        end

        one_row_words << words[i] if all_chars_in_homerow
    end
    one_row_words
end

def homerow(word)
    row_a = "QWERTYUIOP"
    row_b = "ASDFGHJKL"
    row_c = "ZXCVBNM"

    first = word[0]
    if row_a.include?(first)
        row = row_a
    elsif row_b.include?(first)
        row = row_b
    elsif row_c.include?(first)
        row = row_c
    else
        Raise "Letter not valid?"
    end
    return row
end
