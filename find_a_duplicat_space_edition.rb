# Find a duplicate, Space Edition™.
# We have an array of integers, where:

# The integers are in the range 1..n1..n
# The array has a length of n+1n+1
# It follows that our array has at least one integer which appears at least twice. But it may have several duplicates, and each duplicate may appear more than twice.

# Write a function which finds an integer that appears more than once in our array. (If there are multiple duplicates, you only need to find one of them.)

# We're going to run this function on our new, super-hip Macbook Pro With Retina Display™. Thing is, the damn thing came with the RAM soldered right to the motherboard, so we can't upgrade our RAM. So we need to optimize for space!
#
#

# Approach:
# We need to perform this analysis in place with O(1) space.
# We could sort the list using an inplace algorithm like bubble sort
# Then we could walk the array with two pointers at i and i + 1, when 
# arr(i) and arr(i + 1) are the same, return them
def find_a_duplicate(arr)
  in_place_merge_sort!(arr)
  arr.each_with_index do |n, i|
    if n == arr[i] 
      dup = n
      break
    end
  end

  return dup
end

find_a_duplicate([1,3,2,3]) == 3
find_a_duplicate([3,3,2,2]) == 2
find_a_duplicate([1,1,4,3]) == 1
