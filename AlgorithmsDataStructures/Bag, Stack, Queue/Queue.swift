//
//  Queue.swift
//  AlgorithmsDataStructures
//
//  Created by Adriano Gaiotto de Oliveira on 2021-03-17.
//

import Foundation

public final class Queue<E> : Sequence {
    
    /// beginning of queue
    private var first: Node<E>? = nil
    
    /// number of items on queue
    private(set) var count: Int = 0
    
    /// Initializes an empty queue.
    public init() {}
    
    /// add an item
    /// - Parameter item: the item to add to this queue
    public func enqueue(item: E) {
        if first != nil {
        var current = first
            while current?.next != nil {current = current?.next}
        current?.next = Node<E>(item: item)
        } else {
            first = Node<E>(item: item)
        }
        count += 1
    }
    
    /// removes and returns the item least recently added to the queue
    /// - Returns: the item removed of this queue
    public func dequeue() -> E? {
        if first != nil {
            let temp = first
            first = first?.next
            count -= 1
            return temp?.item
        }
        return nil
    }
    
    /// returns the item least recently added to the queue
    /// - Returns: the item least recently added to this queue
    public func peek() -> E? {
        if first != nil {
            return first?.item
        }
        return nil
    }
    
    
    /// verify if this queue is empty?
    /// - Returns: true or false
    public func isEmpty() -> Bool {
        return first != nil
    }
    
    public func makeIterator() -> QueueIterator<E> {
        return QueueIterator<E>(first)
    }
    
}

extension Queue {
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

extension Queue: CustomStringConvertible {
    public var description: String {
        let desc = self.reduce(into: "") { $0 += ",\($1)"}
        return "[\(desc[1,desc.count])]"
    }
}

extension Queue {
    public struct QueueIterator<E> : IteratorProtocol {
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

