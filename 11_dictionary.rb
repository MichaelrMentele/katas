class Dictionary
  
	def initialize
		@d = {}
	end

	def add dictionary
		dictionary.class == Hash ? @d[dictionary.keys[0]] =  dictionary.values[0] : @d[dictionary] =  nil
		@d
	end

	#display functions
	def entries
		@d
	end

	def keywords
		@d.keys.sort
	end

	def printable
		print_friendly = []
		ind = 0
		@d.keys.sort.each do |key| 
			print_friendly.push("[#{key}] \"#{@d[key].to_s}\"")
			ind += 1
		end
		print_friendly.join("\n")
	end

	#finder functions
	def include? keyword
		found = false
		@d.keys.each {|key| keyword == key ? found = true : next }
		found
	end

	def find keystuff
		found = {}
		@d.keys.each {|key| key =~ /#{keystuff}/ ? found[key] = @d[key] : next}
		found
	end

end


@d = Dictionary.new
 @d.add('zebra' => 'African land animal with stripes')
 @d.add('fish' => 'aquatic animal')
 @d.add('apple' => 'fruit')
 @d.printable