//
//  Queue.swift
//  SwiftDSA
//
//  Created by Akhilesh Mishra on 20/03/25.
//

import Foundation

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
