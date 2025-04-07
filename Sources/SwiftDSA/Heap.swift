//
//  Heap.swift
//  SwiftDSA
//
//  Created by Akhilesh Mishra on 20/03/25.
//

import Foundation
 
 // ********************
 // ******* HEAP *******
 // ********************
 /*
 
 A Heap is a complete binary tree data structure that satisfies the heap property: for every node, the value of its children is greater than or equal to its own value. Heaps are usually used to implement priority queues, where the smallest (or largest) element is always at the root of the tree.
 
 A complete binary tree is a special type of binary tree where all the levels of the tree are filled completely except the lowest level nodes which are filled from as left as possible.
 
                2                                                       2
               /                                                       / \
              3                                                       3   4
             / \                                                     / \
            5   7                                                   5   6
 (Not a complete Binary Tree)                                  (Complete Binary Tree)
 
 A binary tree has a limitation as any node of the tree has at most two children: a left and a right child.
 
 
        2                                                                8
      /   \                                                            /   \
     3     4                                                          7     6
    / \                                                              / \   / \
   5   7                                                            5   4 3   2
 
    Min Heap                                                          Max Heap
 (root node must be the smallest                               (root node must be the greatest
 among all its descendant nodes)                                among all its descendant nodes)
 
 
 
 Operations of Heap Data Structure:
 ---------------------------------
 Heapify: a process of creating a heap from an array.
 Insertion: process to insert an element in existing heap, time complexity O(log N).
 Deletion: deleting the top element of the heap or the highest priority element, and then organizing the heap and returning the element with time complexity O(log N).
 Peek: to check or find the most prior element in the heap, (max or min element for max and min heap).
 
 
 Application of Heap Data Structure
 -----------------------------------
 Priority Queues
 Sorting Algorithms
 Graphs Algorithm
 Lossless Data Comression
 Medical Application
 Load Balancing
 Resource Allocation
 Job Scheduling
 Order Statistics
 
 Easy Problems
 --------------
 Check if an array is Heap?
 K’th Smallest & K'th Largest
 Heap Sort
 Heap Sort for Decreasing Order
 Height of a Heap with N Nodes
 
 Medium Problems
 ----------------
 Nearly Sorted Array
 K Largest Elements & K Smallest
 k Closest Elements
 Check if Binary Tree is Heap
 Huffman Coding
 Nodes less than a value in a Min Heap.
 Connect n ropes with minimum cost
 Maximum distincts after removing k elements
 K maximum sum combinations from two arrays
 Median in a stream
 K’th largest in a stream
 Largest triplet product in a stream
 k most frequent
 Sort by Frequency
 Min Heap to Max Heap
 Check for Min-Heap from Level Order
 
 Hard Problems
 --------------
 K-th Largest Sum Subarray
 Find K Closest Points to the Origin
 Merge k sorted arrays
 Merge K Sorted Linked Lists
 Prim's Minimum Spanning Tree
 Dijkstra's Shortest Path
 Sort numbers stored on different machines
 Smallest Derangement of Sequence
 Largest Derangement of a Sequence
 Convert BST to Min Heap
 Merge two binary Max Heaps
 Minimum product of k integers
 Leaf starting point in a Binary Heap
 Rearrange characters such that no two same adjacent
 Sum of all between k1’th and k2’th smallest
 Min sum of two formed from given digits
 A data structure with min and max
 
 
 */


public class MaxHeap<T: Comparable> {
    
    public var heapArray: [T] = []
    
    public init(elements: [T]) {
        
        for element in elements {
            insert(element)
        }
    }
    
    // insert a new element into the heap O(n)
    public func insert(_ element: T) {
        heapArray.append(element)
        
        var currentIndex = heapArray.count - 1
        
        while(currentIndex > 0 && heapArray[currentIndex] > heapArray[(currentIndex - 1)/2]) {
            heapArray.swapAt(currentIndex, (currentIndex - 1)/2)
            currentIndex = (currentIndex - 1)/2
        }
    }
    
    // remove and return the top element of the heap O(n)
    public func delete() -> T? {
        
        guard !heapArray.isEmpty else {
            return nil
        }
        
        let topElement = heapArray.first
        
        if heapArray.count == 1 {
            heapArray.removeFirst()
        } else {
            
            // replace the top element with the last element in the heap
            heapArray[0] = heapArray.removeLast()
            var currentIndex = 0
            
            // bubble down the element until the heap property is restored
            while true {
                
                let leftChildIndex = 2*currentIndex + 1
                let rightChildIndex = 2*currentIndex + 2
                
                // determine the index of the larger child
                var maxIndex = currentIndex
                if leftChildIndex < heapArray.count && heapArray[leftChildIndex] > heapArray[maxIndex] {
                    maxIndex = leftChildIndex
                }
                if rightChildIndex < heapArray.count && heapArray[rightChildIndex] > heapArray[maxIndex] {
                    maxIndex = rightChildIndex
                }
                
                // if the heap property is restored, break out of the loop
                if maxIndex == currentIndex { break }
                
                // otherwise swap the element with its larger child
                heapArray.swapAt(currentIndex, maxIndex)
                currentIndex = maxIndex
            }
        }
            
        return topElement
    }
    
    // get the top element of the heap without removing it O(1)
    func peek() -> T? {
        return heapArray.first
    }
    
    //check if the heap is empty
    var isEmpty: Bool {
        return heapArray.isEmpty
    }
}

extension MaxHeap {
    
    // get Index
    func leftChildIndex(_ parentIndex: Int) -> Int {
        return 2 * parentIndex + 1
    }
    
    func rightChildIndex(_ parentIndex: Int) -> Int {
        return 2 * parentIndex + 2
    }
    
    func getParentIndex(_ childIndex: Int) -> Int {
        return (childIndex - 1)/2
    }
}
