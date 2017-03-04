# ProjectEulerP3.rb
# The prime factors of 13195 are 5, 7, 13 and 29.
#
# What is the largest prime factor of the number 600851475143

# This quickly gets complex in terms of calculations if I brute force it
# something like...  O(n! * n)

# I can eliminate half the numbers in a space because even numbers aren't prime
# I can eliminate 1...
# So search through odd numbers and check if it is divisible by 3, that will get rid of 1/6 checks
# Also, I can work backwards, and I know the prime is less than half of the number.

def find_largest_prime(number)
  sol_space = number / 2
  for num in sol_space.downto(3)
    if is_prime?(num)
      if number % num == 0
        return num
      end
    end
  end
  return "There are no prime factors"
end

def is_prime?(number)
  for num in (number/2).downto(3)
    if number % num == 0
      return false
    end
  end
  return true
end


p is_prime?(5)
p is_prime?(13)
p is_prime?(101)
p is_prime?(24)

p find_largest_prime(13195)
p find_largest_prime(600851475143) # timed out... too big of a number need to be more efficient