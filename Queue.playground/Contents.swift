
public struct Queue<Element> {
    fileprivate var array: [Element]
    
    init(_ elements: Element...) {
        array = elements
    }
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    public var count: Int {
        return array.count
    }
    
    public mutating func enqueue(_ element: Element) {
        array.append(element)
    }
    
    @discardableResult
    public mutating func dequeue() -> Element? {
        if isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
    
    public var front: Element? {
        return array.first
    }
}

extension Queue: CustomStringConvertible {
    public var description: String {
        return array.description
    }
}

var names = Queue("danis", "Jack", "Steve")

names.enqueue("Mike")

print(names)

names.dequeue()
names.dequeue()

print(names)
