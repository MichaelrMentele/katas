class Book
	attr_accessor :title 

	#modify attr_accessors write part so it calls titleize
	def title=(title)
		@title = titleize(title)
	end


	#from simon sayeth...
	def titleize title
		stop_words = %w{the a an and but for nor or so yet in on of is} #etc
		title = title.gsub(/\w+/){|word| stop_words.include?(word) ? word.downcase : word.capitalize}
		return title[0].upcase + title[1..-1]
	end


end

