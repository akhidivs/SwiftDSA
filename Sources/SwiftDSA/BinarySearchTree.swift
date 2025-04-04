//
//  BinarySearchTree.swift
//  SwiftDSA
//
//  Created by Akhilesh Mishra on 20/03/25.
//

import Foundation

// *********************
// **** BINARY TREE ****
// *********************
/*
 
 Binary Tree is a non-linear and hierarchical data structure where each node has at most two children referred to as the left child and the right child.  The
 topmost node in a binary tree is called the root, and the bottom-most nodes are called leaves.
 
 Representation of Binary Tree:
 ------------------------------
 Each node in a Binary Tree has three parts:

 Data
 Pointer to the left child
 Pointer to the right child
 
 
 Properties of Binary Tree:
 ------------------------------
 - The maximum number of nodes at level L of a binary tree is 2^L
 - The maximum number of nodes in a binary tree of height H is 2^H – 1
 - In a Binary Tree with N nodes, the minimum possible height or the minimum number of levels is Log2(N+1)
 - A Binary Tree with L leaves has at least | Log2L |+ 1   levels
 - In a Binary tree where every node has 0 or 2 children, the number of leaf nodes is always one more than nodes with two children
 - In a non-empty binary tree, if n is the total number of nodes and e is the total number of edges, then e = n-1
 
 Types of Binary Tree:
 ----------------------
 Binary Tree can be classified into multiples types based on multiple factors:

 On the basis of Number of Children:
 - Full Binary Tree
 - Degenerate Binary Tree
 - Skewed Binary Trees
 
 On the basis of Completion of Levels:
 - Complete Binary Tree
 - Perfect Binary Tree
 - Balanced Binary Tree
 
 On the basis of Node Values:
 - Binary Search Tree
 - AVL Tree
 - Red Black Tree
 - B Tree
 - B+ Tree
 - Segment Tree
 
 
 Operations On Binary Tree:
 --------------------------
 1. Traversal in Binary Tree
 
 Traversal in Binary Tree involves visiting all the nodes of the binary tree. Tree Traversal algorithms can be classified broadly into two categories, DFS and BFS:

 => Depth-First Search (DFS) algorithms: DFS explores as far down a branch as possible before backtracking. It is implemented using recursion. The main traversal methods in DFS for binary trees are:

 - Preorder Traversal (current-left-right): Visits the node first, then left subtree, then right subtree.
 - Inorder Traversal (left-current-right): Visits left subtree, then the node, then the right subtree.
 - Postorder Traversal (left-right-current): Visits left subtree, then right subtree, then the node.
 
 => Breadth-First Search (BFS) algorithms: BFS explores all nodes at the present depth before moving on to nodes at the next depth level. It is typically implemented using a queue. BFS in a binary tree is commonly referred to as Level Order Traversal.
 
 2. Insertion in Binary Tree
 
 Inserting elements means add a new node into the binary tree. As we know that there is no such ordering of elements in the binary tree, So we do not have to worry about the ordering of node in the binary tree. We would first creates a root node in case of empty tree. Then subsequent insertions involve iteratively searching for an empty place at each level of the tree. When an empty left or right child is found then new node is inserted there. By convention, insertion always starts with the left child node.
 
 
 ***** BINARY SEARCH TREE *****
 A binary search tree is a special kind of binary tree ( a tree in which each node has at most two children) that performs insertion and deletion such that tree is always sorted.
 
 Basic Operations on BST:
 ------------------------
 - Insertion in BST
 - Searching in BST
 - Deletion in BST
 - BST Traversals
 - Minimum in BST
 - Maximum in BST
 - Floor in BST
 - Ceil in BST
 - Inorder Successor in BST
 - Inorder Predecessor in BST
 - Handling duplicates in BST
 
 
 Easy Standard Problems on BST:
 ------------------------------
 Second largest in BST
 Sum of k smallest in BST
 BST keys in given Range
 BST to Balanced BST
 Check for BST
 Binary Tree to BST
 Check if array is Inorder of BST
 Sorted Array to Balanced BST
 Check Same BSTs without constructing
 BST to Min Heap
 Add all greater values in a BST
 Check if two BSTs have same elements
 
 Medium Standard Problems on BST:
 --------------------------------
 BST from Preorder
 Sorted Linked List to Balanced BST
 Transform a BST to greater sum tree
 BST to a Tree with sum of all smaller keys
 Construct BST from Level Order
 Check if an array can represent Level Order of BST
 Max Sum with No Two Adjacent in BST
 LCA in a BST
 Distance between two nodes of a BST
 k-th Smallest in BST
 Largest BST in a Binary Tree | Set 2
 Remove all leaves from BST
 2 sum in BST
 Max between two nodes of BST
 Largest BST Subtree
 2 Sum in a Balanced BST
 Two nodes of a BST are swapped, correct it
 Leaf nodes from Preorder of a BST
 
 Hard Standard Problems on BST:
 -------------------------------
 Construct all possible BSTs for keys 1 to N
 In-place Convert BST into a Min-Heap
 Check given array of size n can represent BST of n levels or not
 Merge two BSTs with limited extra space
 K’th Largest Element in BST when modification to BST is not allowed
 Check if given sorted sub-sequence exists in binary search tree
 Maximum Unique Element in every subarray of size K
 Count pairs from two BSTs whose sum is equal to a given value x
 Find if there is a triplet in a Balanced BST that adds to zero
 Replace every element with the least greater element on its right
 Leaf nodes from Preorder of a Binary Search Tree
 Minimum Possible value of |ai + aj – k| for given array and k.
 Special two digit numbers in a Binary Search Tree
 Merge Two Balanced Binary Search Trees
 
 
 */

