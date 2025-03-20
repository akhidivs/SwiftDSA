//
//  Tree.swift
//  SwiftDSA
//
//  Created by Akhilesh Mishra on 20/03/25.
//

import Foundation

final class Tree<T> {
    
    var value: T
    private(set) var children: [Tree<T>]
    
    var count: Int {
        1 + children.reduce(0) { $0 + $1.count }
    }
    
    init(_ value: T, children: [Tree<T>] = []) {
        self.value = value
        self.children = children
    }
    
    init(_ value: T, @TreeBuilder builder: () -> [Tree]) {
        self.value = value
        self.children = builder()
    }
    
    func add(child: Tree<T>) {
        children.append(child)
    }
}

// Conditional confirmance to protocols
extension Tree: Equatable where T: Equatable {
    
    static func == (lhs: Tree<T>, rhs: Tree<T>) -> Bool {
        lhs.value == rhs.value && lhs.children == rhs.children
    }
}
extension Tree: Hashable where T: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(value)
        hasher.combine(children)
    }
}

extension Tree: Codable where T: Codable { }

extension Tree where T: Equatable {
    
    func find(value: T) -> Tree? {
        if self.value == value {
            return self
        }
        
        for child in children {
            if let match = child.find(value: value) {
                return match
            }
        }
        
        return nil
    }
}

@resultBuilder
struct TreeBuilder {
    static func buildBlock<T>(_ components: Tree<T>...) -> [Tree<T>] {
        components
    }
}
