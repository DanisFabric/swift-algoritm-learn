/*
 * 这里设计不按照club里面的进行设计。并不应该提供append和remove操作。
 * 因为是定长的array，所以应该是直接使用下标访问来进行赋值
 *
 */
struct FixedSizeArray<Element> {
    private var size: Int
    private var initialValue: Element
    private var array: [Element]
    
    init(size: Int, initialValue: Element) {
        self.size = size
        self.initialValue = initialValue
        self.array = [Element](repeating: initialValue, count: size)
    }
    
    subscript(index: Int) -> Element {
        get {
            precondition(index >= 0)
            precondition(index < size)
            
            return array[index]
        }
        set {
            precondition(index >= 0)
            precondition(index < size)
            
            array[index] = newValue
        }
    }
}
