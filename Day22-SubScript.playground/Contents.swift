import UIKit

var greeting = "Hello, playground"

// 下标
// 类、结构体和美剧可以定义下标，它可以作为访问集合、列表或序列成员的快捷方式。你可使用下标通过索引值来设置或检索值而不需要为设置和检索分别使用实例方法
// 你可以为一个类型定义多个下标，并且下标会基于传入的索引值的类型选择合适的下标重载使用。下标没有限制单个维度，你可以使用多个输入形参来定义下标以满足自定义类型的需求

// 下标语法
// 下标脚本允许你通过在实例名后面的方括号内写一个或多个值对该类的实例进行查询。它的语法类似于实例方法和计算属性。使用关键字subscript来定义下标，并且指定一个或多个输入形式参数和返回类型，与实例方法一样。与实例方法不同的是，下标可以是读写也可以是只读的

struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int{
        return multiplier * index
    }
}
let threeTimesTable = TimesTable(multiplier: 3)
print("six times three is \(threeTimesTable[6])")

// 下标可以接受任意数量的输入形式参数，并且这些输入形式参数可以是任意类型。下标也可以返回任意类型，下标可以使用变量形式参数和可变形式参数，但是不能使用输入输出形式参数或提供默认形式参数值
struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        self.grid = Array(repeating: 0.0, count: rows * columns)
    }
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}

var matrix = Matrix(rows: 2, columns: 2)
matrix[0, 1] = 1.5
matrix[1, 0] = 3.2

// 类型下标
// 实例下标，如果上文描述的那样，你在对应类型的实例上调用下标。你同样也可以定义类型本身的下标。这类下标叫做类型下标。你可通过在subscript关键字前加static关键字来标记类型下标。在类里使用class关键字，这样可以允许子类重写父类的下标实现。
enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter,saturn,uranus,neptune
    static subscript(n: Int) -> Planet {
        return Planet(rawValue: n)!
    }
}
let mars = Planet[4]
print(mars)

