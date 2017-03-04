def reverser 
	yield.split(' ').each{|word| word.reverse!}.join(' ')
end

def adder num = 1
	yield + num
end

def repeater num_repeat = 1
	count =0
	while count < num_repeat
		yield
		count += 1
	end
end
