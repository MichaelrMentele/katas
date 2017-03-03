# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {TreeNode} root
# @return {Integer[]}

def preorder_traversal_recursive(root)
    # returns an array
    # head, left, right
    values = []
    preorder_traversal!(root, values)
    return values
end

def preorder_traversal!(root, values)
  # we want to add root, left, right
  return unless root
  values << root.val
  preorder_traversal!(root.left, values) if root.left
  preorder_traversal!(root.right, values) if root.right
end

def preorder_traversal_iterative(root)
  res, stack = [], []
  while true
    while root do
      res << root.val
      stack.push(root.right)
      root = root.left
    end
    return res if stack.empty?
    root = stack.pop
  end
end
