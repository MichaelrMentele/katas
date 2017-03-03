require_relative '../singly_linked_list'

class Stack
  def initialize
    @stack = SinglyList.new
  end

  def push(value)
    @stack.add(value)
  end

  def pop
    @stack.remove_head
  end

  def size
    @stack.size
  end

  def empty?
    @stack.size == 0
  end
end
