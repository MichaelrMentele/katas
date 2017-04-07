# Bracket Matching
#
# Imagine your team is building a source code editor, and you are responsible for writing the highlighting function for matching square brackets ([ and ]). Your team expects the function to have the following API:
#
# match_bracket(source_code, left_bracket_position) => right_bracket_position or nil

# '[]' i = 0, i = 1

def match_bracket(source_code, left_bracket_position)
  # rvalue: index of right bracket OR nil if no closing bracket
  stack = []

  i = left_bracket_position
  while i < source_code.length do
    char = source_code[i]
    if char == '['
      stack.push char
    elsif char == ']'
      val = stack.pop
      return nil unless val

      # if stack is empty, we're done, return i
      if stack.length == 0
        return i
      end
    end

    i += 1
  end
end

puts match_bracket("te[st]", 2) == 5
puts match_bracket("te[st", 2) == nil
puts match_bracket("t[[st]", 2) == 5
puts match_bracket("t[[st]", 1) == nil
puts match_bracket("t[[s]t]", 1) == 6

def find_brackets(source_code, position)
  # rvalue: []

  # scan left from current postion position until open bracket
  # save that position, then call match_bracket on that position
  # return both positions

  i = position
  while i >= 0 do
    char = source_code[i]
    if char == '['
      left_position = i
      right_position = match_bracket source_code, left_position

      return [left_position, right_position] if right_position
    end
    i -= 1
  end

  return nil
end

puts "-----"
puts find_brackets("te[st]", 4) == [2, 5]
puts find_brackets("test]", 2) == nil
puts find_brackets("te[st]", 1) == nil
puts find_brackets("te[st]", 2) == [2, 5] # inclusive?
puts find_brackets("[te[st]]", 4) == [3, 6]
puts find_brackets("[te[st]]", 2) == [0, 7]
puts find_brackets("[te[st]", 2) == nil
