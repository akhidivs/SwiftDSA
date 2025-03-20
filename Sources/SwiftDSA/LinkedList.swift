//
//  LinkedList.swift
//  SwiftDSA
//
//  Created by Akhilesh Mishra on 20/03/25.
//

import Foundation

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
