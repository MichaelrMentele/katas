# Problem: Busiest time in the mall
# given a list of data rep as an integer array whose 
# size is 3 ie. [[timestamp, count, enter/exit], ...]
# where time stampis a in the Unix Epoch format 
# a nonnegative number holder the number of seconds since 
# 00:00:00 UTC Th 1st, Jan, 1970
# enter is 1, exit is 0 

# return the time at which the mall reached its busiest moment last year. Return a time stamp, if there are multiple, return the earlier one.

# the data is sorted in ascending order by the timestamp.

# Approach:
# We want to find the busiest time. This means the delta 
# between the number who have entered and left and knowing
# the total population in the mall. To rephrase, what time 
# has the largest population in the mall. 

# We can implement a greedy solution. Begining from the oldest time stamp we move forward keeping a running count 
# of the population, at each point we see whether people have entered or left and add/subtract as appropriate
# if the new population is greater than the old population
# then we assign it to the result, if it is tied, then we do nothing.

# Time: O(n), Space: O(1)

def busiest_time(doordata)
  pop_cnt = 0
  max_pop = 0
  res = 0
  
  doordata.each_with_index do |e, i| 
    
    if e.last == 0 
      pop_cnt -= e[1]
    elsif e.last == 1 
      pop_cnt += e[1] 
    end 
    
    # need to check all values at a given time stamp 
    # before making the comparison with max_pop
    next if i < doordata.length-1 && e[0] == doordata[i+1][0]
    
    if pop_cnt > max_pop 
      res = e.first
      max_pop = pop_cnt
    end 
  end 
  
  res 
end 

input = data = [ [1487799425, 14, 1], 
                 [1487799425, 4,  0],
                 [1487799425, 2,  0],
                 [1487800378, 10, 1],
                 [1487801478, 18, 0],
                 [1487801478, 18, 1],
                 [1487901013, 1,  0],
                 [1487901211, 7,  1],
                 [1487901211, 7,  0] ]
                 
puts busiest_time(data) == 1487800378
