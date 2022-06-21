//
//  ArrayDeque.swift
//  Deque
//
//  Created by Hongyu Shi on 2022/6/21.
//

import _DequeProtocol

public struct ArrayDeque<Element>: Deque {
    
    var content: Array<Element>
    public var count: Int { content.count }
    public var isEmpty: Bool { content.isEmpty }
    
    public init() {
        content = []
    }
    
    public mutating func addFirst(_ item: Element) {
        var newContent = [item]
        newContent += content
        content = newContent
    }
    
    public mutating func addLast(_ item: Element) {
        content.append(item)
    }
    
    public mutating func removeFirst() -> Element? {
        guard let first = content.first else { return nil }
        content = Array(content[1 ..< endIndex])
        return first
    }
    
    public mutating func removeLast() -> Element? {
        guard !isEmpty else { return nil }
        return content.removeLast()
    }
}

extension ArrayDeque: Collection {
    public var startIndex: Int { content.startIndex }
    public var endIndex: Int { content.endIndex }
    
    public func index(after i: Int) -> Int {
        content.index(after: i)
    }
    
    public subscript(position: Int) -> Element {
        content[position]
    }
}

extension ArrayDeque: CustomStringConvertible where Element: CustomStringConvertible {
    public var description: String {
        content.description
    }
}
