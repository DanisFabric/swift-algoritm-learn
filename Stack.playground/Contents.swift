public struct Stack<Element> {
    fileprivate var array: [Element]
    
    init(_ elements: Element...) {
        array = elements
    }
    
    public var count: Int {
        return array.count
    }
    public var isEmpty: Bool {
        return array.isEmpty
    }
    public mutating func push(_ element: Element) {
        array.append(element)
    }
    @discardableResult
    public mutating func pop() -> Element? {
        return array.popLast()
    }
    
    public var top: Element? {
        return array.last
    }
}

var names = Stack("danis", "sherry", "steve")

names.push("jack")

print(names)

names.pop()
names.pop()
names.pop()

print(names)
