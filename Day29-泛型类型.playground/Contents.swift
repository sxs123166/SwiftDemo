import UIKit

var greeting = "Hello, playground"

// 泛型类型
// 除了泛型函数，Swift允许你定义自己的泛型类型。他们是可以用于任意目的自定义类、结构体、枚举，和Array、Dictionary方式类似

struct IntStack {
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
}

// 泛型Stack

struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("trez")
stackOfStrings.push("cuatro")

// 扩展泛型类型
// 当你扩展一个泛型类型时，不需要在扩展的定义中提供给类型形式参数列表。原始类型定义的类型形式参数列表在扩展体里仍然有效，并且原始类型形式参数列表名称也用于扩展类型形式参数

extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}
