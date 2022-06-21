//
//  _DequeProtocol.swift
//  Deque
//
//  Created by Hongyu Shi on 2022/6/22.
//

import Foundation

public protocol Deque: Collection {
    
    associatedtype Element
    
    var count: Index { get }
    var isEmpty: Bool { get }
    
    mutating func addFirst(_ item: Element)
    mutating func addLast(_ item: Element)
    mutating func removeFirst() -> Element?
    mutating func removeLast() -> Element?
}
