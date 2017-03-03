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

def inorder_traversal_recursive(root)
    # returns an array
    # left, head, right
    values = []
    inorder_traversal!(root, values)
    return values
end

# helper function to hold state for recursive calls
def inorder_traversal!(root, values)
    return nil unless root
    inorder_traversal!(root.left, values) if root.left
    values << root.val
    inorder_traversal!(root.right, values) if root.right
end

def inorder_traversal_iteration(root)
    # returns an array
    # left, head, right
    # iterating through a binary tree, naturally leads to DFS
    result, stack = [], []
    while true do
       while root do # traverse to lower left of tree (NULL node)
           stack.push(root)
           root = root.left
       end
       return result if stack.empty? # any nodes to go back and check?
       root = stack.pop # rewind and capture the last visited nodes value
       result.push(root.val)
       root = root.right
    end
    return result
end
