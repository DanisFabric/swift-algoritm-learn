// 双向队列
/*
 * 双向队列
 * 只使用 - enqueue(_:) + dequeue() 就是Queue
 * 只使用 - enqueue(_:_ + dequeueBack() 就是Stack
 */

import Foundation

public struct Deque<Element> {
    fileprivate var array = [Element]()
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    public var count: Int {
        return array.count
    }
    
    init(_ elements: Element...) {
        array = elements
    }
    
    public mutating func enqueue(_ element: Element) {
        array.append(element)
    }
    
    
    @discardableResult
    public mutating func dequeue() -> Element? {
        if array.isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
    
    
    public mutating func enqueueFront(_ element: Element) {
        array.insert(element, at: 0)
    }
    
    @discardableResult
    public mutating func dequeueBack() -> Element? {
        if array.isEmpty {
            return nil
        } else {
            return array.removeLast()
        }
    }
    
    public func peekFront() -> Element? {
        return array.first
    }
    
    public func peek() -> Element? {
        return array.last
    }
}


var deque = Deque("Danis", "Jack")

deque.enqueue("Steve")

deque.dequeueBack()

print(deque)
