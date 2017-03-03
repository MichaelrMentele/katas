# Write a function that takes a string as input and returns the string reversed.
#
# Example:
# Given s = "hello", return "olleh".

# With Stack DS - Reversal is the convenient propery of a stack
# Time: O(n) Space: O(n)
def reverse_string(s)
  i = 0
  stack = []
  while i < s.length do
    stack.push(s[i])
    i += 1
  end

  rev_s = ""
  while stack.length > 0 do
    rev_s = stack.pop
  end

  rev_s
end

# With inplace reversal

def reverse_string_inplace(s)
  cursor_a = 0
  cursor_b = s.length - 1

  while cursor_a < cursor_b do
    tmp = s[cursor_a]
    s[cursor_a] = s[cursor_b]
    s[cursor_b] = tmp

    cursor_a += 1
    cursor_b -= 1
  end
  s
end
