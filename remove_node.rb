# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

# @param {ListNode} node
# @return {Void} Do not return anything, modify node in-place instead.
def delete_node(node)
    # We have a node we need to dleete
    # We start at that node
    # To delete in a linked list however, we need to point the previous
    # node to the node after the node to be deleted.
    # Since it only flows in one direction (the list) we have to traverse...
    # Hmm, this node is being pointed to from the previous node, we do not have
    # the head. We need to keep this node. One thing we can do, is copy the value
    # from the next node and then delete THAT node.
    if node.next
      node.val = node.next.val
      node.next = node.next.next
    end
end
