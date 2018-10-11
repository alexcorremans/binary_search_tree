class Node
    attr_reader :value
    attr_accessor :parent, :left_child, :right_child

    def initialize(value)
        @value = value
        @parent = nil
        @left_child = nil
        @right_child = nil
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
            puts "Value: #{node.value}"
            puts "Parent node value: #{node.parent.value}" unless node.parent.nil?
            puts "Left child node value: #{node.left_child.value}" unless node.left_child.nil?
            puts "Right child node value: #{node.right_child.value}" unless node.right_child.nil?
            puts "***********************"
        end
    end

    def breadth_first_search
        
    end

end

array =  [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
bst = BinarySearchTree.new(array)
bst.display