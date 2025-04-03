//
//  Stack.swift
//  SwiftDSA
//
//  Created by Akhilesh Mishra on 20/03/25.
//

import Foundation

// ********************
// ****** STACK *******
// ********************
/*
 
 Stack is a linear data structure that follows LIFO (Last In First Out) Principle, the last element inserted is the first to be popped out. It means both insertion and deletion operations happen at one end only.
 
 Basic Operations of Stack:
 --------------------------
 - Push: Add an element to the top of a stack
 - Pop: Remove an element from the top of a stack
 - IsEmpty: Check if the stack is empty
 - IsFull: Check if the stack is full
 - Peek: Get the value of the top element without removing it
 
 Complexity Analysis of Operations on Stack Data Structure:
 ----------------------------------------------------------
 Operations                 Time Complexity                 Space Complexity
------------                ---------------                 ----------------
 push()                         O(1)                                O(1)
 pop()                          O(1)                                O(1)
 top() or peek()                O(1)                                O(1)
 isEmpty()                      O(1)                                O(1)
 isFull()                       O(1)                                O(1)
 
 Applications of Stacks:
 -----------------------
 - Function calls: Stacks are used to keep track of the return addresses of function calls, allowing the program to return to the correct location after a function has finished executing.
 - Recursion: Stacks are used to store the local variables and return addresses of recursive function calls, allowing the program to keep track of the current state of the recursion.
 - Expression evaluation: Stacks are used to evaluate expressions in postfix notation (Reverse Polish Notation).
 - Syntax parsing: Stacks are used to check the validity of syntax in programming languages and other formal languages.
 - Memory management: Stacks are used to allocate and manage memory in some operating systems and programming languages.
 - Used to solve popular problems like Next Greater, Previous Greater, Next Smaller, Previous Smaller, Largest Area in a Histogram and Stock Span Problems.
 
 Advantages of Stacks:
 ---------------------
 - Simplicity: Stacks are a simple and easy-to-understand data structure, making them suitable for a wide range of applications.
 - Efficiency: Push and pop operations on a stack can be performed in constant time (O(1)), providing efficient access to data.
 - Last-in, First-out (LIFO): Stacks follow the LIFO principle, ensuring that the last element added to the stack is the first one removed. This behavior is useful in many scenarios, such as function calls and expression evaluation.
 - Limited memory usage: Stacks only need to store the elements that have been pushed onto them, making them memory-efficient compared to other data structures.
 
 Disadvantages of Stacks:
 ------------------------
 - Limited access: Elements in a stack can only be accessed from the top, making it difficult to retrieve or modify elements in the middle of the stack.
 - Potential for overflow: If more elements are pushed onto a stack than it can hold, an overflow error will occur, resulting in a loss of data.
 - Not suitable for random access: Stacks do not allow for random access to elements, making them unsuitable for applications where elements need to be accessed in a specific order.
 - Limited capacity: Stacks have a fixed capacity, which can be a limitation if the number of elements that need to be stored is unknown or highly variable.
 
 Easy Problems on Stack Data Structures:
 ---------------------------------------
 The Celebrity Problem
 Implement Queue using Stacks
 Implement two stacks in an array
 Implement Stack using Queues
 Stack using priority queue or heap
 Stack using single queue
 Infix to Postfix
 Prefix to Infix
 Prefix to Postfix
 Postfix to Prefix
 Postfix to Infix
 Infix To Prefix
 Check for balanced parentheses
 Arithmetic Expression Evalution
 Evaluation of Postfix Expression
 Reverse a stack using recursion
 Reverse Words
 Reverse a string using stack
 Reversing a Queue
 Reversing the first K of a Queue
 A Data Structure with O(1) Operations
 
 Medium Problems on Stack Data Structures:
 -----------------------------------------
 k Stacks in an Array
 Mergable Stack
 Previous Smaller Element
 Next Greater Element
 Stock Span Problem
 Buildings Facing Sun
 Next Smaller of next Greater in an array
 Next Greater Frequency Element
 Max product of indexes of greater on left and right
 Iterative Tower of Hanoi
 Sort a stack using a temporary stack
 Reverse a stack without using extra space in O(n)
 Delete middle of a stack
 Check if a queue can be sorted into another queue
 Check if an array is stack sortable
 Iterative Postorder Traversal | Set 1 (Using Two Stacks)
 Index of closing bracket for a given opening bracket
 Max Diff between nearest left and right smaller elements
 Delete consecutive same words in a sequence
 
 Hard Problems on Stack Data Structures:
 ---------------------------------------
 Largest Rectangular Area in a Histogram
 Sum of Max of all Subarrays
 Max of Mins of every window size
 Design a stack that supports getMin()
 Design a stack with max frequency operations
 Print next greater number of Q queries
 Length of the longest valid substring
 Iterative Postorder Traversal | Set 2 (Using One Stack)
 Print ancestors of a given binary tree node without recursion
 Expression contains redundant bracket or not
 Find if an expression has duplicate parenthesis
 Iterative method to find ancestors in a binary tree
 Stack Permutations
 Remove brackets from an algebraic string containing + and – operators
 Range Queries for Longest Correct Bracket Subsequence

 
 */

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

extension Stack: CustomStringConvertible {
    
    public var description: String {

        var current = top
        var result = ""
        let topDivider = "---Stack---\n"
        let bottomDivider = "\n-----------\n"
        
        while current != nil {
            result += "\(String(describing: current?.data))\n"
        }
        return topDivider + result + bottomDivider
    }
}
