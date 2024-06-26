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
