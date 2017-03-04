def OffLineMinimum(strarr)
	"""
	Accepts an array of integers
	"""
	current_set = []
	new_set = []
	#walk down str arr if you hit an E pop the min from the current set
	strarr.each do |e|
		puts e
		(0..9).to_s.include?(e) ? current_set << e : new_set << strarr.pop(current_set.min)
		puts current_set
		
	end
	new_set
end

puts OffLineMinimum(['1','1','2','E'])