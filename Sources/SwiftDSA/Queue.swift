//
//  Queue.swift
//  SwiftDSA
//
//  Created by Akhilesh Mishra on 20/03/25.
//

import Foundation

// ********************
// ****** QUEUE *******
// ********************
/*
 
 Queue is a linear data structure that follows FIFO (First In First Out) Principle, so the first element inserted is the first to be popped out.

 FIFO Principle in Queue:
 ------------------------
 FIFO Principle states that the first element added to the Queue will be the first one to be removed or processed. So, Queue is like a line of people waiting to purchase tickets, where the first person in line is the first person served. (i.e. First Come First Serve).
 
 Basic Terminologies of Queue:
 -----------------------------
 - Front: Position of the entry in a queue ready to be served, that is, the first entry that will be removed from the queue, is called the front of the queue. It is also referred as the head of the queue.
 - Rear: Position of the last entry in the queue, that is, the one most recently added, is called the rear of the queue. It is also referred as the tail of the queue.
 - Size: Size refers to the current number of elements in the queue.
 - Capacity: Capacity refers to the maximum number of elements the queue can hold.
 
 Queue Operations:
 ------------------
 - Enqueue: Adds an element to the end (rear) of the queue. If the queue is full, an overflow error occurs.
 - Dequeue: Removes the element from the front of the queue. If the queue is empty, an underflow error occurs.
 - Peek/Front: Returns the element at the front without removing it.
 - Size: Returns the number of elements in the queue.
 - isEmpty: Returns true if the queue is empty, otherwise false.
 - isFull: Returns true if the queue is full, otherwise false.
 
 Complexity Analysis of Operations on Queue:
 -------------------------------------------
 Operations                 Time Complexity                 Space Complexity
-----------                 ---------------                 -----------------
 enqueue                        O(1)                            O(1)
 dequeue                        O(1)                            O(1)
 front                          O(1)                            O(1)
 size                           O(1)                            O(1)
 isEmpty                        O(1)                            O(1)
 isFull                         O(1)                            O(1)
 
 
 Types of Queues:
 ----------------
 - Simple Queue: In a simple queue, insertion takes place at the rear and removal occurs at the front. It strictly follows the FIFO (First in First out) rule.
 - Double-Ended Queue (Deque): In a double-ended queue the insertion and deletion operations, both can be performed from both ends. They are of two types:
 - Circular Queue: In a circular queue, the last element points to the first element making a circular link.
 - Priority Queue: A priority queue is a special queue where the elements are accessed based on the priority assigned to them.
 
 Applications of Queue:
 ----------------------
 - CPU scheduling, Disk Scheduling
 - When data is transferred asynchronously between two processes.The queue is used for synchronization. For example: IO Buffers, pipes, file IO, etc
 - Handling of interrupts in real-time systems.
 - Call Center phone systems use Queues to hold people calling them in order.
 
 Easy Problems on Queue Data Structure:
 --------------------------------------
 Implement Stack using Queues
 Detect cycle in an undirected graph using BFS
 Breadth First Search or BFS for a Graph
 Traversing directory in Java using BFS
 Vertical order traversal of Binary Tree using Map
 Print Right View of a Binary Tree
 Find Minimum Depth of a Binary Tree
 Check whether a given graph is Bipartite or not
 
 Medium Problems on Queue Data Structure:
 ----------------------------------------
 Flatten a multilevel linked list
 Level with maximum number of nodes
 Find if there is a path between two vertices in a directed graph
 Print all nodes between two given levels in Binary Tree
 Find next right node of a given key
 Minimum steps to reach target by a Knight
 Islands in a graph using BFS
 Level order traversal line by line | Set 3 (Using One Queue)
 Find the first non-repeating character from a stream of characters
 
 Hard Problems on Queue Data Structure:
 --------------------------------------
 Sliding Window Maximum (Maximum of all subarrays of size K)
 Flood Fill Algorithm
 Minimum time required to rot all oranges
 Shortest path in a Binary Maze
 An Interesting Method to Generate Binary Numbers from 1 to n
 Maximum cost path from source node to destination
 Shortest distance between two cells in a matrix or grid
 Snake and Ladder Problem
 Find shortest safe route in a path with landmines
 Count all possible walks from a source to a destination with exactly K edges
 Minimum Cost of Simple Path between two nodes in a directed and weighted graph
 Minimum Cost Path in a directed graph via given set of intermediate nodes
 Find the first circular tour that visits all petrol pumps
 
 
 */

private final class QueueNode<T> {
    
  var data: T
  var next: QueueNode?
  init(data: T) {
    self.data = data
  }
}

public final class Queue<T: Equatable> {
  
  private var head: QueueNode<T>?
  private var tail: QueueNode<T>?
  
  public func isEmpty() -> Bool {
    return head == nil
  }
  
  public func peek() -> T? {
    return head?.data
  }
  
  public func enque(_ data: T) {
    let newNode = QueueNode(data: data)
    tail?.next = newNode
    tail = newNode
    if (head == nil) {
      head = newNode
    }
  }
  
  public func deque() -> T? {
    let data = head?.data
    head = head?.next
    if head == nil {
      tail = nil
    }
    return data
  }
  
}
