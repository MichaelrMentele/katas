# Given a sorted linked list, delete all nodes that have duplicate numbers, leaving only distinct numbers from the original list.
#
# For example,
# Given 1->2->3->3->4->4->5, return 1->2->5.
# Given 1->1->1->2->3, return 2->3.
#
# Subscribe to see which companies asked this question.

class ListNode
  attr_accessor :data, :next

  def initialize(data)
    @data = data
    @next = nil
  end

  def to_s
    puts @data
    @next.to_s
  end
end

def remove_duplicates_distinct(list_node)
  '''
  input: list_node
  output: list_node
  '''
  return list_node if list_node.nil? || list_node.next.nil?

  head, tail = list_node, list_node.next

  # traverse the list, whenever we have multiple values that are the same,
  # remove them all
  if head.data == tail.data
    head = delete_all_of(head, head.data)
    return remove_duplicates_distinct(head.next)
  else
    head.next = remove_duplicates_distinct(head.next)
  end

  return head
end

def delete_all_of(list_node, value)
  current = list_node
  while current.data == value
    current = current.next
  end

  return current
end

head = ListNode.new(1)
head.next = ListNode.new(1)
head.next.next = ListNode.new(2)
head.next.next.next = ListNode.new(3)
test = remove_duplicates_distinct(head)
test.to_s
