#I need to walk down the array first looking at pairs
#add the pairs and find the best sum
#Then look at trios and so on until the best group is found

################
# CORRECT CODE #
################
def corgi_golden_age(arr)
	start = 0
	
	distance = 0
	best = 0

	while distance < arr.length
		start = 0 #ADDED
		finish = distance + start# ADDED
		while finish < arr.length
			sum = 0
			arr[start..finish].each {|e| sum += e}
			if sum > best
				#puts sum <- TEST POINT
				best = sum
				best_start = start
				best_finish = finish
			end
			start += 1
			finish = distance + start
		end
		distance += 1
	end
	return [best_start, best_finish]
end

puts corgi_golden_age([1,2,3])
puts corgi_golden_age([100, -101, 200, -3, 1000])
puts corgi_golden_age([5, 3, -5, 1, 19, 2, -4])

# #OLD CODE
# def corgi_golden_age(arr)
# 	start = 0
	
# 	distance = 0
# 	best = 0

# 	while distance < arr.length
# 		while finish < arr.length
# 			sum = 0
# 			arr[start..finish].each {|e| sum += e}
# 			if sum > best
# 				best = sum
# 				best_start = start
# 				best_finish = finish
# 			end
# 			start += 1
# 			finish = distance + start
# 		end
# 		distance += 1
# 	end
# 	return [best_start, best_finish]
# end