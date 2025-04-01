//
//  Tree.swift
//  SwiftDSA
//
//  Created by Akhilesh Mishra on 20/03/25.
//

import Foundation

// ********************
// ******* TREE *******
// ********************
/*
 
 A tree is a non-linear hierarchical data structure that consists of nodes connected by edges.
 
 Other data structures such as arrays, linked list, stack, and queue are linear data structures that store data sequentially. In order to perform any operation in a linear data structure, the time complexity increases with the increase in the data size. But, it is not acceptable in today's computational world.

 Different tree data structures allow quicker and easier access to the data as it is a non-linear data structure.
 
 Tree Terminologies:
 --------------------
 
 Node:
 - A node is an entity that contains a key or value and pointers to its child nodes.
 - The last nodes of each path are called leaf nodes or external nodes that do not contain a link/pointer to child nodes.
 - The node having at least a child node is called an internal node.
 
 Edge:
 - It is the link between any two nodes.
 
 Root:
 - It is the topmost node of a tree.
 
 Height of a Node:
 - The height of a node is the number of edges from the node to the deepest leaf (ie. the longest path from the node to a leaf node).
 
 Depth of a Node:
 - The depth of a node is the number of edges from the root to the node.
 
 Height of a Tree:
- The height of a Tree is the height of the root node or the depth of the deepest node.
 
 Degree of a Node:
 - The degree of a node is the total number of branches of that node.
 
 Forest:
 - A collection of disjoint trees is called a forest.
 
 
 Types of Tree:
 ----------------
 - Binary Tree
 - Binary Search Tree
 - AVL Tree
 - B-Tree
 
 Basic Operations Of Tree Data Structure:
 ----------------------------------------
 - Create: create a tree in the data structure.
 - Insert: Inserts data in a tree.
 - Search: Searches specific data in a tree to check whether it is present or not.
 - Traversal:
    - Depth-First-Search Traversal
    - Breadth-First-Search Traversal
 
 Applications:
 --------------
 - Binary Search Trees(BSTs) are used to quickly check whether an element is present in a set or not.
 - Heap is a kind of tree that is used for heap sort.
 - A modified version of a tree called Tries is used in modern routers to store routing information.
 - Most popular databases use B-Trees and T-Trees, which are variants of the tree structure we learned above to store their data
 - Compilers use a syntax tree to validate the syntax of every program you write.
 
 Easy Problem On Tree:
 ---------------------
 Inorder Traversal of Binary Tree
 Preorder Traversal of Binary Tree
 Postorder Traversal of Binary Tree
 Level Order Tree Traversal
 Height or Depth of a Binary Tree
 
 Medium Problem On Tree:
 -------------------------------------
 Connect nodes at same level
 Nodes at given distance in a Binary Tree
 Binary Tree to Doubly Linked List
 Maximum sum path between two leaf
 K-Sum Paths
 Boundary Traversal
 
*/

final class Tree<T> {
    
    var value: T
    private(set) var children: [Tree<T>]
    
    var count: Int {
        1 + children.reduce(0) { $0 + $1.count }
    }
    
    init(_ value: T, children: [Tree<T>] = []) {
        self.value = value
        self.children = children
    }
    
    init(_ value: T, @TreeBuilder builder: () -> [Tree]) {
        self.value = value
        self.children = builder()
    }
    
    func add(child: Tree<T>) {
        children.append(child)
    }
}

// Conditional confirmance to protocols
extension Tree: Equatable where T: Equatable {
    
    static func == (lhs: Tree<T>, rhs: Tree<T>) -> Bool {
        lhs.value == rhs.value && lhs.children == rhs.children
    }
}

extension Tree: Hashable where T: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(value)
        hasher.combine(children)
    }
}

extension Tree: Codable where T: Codable { }

extension Tree where T: Equatable {
    
    func find(value: T) -> Tree? {
        if self.value == value {
            return self
        }
        
        for child in children {
            if let match = child.find(value: value) {
                return match
            }
        }
        
        return nil
    }
}

@resultBuilder
struct TreeBuilder {
    static func buildBlock<T>(_ components: Tree<T>...) -> [Tree<T>] {
        components
    }
}
