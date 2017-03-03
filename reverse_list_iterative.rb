class ListNode
  attr_accessor :data, :next_node
  def initialize(data)
    @data = data
    @next_node = nil
  end

  def to_s
    current = self
    while current != nil
      puts current.data
      current = current.next_node
    end
  end
end

def reverse_list(list_node)
  return list_node if list_node.nil?

  previous = nil
  current = list_node
  while current != nil
    # save the next_node
    next_node = current.next_node

    # link current to node before it, instead of after
    current.next_node = previous

    previous = current
    current = next_node
  end

  return previous
end

head = ListNode.new(1)
head.next_node = ListNode.new(2)
head.next_node.next_node = ListNode.new(3)
head.to_s
test = reverse_list(head)
test.to_s
