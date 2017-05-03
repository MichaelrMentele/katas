class Node
  attr_accessor :value, :next

  def initialize(value)
    @value = value
    @next = nil
  end
end

def traverse(head, needle)
  return true if helper_contains?(head, needle, true)
  return false if head == nil
  traverse(head.next, needle)
end

def helper_contains?(node, needle, first_call)
  return false if node == nil

  # if first call, check the suffix of the string
  if first_call
    start_of_overlap = node.value.index(needle[0])
  else
    start_of_overlap = 0
  end

  # final case
  return true if node.value.start_with?(needle)

  # if there is a partial overlap remove
  overlap_size = node.value.length - start_of_overlap
  return false unless node.value[start_of_overlap..-1] == needle[0...overlap_size]

  helper_contains?(node.next, needle[overlap_size..-1], false)
end

a = Node.new("this")
b = Node.new("is")
c = Node.new("it")
a.next = b
b.next = c

puts traverse(a, "isit") == true
puts traverse(a, "isis") == true
puts traverse(a, "isiS") == false

puts traverse(b, "is", true) == true
puts traverse(a, "thisisit", true) == true
puts traverse(a, "s", true) == true
puts traverse(a, "it") == true



puts traverse()

# care about caps
def prefix_contains?(haystack, needle)
  i = 0
  while i < haystack.length
    j = 0
    while j < needle.length
      # boundary condition
      # ith character of needle is equal to
      # i in haystack with the window of needle length
      break unless haystack[i + j] == needle[j]
      return true if j == needle.length - 1

      j += 1
    end

    i += 1
  end

  return false
end
#
# test = "thisisit"
# puts contains?(test, "isit") == true
# puts contains?(test, "ist") == false
