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
def postorder_traversal_recursive(root)
    values = []
    return values unless root
    helper!(root, values)
    return values
end

def helper!(root, values)
    helper!(root.left, values) if root.left
    helper!(root.right, values) if root.right
    values << root.val
end

def postorder_traversal_iterative(root)
    res, stack = [], [[root, false]]

    while stack.length > 0
        history = stack.pop
        if history[0]
            node = history[0]
            visited = history[1]
            if visited
                res.push(node.val)
            else
                stack.push([node, true])
                stack.push([node.right, false])
                stack.push([node.left, false])
            end
        end
    end

    return res
end


root = TreeNode.new(10)
root.left = TreeNode.new(5)
root.right = TreeNode.new(15)
postorder_traversal_iterative(root)
