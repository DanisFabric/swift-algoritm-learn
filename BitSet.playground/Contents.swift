/*
 * BitSet 用来管理一系列的bit位，可通过下标来访问bit位
 * 核心逻辑很简单，就是用Int数组来管理数据，然后通过位运算来获取bit位的值
 * 难点 - 需要按64位进行对齐
 */

struct BitSet {
    fileprivate var size: Int
    
    // 一个word对应的bit数目
    fileprivate let N = 64
    // 通过Word来保存bit，一个word含有64个bit
    public typealias Word = UInt64
    
    fileprivate var words: [Word]
    
    public init(size: Int) {
        precondition(size > 0)
        self.size = size
        
        // bit对齐到64位
        let n = (size + (N - 1)) / N
        words = [Word](repeating: 0, count: n)
    }
    
}

extension BitSet {
    /// 构造出对能够定位到bit的可用的index
    ///
    /// - Returns: 
    /// $0: 在words里面的index
    /// $1: 需要bit位为1，其余都为0
    fileprivate func createInternalIndex(of i: Int) -> (Int, Word) {
        precondition(i >= 0)
        precondition(i < size)
        
        let wordIndex = i / N
        let trueIndex = i % N
        
        return (wordIndex, 1 << Word(trueIndex))
    }
    fileprivate func lastWordMask() -> Word {
        let diff = words.count*N - size
        if diff > 0 {
            let mask = 1 << Word(63 - diff)
            return mask | (mask - 1)
        } else {
            return ~0
        }
    }
}

extension BitSet {
    public subscript(i: Int) -> Bool {
        get {
            return isSet(i)
        }
        set {
            if newValue {
                set(i)
            } else {
                clear(i)
            }
        }
    }
    public mutating func set(_ i: Int) {
        let (wordIndex, flagWord) = createInternalIndex(of: i)
        
        words[wordIndex] |= flagWord
    }
    public mutating func setAll() {
        for index in 0..<words.count {
            words[index] = ~Word()
        }
    }
    public mutating func clear(_ i: Int) {
        let (wordIndex, flagWord) = createInternalIndex(of: i)
        
        words[wordIndex] &= ~flagWord
    }
    public mutating func clearAll() {
        for index in 0..<words.count {
            words[index] = 0
        }
    }
    public mutating func flip(_ i: Int) {
        let (wordIndex, flagWord) = createInternalIndex(of: i)
        words[wordIndex] ^= flagWord // 异或，不同为1，相同为0
    }
}

extension BitSet {
    public func isSet(_ i: Int) -> Bool {
        let (wordIndex, flatWord) = createInternalIndex(of: i)
        
        return (words[wordIndex] & flatWord) != 0
    }
    public func isAllSet() -> Bool {
        for index in 0..<words.count - 1 {
            if words[index] != ~0 {
                return false
            }
        }
        return words.last! == lastWordMask()
    }
    public func isAnySet() -> Bool {
        return false
    }
}

var bits = BitSet(size: 3)
bits[0] = true
bits[1] = true
bits[2] = true
print(bits.words)
print(bits.isAllSet())
