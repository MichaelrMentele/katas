def TripleDouble(num1,num2)

  num1 = num1.to_s.split('')
  num2 = num2.to_s.split('')
  
  count_to_three = 1
  #for each character in num1 start a new count
  num1.each_index do |i|
  	if i == num1.length
  		break
  	elsif num1[i] == num1[i + 1]
  		count_to_three += 1
  		digit = num1[i]
  	else
  		count_to_three = 1
  	end

  	if count_to_three == 3
  		return double(num2, digit) if double(num2, digit) = 1
  	end
    
  end
  0
  
         
end

def double(num, digit)
	num.2_each_index do |i|
		if i == num2.length
			break
		elsif num2[i] == digit
			return 1 if num[i] == num[i+1]
		end
end

puts TripleDouble(556668, 5566886)