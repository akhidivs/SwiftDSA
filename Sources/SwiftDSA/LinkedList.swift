//
//  LinkedList.swift
//  SwiftDSA
//
//  Created by Akhilesh Mishra on 20/03/25.
//

import Foundation

// ********************
// *** LINKED LIST ****
// ********************
/*
 
 Linked List is a linear data structure, in which elements are not stored at a contiguous location, rather they are linked using pointers. Linked List forms a series of connected nodes, where each node stores the data and the address of the next node.
 
 You have to start somewhere, so we give the address of the first node a special name called HEAD.
 Also, the last node in the linked list can be identified because its next portion points to NULL.
 Linked lists can be of multiple types: singly, doubly, and circular linked list.
 
 The power of a linked list comes from the ability to break the chain and rejoin it. E.g. if you wanted to put an element 4 between 1 and 2, the steps would be:

 - Create a new struct node and allocate memory to it.
 - Add its data value as 4
 - Point its next pointer to the struct node containing 2 as the data value
 - Change the next pointer of "1" to the node we just created.
 - Doing something similar in an array would have required shifting the positions of all the subsequent elements.
 
 Linked List Complexity:
 ------------------------
 Time Complexity
                    Worst case    Average Case
 Search                 O(n)         O(n)
 Insert                 O(1)         O(1)
 Deletion               O(1)         O(1)
 
 Space Complexity: O(n)
 
 Linked List Applications:
 -------------------------
 - Linked Lists can be used to implement stacks, queue, deque, sparse matrices and adjacency list representation of graphs.
 - Dynamic memory allocation in operating systems and compilers (linked list of free blocks).
 - Manipulation of polynomials
 - Arithmetic operations on long integers.
 - In operating systems, they can be used in Memory management, process scheduling (for example circular linked list for round robin scheduling) and file system.
 - Algorithms that need to frequently insert or delete items from large collections of data.
 - LRU cache, which uses a doubly linked list to keep track of the most recently used items in a cache.
 
 Applications of Linked Lists in real world:
 --------------------------------------------
 - The list of songs in the music player are linked to the previous and next songs.
 - In a web browser, previous and next web page URLs can be linked through the previous and next buttons (Doubly Linked List)
 - In image viewer, the previous and next images can be linked with the help of the previous and next buttons (Doubly Linked List)
 - Circular Linked Lists can be used to implement things in round manner where we go to every element one by one.
 - Linked List are preferred over arrays for implementations of Queue and Deque data structures because of fast deletions (or insertions) from the front of the linked lists.
 
 Operations of Linked Lists:
 ---------------------------
 Length of Linked List
 Print Linked List
 Linked List Insertion
 Search in a Linked List
 Deleting a given key
 Deleting at given position
 Delete a Linked List
 Nth Node from Start
 Nth Node from End
 Size of Doubly Linked List
 
 
 Easy Problems on Linked List:
 -----------------------------
 Remove every k-th node
 Middle of a Linked List
 Count Occurrences in a Linked List
 Circular Linked List Traversal
 Check if Circular
 Count Nodes in Circular List
 Deletion from a Circular Linked List
 Singly to circular Conversion
 Exchange first and last nodes in Circular
 Delete in a Doubly Linked List
 Reverse a Singly Linked List
 Reverse a Doubly Linked List
 
 Medium Problems on Linked List:
 -------------------------------
 Swap Nodes in Pairs
 Detect loop in a linked list
 Length of loop in linked list
 Design Browser History
 Remove duplicates from a sorted linked list
 Remove Duplicates from an Unsorted Linked List
 Intersection of two Sorted Linked Lists
 Partition a List
 QuickSort on Singly Linked List
 Split a Circular Linked List into two halves
 Merge Two Sorted Linked Lists
 Union and Intersection
 Merge Sort for Doubly Linked List
 Pairs with Sum in doubly linked list
 Insert in sorted way in doubly linked list
 Remove duplicates from an unsorted DLL
 Rotate a Linked List
 Rotate Doubly linked list by N nodes
 Delete a node with only its pointer given
 Segregate even and odd nodes
 
 Hard Problems on Linked List:
 ------------------------------
 Merge K Sorted Lists
 Intersection point of two Linked Lists.
 Implement LRU Cache
 Josephus Circle using circular linked list
 The Great Tree-List Recursion Problem.
 Clone a linked list with random pointer
 Binary Tree to Doubly Linked List | Set
 Reverse a Singly Linked List in Groups
 Reverse a Doubly Linked List in Groups
 Sublist Search (Search a linked list in another list)
 Construct a linked list from 2D matrix
 Rotate Linked List block wise
 Multiply two numbers represented by Lists
 Delete N nodes after M nodes
 
 
 */

public class Node<T: Equatable> {
  
    public var next: Node?
    public var data: T
  
    public init(data: T) {
        self.data = data
    }
  
}

public final class LinkedList<T: Equatable> {
  
    public var head: Node<T>?
  
    public init(head: Node<T>?) {
        self.head = head
    }
    
    public init(elements: [T]) {
        self.head = Node(data: elements[0])
        for i in 1..<elements.count {
            self.append(data: elements[i])
        }
    }
  
  //MARK: append method adds element to the end of linked list
    public func append(data: T) {
    
        guard let head = self.head else {
            self.head = Node(data: data)
            return
        }
    
        var current: Node = head
        while (current.next != nil) {
            current = current.next!
        }
        current.next = Node(data: data)
    }
  
    //MARK: prepend method adds element in the begining of linked list
    public func prepend(data: T) {
    
        guard let head = self.head else {
            self.head = Node(data: data)
            return
        }
    
        let newHead = Node(data: data)
        newHead.next = head
        self.head = newHead
    
    }
  
    //MARK: delete node with given data
    public func delete(with data: T) {
    
        guard let head = self.head else {
            return
        }
    
        if head.data == data {
            self.head = head.next
            return
        }
    
        var current: Node = head
        while (current.next != nil) {
            if current.next?.data == data {
                current.next = current.next?.next
                return
            }
            current = current.next!
        }
    }
  
  
    //MARK: Utilities Method
    public func show() {

        guard let head = self.head else {
          print("The Linked List is empty. Please create one.")
          return
        }

        var current: Node = head
        print("\n*** Linked List ***")

        while (current.next != nil) {
          print("-->\(current.data)", terminator: "")
          current = current.next!
        }
        print("-->\(current.data)", terminator: "")

    }
  
}
