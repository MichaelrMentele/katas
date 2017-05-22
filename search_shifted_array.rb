# a sorted array has been shifted some number of times
# [24, 25, 26, 1, 2, 3]
# find and return a given number efficiently

# Brute force: scan the array in n time

# Optimal: binary search the array log(n) time 
# we can do a modified binary search over the shiftedArr
# find the pivot point, where the current value is less 
# than the previous. Then, if the number is greater than the 
# anchor than we know we need to search the values vefore 
# the pivot. If it's less we binary searchover the values 
# after the pivot 

def search_shifted(shiftedArr, num)
  
  pivot = find_pivot(shiftedArr)
  if !pivot # no pivot found
    binary_search(shiftedArr, num)
  elsif num < shiftedArr[0] 
    # must be at or after pivot
    binary_search(shiftedArr, num, pivot, shiftedArr.length-1)
  else 
    # must be before pivot 
    binary_search(shiftedArr, num, 0, pivot-1)
  end 
end

def find_pivot(arr, beg=0, last=arr.length-1)
  return nil if arr.length <= 1 
  
  while beg <= last do 
    mid = (beg + last) / 2 
    if mid > 0 && arr[mid-1] > arr[mid]
      # found pivot
      return mid 
    elsif arr[mid] < arr[0]
      # we are after pivot, throw away top 
      last = mid - 1 
    elsif arr[mid] > arr[0]
      # we are before pivot, throw away bottom
      beg = mid + 1
    end 
  end 
    
  nil
end 

def binary_search(arr, num, beg=0, last=arr.length-1)

  while beg <= last do 
    mid = (beg + last) / 2
    if arr[mid] == num 
      return mid
    elsif arr[mid] > num 
      last = mid - 1
    elsif arr[mid] < num 
      beg = mid + 1
    end 
  end 
  
  nil 
end

puts binary_search([1,2,3], 3) == 2 
puts find_pivot([13,14,1,2,3]) == 2
puts search_shifted([13,14,1,2,3], 14) == 1 
puts search_shifted([13,14,1,2,3], 13) == 0 
puts search_shifted([13], 13) == 0 
