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

    attr_reader :size

    def initialize(array)
        @tree = []
        @size = 0
        create_tree(array)
    end

    def create_tree(data)
        data.each do |value|
            insert_node(value)
        end
    end

    def insert_node(value)
        #if tree is empty: first node is root and gets a value
        if (@tree.size == 0)
            root = Node.new(value)
            @tree.push(root)
        
        #one node already
        else
            new_node = Node.new(value)
            @tree.map! do |node|
                if value >= node.value
                    node.right_child = new_node
                    new_node.parent = node
                else
                    node.left_child = new_node
                    new_node.parent = node
                end
            end
            @tree.push(new_node)
        end

    end

    def display
        puts "Nodes"
        @tree.each do |node|
            puts "Value: #{node.value}"
            puts "Parent node value: #{node.parent.value}" unless node.parent.nil?
            puts "Left child node value: #{node.left_child.value}" unless node.left_child.nil?
            puts "Right child node value: #{node.right_child.value}" unless node.right_child.nil?
            puts "***********************"
        end
    end
end

array =  [1,7,4,23,8,9,4,3,5,7,9,67,6345,324]
bst = BinarySearchTree.new([1,7])
bst.display