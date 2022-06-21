//
//  LinkedListDeque.swift
//  Deque
//
//  Created by Hongyu Shi on 2022/6/21.
//

import _DoublyCircularLinkedList
import _DequeProtocol

public struct LinkedListDeque<Element>: Deque {
    
    var content = _DoublyCircularLinkedList<Element>()
    
    public var count: Int { content.count }
    public var isEmpty: Bool { content.isEmpty }
    
    public mutating func addFirst(_ item: Element) {
        content.insertFirst(item)
    }
    
    public mutating func addLast(_ item: Element) {
        content.insertLast(item)
    }
    
    public mutating func removeFirst() -> Element? {
        content.removeFirst()
    }
    
    public mutating func removeLast() -> Element? {
        content.removeLast()
    }
}

extension LinkedListDeque: Collection {
    public var startIndex: Int { content.startIndex }
    public var endIndex: Int { content.endIndex }
    
    public func index(after i: Int) -> Int {
        content.index(after: i)
    }
    
    public subscript(position: Int) -> Element {
        content[position]
    }
}

extension LinkedListDeque: CustomStringConvertible where Element: CustomStringConvertible {
    public var description: String {
        content.description
    }
}
