//
//  Stack.swift
//  AlgorithmsDataStructures
//
//  Created by Adriano Gaiotto de Oliveira on 2021-03-17.
//

import Foundation


public final class Stack<E> : Sequence {
    
    /// beginning of stack
    private var first: Node<E>? = nil
    
    /// number of elements in stack
    private(set) var count: Int = 0
    
    /// Initializes an empty stack.
    public init() {}
    
    
    /// add an item
    /// - Parameter item: the item to add to this stack
    public func push(item: E) {
        let oldFirst = first
        first = Node<E>(item: item, next: oldFirst)
        count += 1
    }
    
    /// removes and returns the item least recently added to the stack
    /// - Returns: the item removed of this stack
    public func pop() -> E? {
        if first != nil {
            let temp = first
            first = first?.next
            count -= 1
            return temp?.item
        }
        return nil
    }
    
    /// returns the item least recently added to the stack
    /// - Returns: the item least recently added to this stack
    public func peek() -> E? {
        if first != nil {
            return first?.item
        }
        return nil
    }
    
    /// verify if this queue is empty?
    /// - Returns: true or false
    public func isEmpty() -> Bool {
        return first == nil
    }
    
    public func makeIterator() -> StackIterator<E> {
        return StackIterator<E>(first)
    }
}

extension Stack {
    /// helper linked list node class
    fileprivate class Node<E> {
      fileprivate var item: E
      fileprivate var next: Node<E>?
      fileprivate init(item: E, next: Node<E>? = nil) {
        self.item = item
        self.next = next
      }
    }
}

extension Stack: CustomStringConvertible {
    public var description: String {
        let desc = self.reduce(into: "") { $0 += ",\($1)"}
        return "[\(desc[1,desc.count])]"
    }
}

extension Stack {
    public struct StackIterator<E> : IteratorProtocol {
        public typealias Element = E
        
        private var current: Node<E>?
        
        fileprivate init(_ first: Node<E>?) {
          self.current = first
        }
        
        public mutating func next() -> E? {
          if let item = current?.item {
            current = current?.next
            return item
          }
          return nil
        }
    }
    
}

