//
//  Stack.swift
//  SwiftDSA
//
//  Created by Akhilesh Mishra on 20/03/25.
//

import Foundation

public class StackNode<T> {
    
  var data: T
  var next: StackNode?
  init(data: T) {
    self.data = data
  }
}

public final class Stack<T: Equatable> {
    
  private var top: StackNode<T>?
  
  public func isEmpty() -> Bool {
    return top == nil
  }
  
  public func peek() -> T? {
    return top?.data
  }
  
  public func push(_ data: T) {
    let newNode = StackNode(data: data)
    newNode.next = top
    top = newNode
  }
  
  public func pop() -> T? {
    let data = top?.data
    top = top?.next
    return data
  }
  
}
