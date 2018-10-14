class Node
    attr_reader :value
    attr_accessor :parent, :left, :right

    def initialize(value)
        @value = value
        @parent = nil
        @left = nil
        @right = nil
    end

    def has_children?
        !(@left.nil? && @right.nil?) ? true : false
    end

    def display
        puts "Value: #{@value}"
        puts "Parent node value: #{@parent.value}" unless @parent.nil?
        puts "Left child node value: #{@left.value}" unless @left.nil?
        puts "Right child node value: #{@right.value}" unless @right.nil?
    end

end
