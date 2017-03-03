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

# returns a list with no duplicates
# IN: 1, 1, 2, 3
# OT: 1, 2, 3
def delete_duplicates(node)

    return node if node.nil? || node.next.nil?

    head, tail = node, node.next
    # the next element is the rest of the list without any duplicates
    head.next = delete_duplicates(tail)

    if head.val == tail.val
      return head.next
    else
      return head
    end
end

# Test
head = ListNode.new(1)
head.next = ListNode.new(1)
head.next.next = ListNode.new(2)
head.next.next.next = ListNode.new(3)
head.next.next.next.next = ListNode.new(3)
head.to_s
new_list = delete_duplicates(head)
new_list.to_s
