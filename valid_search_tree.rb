def valid_search_tree(root)
  # All children of a node to the left must be less than that node
  # All children of a node to the right must be greater than that node

  # One way is to do an inorder traversal of the tree as an array
  # Then scan that array and make sure every node is in the right place.
  # This will take O(n). I don't think we can do better. We ahve to scan the
  # Whole tree to know...
  list = []
  inorder_traversal(root, list)
  list.each_with_index do |node, i|
    return false if node.value > list[i + 1]
  end

  return true
end

def inorder_traversal(root, list)
  return if root.nil?

  list.push(root.value)
  inorder_traversal(root.left)
  inorder_traversal(root.right)
end
