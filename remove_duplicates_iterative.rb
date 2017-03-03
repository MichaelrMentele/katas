class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

# removes duplicates from a linked list
def remove_duplicates(head)
  while head != nil
    tail = head.next
    return if tail == nil

    if head.val == tail.val
      # skip tail and point to next next
      head.next = tail.next if tail.next
    end
  end
end

# Test
head = ListNode.new(1)
head.next = ListNode.new(1)
head.next.next = ListNode.new(2)
head.next.next.next = ListNode.new(3)
head.next.next.next.next = ListNode.new(3)
delete_duplicates(head)
