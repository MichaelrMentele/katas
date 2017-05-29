# find the four numbers that sum to 20 and return in ascending order

arr = [2, 7, 4, 0, 9, 5, 1, 3]
s = 20

# 0, 4, 7, 9 = 20

# Brute Force: O(n^4)

# Sort and find pairs
# [0, 1, 2, 3, 4, 5, 7 9, 21]
#  ^                   ^
# pair 9 and 0, search for pair that equals 11 
#     ^              ^
# pair is < 11 so increment left cursor
# continue until four is found 
# O(nlog(n) + n^3)
# look at i through last index, look through j to last, index, if two values remain
# we can search for a pair that equals the target 

# solution with a hash?
# same thing but hash the array to their complements
# O(n^3) and O(n) space

def quadruplet(arr, s)
  return [] if !arr || arr.length < 4
  
  arr.sort!
  
  for i in 0...(arr.length - 3) do # skip last three values, they must be part of quad 
    for j in (i+1)...(arr.length - 2) do 
      low = j + 1 
      high = arr.length - 1 
      
      target = s - arr[i] - arr[j] 
      while low < high do 
        current_value = arr[low] + arr[high]
        if current_value == target 
          return [arr[i], arr[j], arr[low], arr[high]] 
        elsif current_value < target 
          low += 1 
        elsif current_value > target 
          high -= 1
        end 
      end 
    end 
  end
  []
end

quadruplet([3,2,1,0,9,7,11], 20) 

