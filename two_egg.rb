# Two egg problem
# A building has 100 floors. One of the floors is the highest floor an egg can be dropped from without breaking.
# If an egg is dropped from above that floor, it will break. If it is dropped from that floor or below, it will be completely undamaged and you can drop the egg again.
#
# Given two eggs, find the highest floor an egg can be dropped from without breaking, with as few drops as possible.

##############################
# Strategy 1: Binary Search* #
##############################
# We could drop an egg from 50 and binary search up if it doesn't break,
# worst case is 50 operations, since, worst case, we can only divide the
# problem in half once--(because the answer is 49 and we drop the egg at 50 and it breaks).

# O(1) space
# O(n) time
# Worst Case 50 operations
def decent_two_egg(highest_floor)
  operations = 0 # track how efficient this solution is

  eggs = 2

  min = 0
  max = 100
  while eggs > 1 do
    operations += 1

    # guess the middle as long as you have two eggs
    mid = min + (max - min) / 2
    if mid == highest_floor
      return operations
    elsif mid < highest_floor # it didn't break
      min = mid + 1
    elsif mid > highest_floor # it did break
      max = mid - 1
      eggs = 1
    end

  end

  # count up, floor by floor since we only have one egg
  while min <= max do
    operations += 1

    if min == highest_floor
      return operations
    end
    min += 1
  end
end

##################################
# Strategy 2: Window1 == Window2 #
##################################
# We want to minimize the number of checks we need to do, or have a window that divides
# the problem space the same amount at its sub problem.
#
# What is the smallest period W1, where 100 / W1 == W1 / 1 ?
#
# If the window is 10, then with the second 'egg' or cursor, counting by 1 we divide 10 also 10 times
#
# 10 is the minimal period. We 'look ahead', by doubling, or looking every 10 segments.
# example:
# 1. Drop an egg at 10, if it breaks, we make up to 9 checks with the second egg
# 2. If it doesn't drop, look ahead to 20, if it breaks, 9 checks from 10 to 19

# O(1) space
# O(n) time
# Worst case: 20 operations
def better_two_egg(highest_floor)
  operations = 0 # track how efficient this solution is

  eggs = 2

  window = 10
  guess = 10 # intial guess to drop the first egg

  min_floor = 1
  max_floor = 100
  while eggs > 1 do
    operations += 1

    if guess == highest_floor
      return operations
    elsif guess < highest_floor # it didn't break
      guess += window
    elsif guess > highest_floor # it did break
      min_floor = guess - window
      max_floor = guess - 1
      eggs = 1
    end
  end

  # count up, floor by floor since we only have one egg
  while min_floor <= max_floor do
    operations += 1

    if guess == highest_floor
      return operations
    end
    min_floor += 1
    guess = min_floor
  end
end


################################
# Strategy 3 - Sliding Window1 #
################################
# We can do a little better...
# We need a number series for the first drop, that is less than 19, and decrements by 1
# such that is adds up to 100
# so (x + x-1 + x-2 + x-x) == 100
# x - 0 + x - 1 + x - 2 == 10
# 4 + 3 + 2 + 1
# ... == 100
# 13 + 12 + 11 + 10 + 9 + 8 + 7 + 6 + 5 + 4 + 3 + 2 + 1

# This is a triangular series:
# n * (n+1) / 2 = 100 solving for n, n = 13.7

# O(1) space
# O(log(n)) time
# Worst case: 14 operations
def best_two_egg(highest_floor)
  operations = 0 # track how efficient this solution is

  eggs = 2

  window = 14
  guess = window # intial guess to drop the first egg

  min_floor = 1
  max_floor = 100
  while eggs > 1 && operations < 20 do
    operations += 1

    if guess == highest_floor
      return operations
    elsif guess < highest_floor # it didn't break
      window = window - 1
      guess += window
    elsif guess > highest_floor # it did break
      min_floor = guess - window
      eggs = 1
    end
  end

  # count up, floor by floor since we only have one egg
  while min_floor <= max_floor && operations < 16 do
    operations += 1

    if guess == highest_floor
      return operations
    end
    min_floor += 1
    guess = min_floor
  end

  return "Failed to find the highest floor."
end

puts "Decent: Worst case completed in #{decent_two_egg(49)} operations"
puts "Better: Worst case completed in #{better_two_egg(99)} operations"
puts "Best: Worst case completed in #{best_two_egg(99)} operations"
