

def translate to_pig_latin
	
	words_to_translate = to_pig_latin.split(' ')
	translated = [] #variable to hold words translated into pig latin

	words_to_translate.each do |word|

		word.each_char do |letter|
			#if a consonant, move each consonant to the words end until you reach a vowel 
			#if a vowel you go to else, break out and append 'ay', nice
			unless vowel?(letter)
				if qu?(letter) 
					#move 'qu' to the end of the word
					word = word[2..-1] + word[0..1] 
				else
					word = word[1..-1] + word[0]
				end
			#if you hit a vowel your done
			else
				break
			end
		end

		translated.push(word += 'ay')
	end

	return translated.join(' ')
end

def vowel? letter
	vowels = %w{a e i o u}
	vowels.include?(letter.downcase)
end

def qu? letter
	#special case of q (which is almost-always followed by u) then move both and break
	(letter == 'q' || letter == 'Q') ? true : false
end




