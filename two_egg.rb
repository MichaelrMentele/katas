# Two egg problem
# A building has 100 floors. One of the floors is the highest floor an egg can be dropped from without breaking.
# If an egg is dropped from above that floor, it will break. If it is dropped from that floor or below, it will be completely undamaged and you can drop the egg again.
#
# Given two eggs, find the highest floor an egg can be dropped from without breaking, with as few drops as possible.

# Strategy 1
# We could drop an egg from 50 and binary search up if it doesn't break,
# worst case is 50

# Strategy 2
# We 'look ahead', by doubling, or looking every 10 segments
# Try 10, if it breaks, 9, look ahead to 20, if it breaks, 9 checks from 10 to 19
# the worst amount of checks is 19
# If we do 5, it'd be 24
# Evenly dividing 100 seems to be the best choice. The number with the least amount
# of divisions and least amount of counts.
# We want to minimize the number of checks we need to do, or have a window that divides
# the problem space the same amount at its sub problem.
# for a size of 10, we divide 100 10 times, and with the second 'egg' or cursor
# we divide 10 also 10 times

# Strategy 3
# We can do a little better I think
# We need a number series for the first drop, that is less than 19, and decrements by 1
# such that is adds up to 100
# so (x + x-1 + x-2 + x-x) == 100
# x - 0 + x - 1 + x - 2 == 10
# 4 + 3 + 2 + 1
# ... == 100
# 13 + 12 + 11 + 10 + 9 + 8 + 7 + 6 + 5 + 4 + 3 + 2 + 1
