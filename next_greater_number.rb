
# if the current number is greater then the top in the stack
# pop all values, and for each one push the current number into 
# the results array. Finally, add the current value to the stack

def next_greaters(arr)
  results = []
  stack = []
  for i in 0...arr.length do 
    cur = arr[i] 
    if stack[-1] && cur > stack[-1] 
      while stack[-1] do 
        results.push cur
        stack.pop
      end
    end 
    stack.push cur
  end
  
  while stack[-1] do 
    results.push -1
    stack.pop
  end 
  
  results
end 

puts next_greaters([3,2,1]) == [-1,-1,-1] 
puts next_greaters([1,2,3]) == [2, 3, -1]
puts next_greaters([]) == []
puts next_greaters([1,4,3,2,5]) == [4, 5, 5, 5, -1]
