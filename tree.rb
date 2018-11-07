class BinarySearchTree

  def initialize(array)
    @tree = []
    @size = 0
    build_tree(array)
  end

  def build_tree(data)
    data.each do |value|
        insert_node(value)
    end
  end

  def insert_node(value)
    if (@tree.size == 0) # empty tree: take first element as root
        @root = Node.new(value)
        @tree.push(@root)
    else # compare new node with existing nodes
        new_node = Node.new(value)
        compare_nodes(@root, new_node)
        @tree.push(new_node)
    end
  end

  def compare_nodes(node, new_node)
    if new_node.value >= node.value
      if node.right.nil?
        node.right = new_node
        new_node.parent = node
      else
        compare_nodes(node.right, new_node)
      end
    else
      if node.left.nil?
        node.left = new_node
        new_node.parent = node
      else
        compare_nodes(node.left, new_node)
      end
    end
  end

  def display
    puts "List of nodes in the tree"
    @tree.each do |node|
      node.display
      puts "*******************"
    end
  end

  def breadth_first_search(value)
    return nil if @root.nil?
    queue = [@root]
    until queue.empty?
      current_node = queue.shift # queue: first in first out
      return current_node if current_node.value == value
      queue.push(current_node.left) unless current_node.left.nil?
      queue.push(current_node.right) unless current_node.right.nil?
    end
    return nil
  end

  def depth_first_search(value)
    return nil if @root.nil?
    stack = [@root]
    until stack.empty?
      current_node = stack.pop # stack: last in first out
      return current_node if current_node.value == value
      stack.push(current_node.right) unless current_node.right.nil?
      stack.push(current_node.left) unless current_node.left.nil? 
    end
    return nil
  end

  def dfs_rec(value, current_node=@root)
    return nil if current_node.nil?
    return current_node if current_node.value == value
    dfs_rec(value, current_node.left)
    dfs_rec(value, current_node.right)
  end
end