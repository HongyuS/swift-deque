//
//  _DoublyCircularLinkedList.swift
//  Deque
//
//  Created by Hongyu Shi on 2022/6/21.
//

import Foundation

public struct _DoublyCircularLinkedList<Element> {
    
    class Node {
        var previous: Node?
        var element: Element?
        var next: Node?
        
        init(previous: Node? = nil, element: Element? = nil, next: Node? = nil) {
            self.previous = previous
            self.element = element
            self.next = next
        }
    }
    
    public var count: Int
    public var isEmpty: Bool { count == 0 }
    
    var _start: Node
    
    public init() {
        count = 0
        _start = Node()
        _start.previous = _start
        _start.next = _start
    }
    
    public mutating func insertFirst(_ element: Element) {
        count += 1
        let newNode = Node(previous: _start, element: element, next: _start.next!)
        _start.next!.previous = newNode
        _start.next = newNode
    }
    
    public mutating func insertLast(_ element: Element) {
        count += 1
        let newNode = Node(previous: _start.previous!, element: element, next: _start)
        _start.previous!.next = newNode
        _start.previous = newNode
    }
    
    public mutating func removeFirst() -> Element? {
        let first = _start.next!
        guard let element = first.element else { return nil }
        _start.next = first.next!
        _start.next!.previous = _start
        count -= 1
        return element
    }
    
    public mutating func removeLast() -> Element? {
        let last = _start.previous!
        guard let element = last.element else { return nil }
        _start.previous = last.previous!
        _start.previous!.next = _start
        count -= 1
        return element
    }
}

extension _DoublyCircularLinkedList: Sequence {
    public struct LinkedListIterator: IteratorProtocol {
        var node: Node
        mutating public func next() -> Element? {
            node.next!.element
        }
    }
    
    public func makeIterator() -> LinkedListIterator {
        LinkedListIterator(node: _start.next!)
    }
}

extension _DoublyCircularLinkedList: Collection {
    public var startIndex: Int { 0 }
    public var endIndex: Int { count }
    
    public func index(after i: Int) -> Int { i + 1 }
    
    public subscript(position: Int) -> Element {
        precondition(indices.contains(position), "Index out of range")
        var result = _start.next!
        for _ in 0 ..< position {
            result = result.next!
        }
        return result.element!
    }
}

extension _DoublyCircularLinkedList: CustomStringConvertible where Element: CustomStringConvertible {
    public var description: String {
        var result: String = "["
        var node = _start.next!
        for _ in startIndex ..< endIndex - 1 {
            result += String(describing: node.element!)
            result += ", "
            node = node.next!
        }
        result += String(describing: node.element!)
        return result + "]"
    }
}
