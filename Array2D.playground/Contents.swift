/*
 * 二维数组
 * 二维数组内部仍然使用普通数组来保存数据，只是根据column和row来构造索引
 */

public struct Array2D<Element> {
    public let columns: Int
    public let rows: Int
    fileprivate var array: [Element]
    
    public init(columns: Int, rows: Int, initialValue: Element) {
        self.columns = columns
        self.rows = rows
        array = [Element](repeating: initialValue, count: rows * columns)
    }
    
    public subscript(column: Int, row: Int) -> Element {
        get {
            precondition(column < columns, "Column \(column) Index is out of range. Array2D<Element>(columns: \(columns), rows: \(rows))")
            precondition(row < rows, "Row \(row) Index is out of range. Array2D<Element>(columns: \(columns), rows: \(rows))")
            
            return array[row * columns + column]
        }
        set {
            precondition(column < columns, "Column \(column) Index is out of range. Array2D<Element>(columns: \(columns), rows: \(rows))")
            precondition(row < rows, "Row \(row) Index is out of range. Array2D<Element>(columns: \(columns), rows: \(rows))")
            
            array[row * columns + column] = newValue
        }
    }
}

let columns = 10
let rows = 10
var cookies = Array2D(columns: columns, rows: rows, initialValue: 0)
cookies[4,1] = 12

let myCookie = cookies[4,1]

//for row in 0..<rows {
//    for column in 0..<columns {
//        print(cookies[column, row])
//    }
//}
//
//print("hehe")
