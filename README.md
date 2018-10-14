This is a Ruby implementation of a binary search tree using a `Node` and a `BinarySearchTree` class (defined in 'node.rb' and 'tree.rb' respectively). The tree itself is an array of `Node` objects, each node linking to its parent and child nodes. 

It builds a tree based on an unsorted array. As per the assignment, I've assumed the array can't get sorted before the tree is built, meaning the tree can be unbalanced. 

To help check if the program works correctly, the `Node` class has a `#display` method which prints the node value and its parent and child node values (if any). Similarly the `#display` method for the `BinarySearchTree` class loops through the tree and displays each node in turn. 

The `BinarySearchTree` class has the following search methods:

  * `#breadth_first_search` takes a target value and returns the node at which it is located using the breadth first search technique
  * `#depth_first_search` does the same using the depth first search technique, more specifically preorder traversal (root-left-right)

If the target node value is not located, each of these methods returns `nil`. 

From The Odin Project's [curriculum](https://www.theodinproject.com/courses/ruby-programming/lessons/data-structures-and-algorithms)
