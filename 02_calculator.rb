def add(num1, num2)
	num1 + num2
end

def subtract(num, subtractor)
	num - subtractor
end

def sum(values)
	sum = 0
	values.each {|i| sum += i}
	sum
end

def multiply(num1, num2)
	num1 * num2
end

def power(num, power)
	exponent = num
	while power > 1
		exponent *= num
		power -= 1
	end
	exponent
end

def factorial(num)
	i = num
	while  i > 1
		i -= 1
		num *= i
	end
	num
end

