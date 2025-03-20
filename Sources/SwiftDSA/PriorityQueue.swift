//
//  PriorityQueue.swift
//  SwiftDSA
//
//  Created by Akhilesh Mishra on 20/03/25.
//

import Foundation

// PRIORITY QUEUE USING BINARY HEAP
/*
 A Priority Queue is a type of queue that arranges elements based on their priority values.
 - Each element has a priority associated. When we add an item, it is inserted at a position based on it's priority.
 - Elements with higher priority are typically retrieved or removed before elements with lower priority.
 - Binary heap is the most common method to implement a priority queue. In binary heaps, we have easy access to min (in min heap) or max (in max heap) and binary heap being a complete binary tree are easily implemented using array.
 - Priority Queue is used in algorithms such as Djikstra's algorithm, Prim's algorithm and Huffman Coding.
 
 Types:
 -------
 1. Ascending Order Priority Queue: Elements with lower value have higher priority. The root of the heap is the smallest element.  For example, with elements 4,6,8,9 and 10, 4 will be dequed first since it has the smallest value
 
 2. Descending Order Priority Queue: Elements with higher value have higher priority. The root of the heap is the highest element and it is dequed first.
 
 
 Example:
 ----------
 
 Input: 1, 5, 3, 2, 6 (Higher number has higher priority)
 
 enqueue(1): 1
 enqueue(5): 5, 1
 enqueue(3): 5, 3, 1
 enqueue(2): 5, 3, 2, 1
 enqueue(6): 6, 5. 3, 2, 1
 
 dequeue: 5, 3, 2, 1
 dequeue: 3, 2, 1
 dequeue: 2, 1
 dequeue: 1
 dequeue:
 
 Advantages of Priority Queue:
 -----------------------------
 Quick access to the highest priority element, as elements are ordered by priority.
 Dynamic reordering when priority values change.
 Improve efficiency in algorithms like Dijkstra’s and A* for pathfinding.
 Used in real-time systems for fast retrieval of high-priority elements.
 
 Disadvantages of Priority Queue:
 --------------------------------
 High complexity: More difficult to implement and maintain than simpler structures like arrays and linked lists.
 High memory consumption: Storing priority values can use more memory, which is a concern in resource-limited systems.
 Not always the most efficient: Other structures, like heaps or binary search trees, may be more efficient for certain operations.
 Less predictable: Element retrieval order can be less predictable due to dynamic priority-based ordering.
 
 Applications of Priority Queue:
 -------------------------------
 CPU Scheduling
 Graph algorithms like Dijkstra’s shortest path algorithm, Prim’s Minimum Spanning Tree, etc.
 All queue applications where priority is involved.
 Data compression in Huffman code
 Event-driven simulation such as customers waiting in a queue.
 Finding Kth largest/smallest element.
 
 */

public struct PriorityQueue<Element> {
    
    var elements: [Element]
    let priorityFunction: (Element, Element) -> Bool
    
    public init(elements: [Element] = [], priorityFunction: @escaping (Element, Element) -> Bool) {
      self.elements = elements
      self.priorityFunction = priorityFunction
      buildHeap()
    }

    mutating func buildHeap() {
      for index in (0 ..< count / 2).reversed() {
        shiftDown(elementAtIndex: index)
      }
    }
    
    public var isEmpty: Bool {
        return elements.isEmpty
    }
    
    public var count: Int {
        return elements.count
    }
    
    public func peek() -> Element? {
        return elements.first
    }
    
    public func isRoot(_ index: Int) -> Bool {
        return index == 0
    }
    
    func leftChildIndex(of index: Int) -> Int {
        return (2 * index) + 1
    }
    
    func rightChildIndex(of index: Int) -> Int {
        return (2 * index) + 2
    }
    
    func parentIndex(of index: Int) -> Int {
        return (index - 1)/2
    }
    
    func isHigherPriority(at firstIndex: Int, than secondIndex: Int) -> Bool {
        return priorityFunction(elements[firstIndex], elements[secondIndex])
    }
    
    func highestPriorityIndex(of parentIndex: Int, and childIndex: Int) -> Int {
        guard childIndex < count && isHigherPriority(at: childIndex, than: parentIndex) else {
            return parentIndex
        }
        return childIndex
    }
    
    func highestPriorityIndex(for parentIndex: Int) -> Int {
        return highestPriorityIndex(of: highestPriorityIndex(of: parentIndex, and: leftChildIndex(of: parentIndex)), and: rightChildIndex(of: parentIndex))
    }
    
    mutating func swapElement(at firstIndex: Int, with secondIndex: Int) {
        guard firstIndex != secondIndex else {
            return
        }
        elements.swapAt(firstIndex, secondIndex)
    }
    
    public mutating func enqueue(_ element: Element) {
        elements.append(element)
        shiftUp(elementAtIndex: count - 1)
    }
    
    mutating func shiftUp(elementAtIndex index: Int) {
        let parent = parentIndex(of: index)
        guard !isRoot(index), isHigherPriority(at: index, than: parent) else {
            return
        }
        swapElement(at: index, with: parent)
        shiftUp(elementAtIndex: parent)
    }
    
    public mutating func dequeue() -> Element? {
        guard !isEmpty else {
            return nil
        }
        swapElement(at: 0, with: count - 1)
        let element = elements.removeLast()
        if !isEmpty {
            shiftDown(elementAtIndex: 0)
        }
        return element
    }
    
    mutating func shiftDown(elementAtIndex index: Int) {
        let childIndex = highestPriorityIndex(for: index)
        if index == childIndex { return }
        swapElement(at: index, with: childIndex)
        shiftDown(elementAtIndex: childIndex)
    }
    
}
