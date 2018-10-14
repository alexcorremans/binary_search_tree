class Node
    attr_reader :value
    attr_accessor :parent, :left_child, :right_child

    def initialize(value)
        @value = value
        @parent = nil
        @left_child = nil
        @right_child = nil
    end

    def has_children?
        !(@left_child.nil? && @right_child.nil?) ? true : false
    end

    def get_child_nodes
        child_nodes = []
        if @left_child.nil?
            child_nodes.push(@right_child)
        elsif @right_child.nil?
            child_nodes.push(@left_child)
        else
            child_nodes.push(@left_child,@right_child)            
        end
        return child_nodes
    end

    def display
        puts "Value: #{@value}"
        puts "Parent node value: #{@parent.value}" unless @parent.nil?
        puts "Left child node value: #{@left_child.value}" unless @left_child.nil?
        puts "Right child node value: #{@right_child.value}" unless @right_child.nil?
    end

end

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
        if (@tree.size == 0) #empty tree: take first element as root
            @root = Node.new(value)
            @tree.push(@root)
        else #compare new element with existing nodes
            new_node = Node.new(value)
            compare_nodes(@root, new_node)
            @tree.push(new_node)
        end

    end

    def compare_nodes(node, new_node)
        if new_node.value >= node.value
            if node.right_child.nil?
                node.right_child = new_node
                new_node.parent = node
            else
                compare_nodes(node.right_child, new_node)
            end
        else
            if node.left_child.nil?
                node.left_child = new_node
                new_node.parent = node
            else
                compare_nodes(node.left_child, new_node)
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
        queue = []
        current_node = @root
        queue.push(current_node)
        while not queue.empty?
            if current_node.value == value
                return current_node
            else
                queue = queue + current_node.get_child_nodes if current_node.has_children?
                queue.shift
                current_node = queue[0] unless queue.empty?
            end
        end
        return nil
    end

end

array =  [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
puts "Creating tree..."
bst = BinarySearchTree.new(array)
bst.display

puts "Breadth first search"
found = bst.breadth_first_search(8)
if found == nil
    puts "Node not found"
else
    puts "Node found!"
    found.display
end