public final class BinaryTreeNode<T: Comparable> {
    
    public var value: T
    public var leftChild: BinaryTreeNode<T>?
    public var rightChild: BinaryTreeNode<T>?
    
    public var parent: BinaryTreeNode<T>?
    
    public init(value: T,
                leftChild: BinaryTreeNode<T>? = nil,
                rightChild: BinaryTreeNode<T>? = nil) {
        self.value = value
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
}

public final class BinarySearchTree<T: Comparable> {
    
    public var value: T
    public var leftChild: BinarySearchTree<T>?
    public var rightChild: BinarySearchTree<T>?
    
    public var parent: BinarySearchTree<T>?
    
    public init(value: T,
                leftChild: BinarySearchTree<T>? = nil,
                rightChild: BinarySearchTree<T>? = nil) {
        self.value = value
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
    
    public func insert(value: T) {
        insert(value: value, parent: self)
    }
    
    private func insert(value: T, parent: BinarySearchTree<T>) {
        
        if value < self.value {
            if let left = self.leftChild {
                left.insert(value: value, parent: self)
            } else {
                leftChild = BinarySearchTree(value: value)
            }
        } else {
            if let right = self.rightChild {
                right.insert(value: value, parent: self)
            } else {
                rightChild = BinarySearchTree(value: value)
            }
        }
    }
    
    public func search(for value: T) -> Bool {
        
        if value == self.value { return true }
        
        if value < self.value {
            if let left = leftChild {
                return left.search(for: value)
            }
        } else {
            if let right = rightChild {
                return right.search(for: value)
            }
        }
        
        return false
    }
    
}

extension BinarySearchTree: CustomStringConvertible {
    
    public var description: String {
        var result = ""
        
        if let left  = leftChild {
            result += "\(left.description) <-"
        }
        
        result += "\(value)"
        
        if let right = rightChild {
            result += "-> \(right.description)"
        }
        return result
    }
}


// MARK: Traversal Techniques
extension BinarySearchTree {

    // In-order Traversal
    // Visits the left subtree, current node, and then the right subtree. This traversal yields nodes in ascending order for a
    // Binary Search Tree (BST)
    func inOrderTraversal() {
        self.leftChild?.inOrderTraversal()
        print(self.value, terminator: " ")
        self.rightChild?.inOrderTraversal()
    }

    // Pre-order Traversal
    // Visits the current node before it's left and right subtrees. This traversal is useful for creating a copy of the tree or for
    // prefix expression evaluations
    func preOrderTraversal() {
        print(self.value, terminator: " ")
        self.leftChild?.preOrderTraversal()
        self.rightChild?.preOrderTraversal()
    }

    // Post-order Traversal
    // Visits the left and right subtrees before the current node. This traversal is useful for deleting nodes and evaluating
    // posfix expression evaluations
    func postOrderTraversal() {
        self.leftChild?.postOrderTraversal()
        self.rightChild?.postOrderTraversal()
        print(self.value, terminator: " ")
    }
    
}


