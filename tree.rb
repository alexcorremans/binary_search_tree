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