public class LinkedListNode<Value> {
    var value: Value
    
    var next: LinkedListNode?
    weak var previous: LinkedListNode?
    
    public init(_ value: Value) {
        self.value = value
    }
}

public class LinkedList<Element> {
    public typealias Node = LinkedListNode<Element>
    
    fileprivate var head: Node?
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var first: Node? {
        return head
    }
    
    public var last: Node? {
        var node = head
        while node?.next != nil {
            node = node?.next
        }
        return node
    }
    var count: Int {
        var node = head
        var index = 0
        while node != nil {
            node = node?.next
            index += 1
        }
        return index
    }
}

extension LinkedList {
    public subscript(index: Int) -> Element {
        get {
            return findNode(at: index).value
        }
        set {
            findNode(at: index).value = newValue
        }
    }
    fileprivate func findNode(at index: Int) -> Node {
        precondition(index >= 0, "index 不能小于0")
        precondition(index < count, "index 越界")
        
        var node = head!
        for _ in 0..<index {
            node = node.next!
        }
        return node
    }
    
    public func append(_ newElement: Element) {
        guard let last = last else {
            head = Node(newElement)
            
            return
        }
        let node = Node(newElement)
        
        (last.next, node.previous) = (node, last)
    }
    public func insert(_ value: Element, at index: Int) {
        
    }
    
    public func removeAll() {
        head = nil
    }
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        var node = head
        var text = "["
        while node != nil {
            text += "\(node!.value), "
            node = node?.next
        }
        text.append("]")
        
        return text
    }
}

let list = LinkedList<String>()

list.append("danis")
list.append("jack")
list.append("steve")

print(list.isEmpty)
print(list.count)
print(list)
