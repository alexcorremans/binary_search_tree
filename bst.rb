require_relative 'node'
require_relative 'tree'

array =  [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
puts "Creating tree..."
bst = BinarySearchTree.new(array)
bst.display

puts "\nBreadth first search"
found = bst.breadth_first_search(8)
if found == nil
    puts "Node not found"
else
    puts "Node found!"
    found.display
end

puts "\nDepth first search (preorder - DLR)"
found = bst.depth_first_search(8)
if found == nil
    puts "Node not found"
else
    puts "Node found!"
    found.display
end

puts "\nDepth first search (preorder - DLR) - recursive"
found = bst.depth_first_search(8)
if found == nil
    puts "Node not found"
else
    puts "Node found!"
    found.display
end