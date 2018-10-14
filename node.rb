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
