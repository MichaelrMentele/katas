require 'binary_tree_node'

def second_largest(root)
  # the shortest path is to use the rules of the tree. The value in the lower
  # right is the greatest values because every node to the right is a greater
  # value than the one before it. We do a depth first search, always taking the
  # right path, until we hit a leaf node. Then we return that nodes parent.
  # This means we need to either carry an extra param or look ahead one node

  # We need to have at least two nodes. It could also be possible that if there,
  # are only two nodes, then the left node could be second largest.
  return false if root.right.nil? && root.left.nil?

  # if there is no right node to traverse, we are done, it must be the node to
  # the left of root
  return root.left if root.right.nil?

  # if there is no right after the next right
  return root if root.right.right.nil?

  second_largest(root.right)
end
