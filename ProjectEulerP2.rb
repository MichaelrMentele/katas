# Project Euler P2
# Each new term in the Fibonacci sequence is generated 
# by adding the previous two terms. By starting with 1 and 2, 
# the first 10 terms will be:
#
# 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
#
# By considering the terms in the Fibonacci sequence whose 
# values do not exceed four million, find the sum of the 
# even-valued terms.

# Not a general solution
def fibonacci_even_sum()
  '''Finds the sum of even terms in a fib sequence below 4 million'''
  a = 1
  b = 2
  even_sum = 2
  fib = 0
  # Add first two terms for third then shift values and repeat
  while fib < 3500000 do
    fib = a + b
    if fib % 2 == 0
      even_sum += fib
    end
    a = b
    b = fib
  end

  puts fib
  puts even_sum
end

