import XCTest
@testable import ArrayDeque
@testable import LinkedListDeque

final class DequeTests: XCTestCase {
    
    func testArray() throws {
        var deque = ArrayDeque<Int>()
        deque.addFirst(1)
        deque.addLast(5)
        deque.addFirst(4)
        deque.addLast(7)
        XCTAssertEqual(deque.description, "[4, 1, 5, 7]")
        XCTAssertEqual(deque.removeLast(), 7)
        XCTAssertEqual(deque.removeFirst(), 4)
        XCTAssertEqual(deque.removeLast(), 5)
        XCTAssertEqual(deque.removeFirst(), 1)
        XCTAssertEqual(deque.isEmpty, true)
    }
    
    func testLinkedList() throws {
        var deque = LinkedListDeque<Int>()
        deque.addFirst(1)
        deque.addLast(5)
        deque.addFirst(4)
        deque.addLast(7)
        XCTAssertEqual(deque.description, "[4, 1, 5, 7]")
        XCTAssertEqual(deque.removeLast(), 7)
        XCTAssertEqual(deque.removeFirst(), 4)
        XCTAssertEqual(deque.removeLast(), 5)
        XCTAssertEqual(deque.removeFirst(), 1)
        XCTAssertEqual(deque.isEmpty, true)
    }
}
