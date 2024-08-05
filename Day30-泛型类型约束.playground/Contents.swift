import UIKit

var greeting = "Hello, playground"

// 类型约束
// swapTwoValues(_:_:)函数和Stack类型可以用于任意类型。但是，有时在用于泛型函数的类型和泛型类型上，强制其遵循特定的类型约束很有用。类型约束指出一个类型形式参数必须继承自特定类或者遵循一个特定的协议、组合协议
// 例如，SWift的ictionary类型可以用于字典中键的类型上设置了一个限制。如字典中描述的一样，字典键的类型必须是可哈希的。也就是说，他必须提供一种使其可以唯一表示的方法。Dictionary需要她的键是可哈希的，以便它可以检查字典中是否包含一个特定键的值。没有了这个要求，Dictionary不能区分该插入还是替换一个指定键的值，也不能在字典中查找已经给定键的值

// 类型约束语法
// 在一个类型形式参数名称后面放置一个类或者协议作为形式参数列表的一部分，并用冒号隔开，以写出一个类型约束。下面展示了一个泛型函数类型约束的基本语法（和泛型类型的语法相同）

//func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
//
//}


// 这是一个叫做findIndex(ofString: Int)的非泛型函数，在给定的String值数组中查找给定的String值。findIndex(ofString: in:)函数返回一个可选的Int值，如果找到了给定字符串，他会返回数组中第一个匹配的字符串的索引值，如果找不到给定字符串就返回nil：
func findIndex(ofString valueToFind: String, in array: [String]) -> Int? {
    for(index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}


// 泛型版本
//func findIndex<T>(ofString valueToFind: T, in array: [T]) -> Int? {
//    for(index, value) in array.enumerated() {
//        if value == valueToFind {
//            return index
//        }
//    }
//    return nil
//}

// Swift标准库中定义了一个叫做Equatable的协议，要求遵循其协议的类型要实现相等操作符（==）和不等操作符（！=），用于比较该类型的两个值。所有Swift标准库中的类型自动支持Equable协议
// 任何Equatable的类型都能安全的用于findIndex(of:in:)函数，因为可以保证那些类型支持相等操作符。为了表达这个事实，当你定义函数时将Equatable类型约束作为类型形式参数定义的一部分书写：

func findIndex<T: Equatable>(ofString valueToFind: T, in array: [T]) -> Int? {
    for(index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

let names = [3, 5, 7]
print(findIndex(ofString: 7, in: names))
