#text_analyzer.rb
=begin
1 Loaf the file containing text
2 scan and count each line
3 put the text in a string and get its length for char count
4 temp remove whitespace to count chars excluding white space
5 split on spaces to count how many words there are
6 split on full stops to count sentences
7 split on double \n to count the paragraphs
8 calculate average words per sentence and sentences per paragraph
=end

stopwords = %w{the a by on for of are with just but and to the my i has some in}
lines = File.readlines(ARGV[0])
text = lines.join
line_count = lines.length

#count the characters
total_characters = text.length
total_characters_nospaces = text.gsub(/\s+/, "").length

#count words sentences and paragraphs
word_count = text.split.length
sentence_count = text.split(/\.|\?|!/).length
paragraph_count = text.split(/\n\n/).length

#calculate averages
average_wordspersentence = word_count./sentence_count
average_sentencesperparagraph = sentence_count./paragraph_count

#percent interesting words
words = text.scan(/\w+/) #create array of words from text
keywords = words.select{|word| !stopwords.include?(word)} #grab all words not in the stopwords array
keywords_percentage = ((keywords.length./words.length.to_f) * 100).to_i

#summarize the text
sentences = text.gsub(/\s+/, ' ').strip.split(/\.|\?|!/)
sentences_sorted = sentences.sort_by{|sentence| sentence.length}
one_third = sentences_sorted.length/3
ideal_sentences = sentences_sorted.slice(one_third, one_third + 1)
ideal_sentences = ideal_sentences.select {|sentence| sentence =~ /is|are/}


puts "#{line_count} lines"
puts "#{total_characters} characters"
puts "#{total_characters_nospaces} characters excluding spaces"
puts "#{word_count} words"
puts "#{sentence_count} sentences"
puts "#{paragraph_count} paragraphs"
puts "#{average_wordspersentence} average words per sentence"
puts "#{average_sentencesperparagraph} sentences per paragraphs"
puts "#{keywords_percentage}% interesting words"
puts ideal_sentences.join(". ")

=begin
Chapter 6 notes: classes in Ruby only inherit from oneparent class, you can have private (within the class) variables, protected only usable within the class (how is it different from the other?), and of course public

Polymorphism: write code that will work with objexts of multiplle  type and classes at once. for example '+' is dependent on what you use it on.

Modules can be used to create name spaces to better organize your code.

Enumerable methods:
	.collect{|i| code block } <= modifies each element of an array
	.detect 
	.select
	.sort
	.max
	.min

=end