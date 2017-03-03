class Node
  attr_accessor :value, :next

  def initialize(value, next_node = nil)
    @value = value
    @next = next_node
  end
end

class SinglyList
  attr_accessor :head, :current

  def initialize(head_node=nil)
    @head = head_node
    @current = @head
  end

  def add(value)
    # O(1), always pushes to the head
    if @head
      @head = Node.new(value, @head)
    else
      @head = Node.new(value)
    end
  end

  def nth(n)
    @current = @head
    count = 1
    loop do
      if count == n
        return @current
      elsif @current.next
         @current = @current.next
         count += 1
      else
        return -1
      end
    end
  end

  def find(value)
    # O(n)
    @current = @head
    loop do
      if @current.value == value
         return @current
      elsif @current.next
         @current = @current.next
      else
         return -1
      end
    end
  end

  def insert(value)
    right = @current.next
    new_node = Node.new(value, right)
    @current.next = new_node
  end

  def remove_head
    return nil unless @head
    value = @head.value
    @head = @head.next
    return value
  end

  def remove_current
    # - - -
    # O(n)
    # We find the size which is a traversal - n operations
    # Finding the remainder to the right of current and to the left is n operations
    # For n nodes we make 2n operations -> O(n)
    # - - -

    # removes the node @current
    removed_node = @current
    next_node = @current.next

    size = self.size
    remainder = self.size(from_current: true)
    prev_node_loc = size - remainder
    prev_node = self.nth(prev_node_loc)
    prev_node.next = next_node
    return removed_node.value
  end

  def size(from_current: false)
    count = 1
    from_current ? cur = @current : cur = @head
    loop do
      return count unless cur.next
      count += 1
      cur = cur.next
    end
  end
end
