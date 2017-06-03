
/// 初始化时内部array进行排序，然后每次插入元素的时候，找到对应的位置进行插入就OK了
struct OrderedArray<Element: Comparable> {
    fileprivate var array = [Element]()
    
    public init() {}
    public init(_ elements: Element...) {
        self.array = elements.sorted()
    }
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    public subscript(index: Int) -> Element {
        return array[index]
    }
    
    public mutating func remove(at index: Int) -> Element {
        return array.remove(at: index)
    }
    public mutating func removeAll() {
        array.removeAll()
    }
    
    public mutating func insert(_ newElement: Element) -> Int {
        let index = findIndex(of: newElement)
        array.insert(newElement, at: index)
        
        return index
    }
    private func findIndex(of element: Element) -> Int {
        for index in 0..<array.count {
            if element < array[index] {
                return index
            }
        }
        return array.count
    }
}

var oa = OrderedArray(1,2,3,4,10,34,53)
oa.insert(3)
oa.insert(25)
oa.insert(78)

print(oa)