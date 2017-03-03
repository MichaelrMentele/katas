require 'minitest/autorun'
require_relative 'stack_with_linkedlist'

class StackTest < MiniTest::Unit::TestCase

  def test_push
    stack = Stack.new
    stack.push(10)
    refute stack.empty?
  end

  def test_pop
    stack = Stack.new
    stack.push(10)
    stack.push(20)
    assert_equal 20, stack.pop()
    assert_equal 10, stack.pop()
    assert_nil stack.pop()
  end

  def test_size
    stack = Stack.new
    stack.push(10)
    stack.push(20)
    assert_equal 2, stack.size()
  end

end
