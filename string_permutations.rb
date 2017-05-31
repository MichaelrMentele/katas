# DP solution
# runtime: O(k!) where k is the length of the string
# space: O(k!) elements in the list plus the space on the call stack which is O(log(k)) which is simple O(k!)

def string_permutations(str) 
  return [] if !str || str.length == 0
  
  perms = []
  helper(rest: str, perms: perms)
  perms 
end 

def helper(pre: "", rest:, perms:)
  if rest.length < 2
    perms.push(pre + rest) 
    return 
  end
  
  for i in 0...rest.length do 
    copy = rest.dup
    copy.slice!(i)
    
    helper(pre: pre + rest[i], rest: copy, perms: perms)
  end 
end

perms = []
helper(rest:"ab", perms: perms)
p perms

perms = []
helper(rest:"abc", perms: perms)
p perms

p string_permutations("a")
p string_permutations("")
p string_permutations(nil)
p string_permutations("ab")
p string_permutations("abc")
p string_permutations("abcd")
