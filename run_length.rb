# def RunLength(str)
# 	# =begin
# 	# 0. convert string to array
# 	# 1. iterate over array
# 	# 	a. for each character count 1 then check if the next char is equal
# 	# 	b. if not then append the count and the char to new string
# 	# 2. return new string
# 	# =end

# 	str = str.split('')
# 	run_length_str = ''

# 	i = 0
# 	count = 1
# 	while i < str.length
		
# 		if str[i] == str[i + 1]
# 			count += 1
# 		else
# 			run_length_str << count.to_s << str[i]
# 			count = 1
# 		end
# 		i += 1
		
# 	end
# 	run_length_str

# end

# puts RunLength('wwwrrrttt') 
# puts RunLength('wtttttttedfe') 

# def PrimeMover(nth_prime)

# 	#prime numbers have no factors
# 	#find prime numbers up to num
# 	#would be good to save high use prime numbers to avoid recalculation...
# 	primes = [2]
# 	number = 3
# 	while primes.length < nth_prime
# 		primes << number if is_prime?(number)
# 		number += 2
# 	end

# 	primes.last
	

# end

# def is_prime?(num)
		
# 		(3..Math.sqrt(num)).step(2){|x| return false if num % x == 0}
		
# 		true
# end

# puts PrimeMover(2)
# puts PrimeMover(9)
# puts PrimeMover(400)

# def ArrayAddition(arr)
# 	#find max
# 	#iterate through array in group of 2 then 3 then 4 until your group size is the arr length
# 	#for each group size shift it or iterate it through the arr until it reaches the end
# 	target = arr.max
# 	arr.delete(target)

	# groupsize = 2
	# start = 0
	# finish = groupsize - 1
	
	# while groupsize < arr.length
		
	# 	while finish < arr.length
	# 		sum = 0
	# 		arr[start..finish].each{|e| sum += e}

	# 		if sum == target
	# 			return true
	# 		end
	# 		start += 1
	# 		finish = start + groupsize - 1
	# 	end

	# 	groupsize += 1

	# end
	# false

	#for permutations of 1 to the length of the array
# 	(1..arr.length).each do |number_of_elements_involved|
# 		arr.permutations(number_of_elements_involved).each do |combination|
# 			return true if combination.inject {|sum, x| sum + x} ==target
# 		end
# 	end

# 	false

# end

# puts ArrayAddition([3,5,-1,8,12])
# puts ArrayAddition([2,6,18])

# def BinaryConverter(str)
#   binary_place = 0
#   sum = 0 
#   str.split('').reverse.each do |c|
#     num = c.to_i
#     (sum += 2**binary_place) if num == 1 
#     binary_place +=1
#   end
  
#   sum
         
# end

# def SimpleMode(arr)

#   #
#   counter = Hash.new {|hash, key| hash[key] = 0}
#   arr.each do |e|
#     counter[e] += 1
#     end
#   frequent = counter.values.max
#   counter[frequent] == 1 ? return -1 : return counterfre
         
# end