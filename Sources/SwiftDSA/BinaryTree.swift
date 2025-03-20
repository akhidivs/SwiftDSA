//
//  BinaryTree.swift
//  SwiftDSA
//
//  Created by Akhilesh Mishra on 20/03/25.
//

import Foundation

/*
 A Binary Tree is a hierarchical data structure where each node has atmost 2 children referred to as left child and right child.
 */

public final class BinaryTreeNode<T> {
  
  var value: T
  var leftNode: BinaryTreeNode?
  var rightNode: BinaryTreeNode?
  
  init(value: T, leftNode: BinaryTreeNode? = nil, rightNode: BinaryTreeNode? = nil) {
    self.value = value
    self.leftNode = leftNode
    self.rightNode = rightNode
  }
  
}

// MARK: Traversal Techniques

// In-order Traversal
// Visits the left subtree, current node, and then the right subtree. This traversal yields nodes in ascending order for a
// Binary Search Tree (BST)
func inOrderTraversal<T>(_ root: BinaryTreeNode<T>?) {
  guard let node = root else { return }
  inOrderTraversal(node.leftNode)
  print(node.value)
  inOrderTraversal(node.rightNode)
}

// Pre-order Traversal
// Visits the current node before it's left and right subtrees. This traversal is useful for creating a copy of the tree or for
// prefix expression evaluations
func preOrderTraversal<T>(_ root: BinaryTreeNode<T>?) {
  guard let node = root else { return }
  print(node.value)
  preOrderTraversal(node.leftNode)
  preOrderTraversal(node.rightNode)
}

// Post-order Traversal
// Visits the left and right subtrees before the current node. This traversal is useful for deleting nodes and evaluating
// posfix expression evaluations
func postOrderTraversal<T>(_ root: BinaryTreeNode<T>?) {
  guard let node = root else { return }
  postOrderTraversal(node.leftNode)
  postOrderTraversal(node.rightNode)
  print(node.value)
}
