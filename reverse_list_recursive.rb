# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end

    def to_s
      puts self.val
      self.next.to_s if self.next
    end
end

# @param {ListNode} head
# @return {ListNode}

def print_list(head)
  puts head.val
  tail = head.next
  print_list(tail) if tail
end

def easier_reverse_list_recursive(head, previous=nil)
  # Edgecase: if head is empty, return, we have an empty list
  return unless head

  tail = head.next
  head.next = previous

  # the reverse of a list of length one, is itself
  return head unless tail

  easier_reverse_list_recursive(tail, head)
end

def reverse_list_recursive(node)
    # for a -> b -> c
    # reverse(tail) -> a
    # reverse(tail) -> b -> a

    return node if node.nil? || node.next.nil?
    head, tail = node, node.next

    list = reverse_list_recursive(tail)
    tail.next = head
    head.next = nil
    return list
end

def append(list_node, new_node)
  # return the list with the new node appended

  # traverse to the end of list_node and set next to node
  if list_node.next.nil?
    list_node.next = new_node
  else
    append(list_node.next, new_node)
  end

  return list_node
end

head = ListNode.new(1)
head.next = ListNode.new(2)
head.next.next = ListNode.new(3)

#easier_reverse_list_recursive(head)
head = append(head, ListNode.new(4))
print_list(head)
