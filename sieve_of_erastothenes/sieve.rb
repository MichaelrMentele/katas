# Write a program that uses the Sieve of Eratosthenes to find all the primes
# from 2 up to a given number.
#
# The Sieve of Eratosthenes is a simple, ancient algorithm for finding all
# prime numbers up to any given limit. It does so by iteratively marking as
# composite (i.e. not prime) the multiples of each prime, starting with the multiples of 2.
#
# Create your range, starting at two and continuing up to and including the
# given limit. (i.e. [2, limit]).
#
# The algorithm consists of repeating the following over and over:
#
# take the next available unmarked number in your list (it is prime)
# mark all the multiples of that number (they are not prime)
# Repeat until you have processed each number in your range. When the algorithm
# terminates, all the numbers in the list that have not been marked are prime.
# The wikipedia article has a useful graphic that explains the algorithm.
#
# Notice that this is a very specific algorithm, and the tests don't check that
# you've implemented the algorithm, only that you've come up with the correct list of primes.

class Sieve
  def initialize(target)
    @target = target
  end

  def primes
    # rvalue: [] of primes up to, and including, @target
    potential_primes = (2..@target).to_a
    # we could use a hash to represent whether something has been marked or not
    # maybe we could represent 'marked' as just removing the multiples and shifting
    # the first number into a list called primes.
    primes = []
    while potential_primes.length > 0 do
      current_prime = potential_primes.shift
      potential_primes = prune(current_prime, potential_primes)
      primes << current_prime
    end
    primes
  end

  def prune(prime, potential_primes)
    # rvalue: returns potential_primes where all multiples of prime have been deleted

    # select everything that isn't evenly divided by prime
    potential_primes.select { |num| num % prime != 0 }
  end
end
