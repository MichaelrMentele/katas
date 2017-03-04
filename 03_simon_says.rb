
	def echo(word)
		word
	end

	def shout string
		string.upcase
	end

	def repeat string1, num_repeats = 2
		repeated = ''
		while num_repeats > 0
			num_repeats -= 1
			repeated += "#{string1} "
		end
		repeated.chop
	end
	
	def start_of_word string, num_letters
		letters = ''
		i = 0
		while i < num_letters
			letters += string[i]
			i+=1
		end
		letters

	end

	def first_word sentence
		sentence[/\S+/]
	end

	def titleize string
		stop_words = %w{and it i a the our are is over} #etc
		
		string = string.gsub(/\w+/){|word| stop_words.include?(word) ? word.downcase : word.capitalize}
		return string[0].upcase + string[1..-1]
		
	end



