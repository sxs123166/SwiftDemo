import UIKit

var greeting = "Hello, playground"

// 模式
/// 模式代表单个值或者复合值的结构
/// 例如，元组（1，2）的结构是由逗号分隔的，包含两个元素的列表。因为模式代表一种值得结构，而不是特定的值。你可以利用模式来匹配各种各样的值。比如，
/// （x,y）可以匹配元组(1,2)，以及任何含两个元素的元组。除了利用模式匹配一个值以外，你可以从复合值中提取出部分或全部值，然后分别把各个部分的值和一个常量或者变量绑定起来


// 模式分类
/// Swift中的模式分为两类：一种能成功匹配任何类型的值，另一种在运行时匹配某个特定值时可能会失败。
/// 第一类模式用于解构简单变量、常量和可选绑定中的值。此类模式包括通配符模式、标识符模式，以及包含前两种模式的值绑定模式和元组模式。你可以为这类模式指定一个类型标注，从而限制他们只能匹配某种特定类型的值
/// 第二类模式用于全模式匹配，这种情况下你试图匹配的值在运行时可能不存在。此类模式包括枚举用例模式、可选模式、表达式模式和类型转换模式。你在switch语句的case标签中，do语句的catch子句中，或者在if、while、guard和for-in语句的case条件句中使用这类模式
///

// 模式分类

/// 第一类
/// 通配符模式
/// 标识符模式
/// 值绑定模式
/// 元组模式
///
///第二类
/// 枚举用例模式
/// 可选项模式
/// 类型转换模式
/// 表达式模式


// 通配符模式
/// 通配符模式由一个下划线（_）构成，用于匹配并忽略任何值。当你想忽略被匹配的值时可以使用该模式
for _ in 1...3 {
    
}

// 标识符模式
/// 标识符模式匹配任何值，并将匹配的值和一个变量或常量绑定起来
let someValue = 42

// 值绑定模式
/// 值绑定模式把匹配到的值绑定给一个常量或变量。把匹配到的值绑定给常量时，用关键字let,绑定给变量时，用关键字var

let point = (3,2)
switch point {
    // 将point中的元素绑定到x和y
case let (x, y):
    print("The point is at (\(x), \(y)).")
}

// 元组模式
/// 元组模式是由逗号分隔的，具有零个或多个模式的列表，并有一对圆括号括起来。元组模式匹配相应的元组类型的值。
/// 你可以使用类型标注去限制一个元组模式能匹配哪种元组类型。例如，在常量声明let (x, y):(Int,Int) = (1,2)中的元组模式(x,y):(Int,Int)只匹配两个元素都是Int类型的元组
/// 当元组模式被用于for-in语句或者变量和常量声明时，它仅可以包含通配符模式、标识符模式、可选模式或者其他包含这些模式的元组模式

let points = [(0,0), (1,0), (1,1), (2,0), (2,1)]
for (x,y) in points where y == 0 {
    print("\(x) and \(y)")
}

// 枚举用例模式
/// 枚举用例模式匹配现有的某个枚举类型的某个用例。枚举用例模式出现在switch语句中的case标签中，以及if、while、guard和for-in语句的case条件中


// 可选项目模式
/// 可选项模式匹配Optional<Wrapped>枚举在some(Wrapped)中包装的值
/// 可选项目模式为for-in语句提供了一种迭代数组的简便方式，只为数组中非nil的元素执行循环体

let someOptional: Int? = 42

if case .some(let x) = someOptional {
    print(x)
}

if case let x? = someOptional {
    print(x)
}

let arrayOfOptionalInts: [Int?] = [nil, 2, 3, nil, 5]
for case let number? in arrayOfOptionalInts {
    print("Found a \(number)")
}

// 类型转换模式
/// 有两种类型转换模式，is模式和as模式。is模式只出现在switch语句中的case标签中。is模式和as模式形势如下：
/// is类型
/// 模式as类型

/// is模式仅当一个值的类型在运行时和is模式右边的指定类型益智，或者是其子类的情况下，才会匹配这个值。is模式和is运算符有相似表现，他们都进行类型转换，但是is模式没有返回值类型
/// as模式仅当一个值的类型在运行时和as模式右边的指定类型一致，或者是其子类的情况下，才会匹配这个值。如果匹配成功，被匹配的值的类型被转换成as模式右边指定的类型

protocol Animal {
    var name: String { get }
}

struct Dog: Animal {
    var name: String {
        return "dog"
    }
    var runSpeed: Int
}

struct Bird: Animal {
    var name: String {
        return "bird"
    }
    var flightHeight: Int
}

struct Fish: Animal {
    var name: String {
        return "fish"
    }
    var depth: Int
}

let animals:[Any] = [Dog(runSpeed: 55), Bird(flightHeight: 2000), Fish(depth: 100)]

for animal in animals {
    switch animal {
    case let dog as Dog:
        print("\(dog.name) can run \(dog.runSpeed)")
    case let fish as Fish:
        print("\(fish.name) can dive depth \(fish.depth)")
    case is Bird:
        print("bird can fly")
    default:
        print("unknown animal")
    }
}

// 表达式模式
/// 表达式模式代表表达式的值。表达式模式只出现在switch语句的case标签中
/// 表达式模式代表的表达式会使用Swiftbiaozhunkuzhongde ~=运算符与输入表达式的值进行比较。如果～=运算符返回true，则匹配成功。默认情况下，～=运算符使用
/// ==运算符来比较两个相同类型的值。它也可以将一个整型数值与一个Range实例中的一段整数区间做匹配

//let point = (1,2)
//switch point {
//case (0,0):
//    print("(0,0) is at the origin")
//case (-2...2, -2...2):
//    print("\(point.0), \(point.1) is near the origin.")
//default:
//    print("The point is at (\(point.0),\(point.1))")
//}

// 可以重载~=运算符来提供自定义的表达式匹配行为
func ~= (pattern: String, value: Int) -> Bool {
    return pattern == "\(value)"
}

switch point {
case ("0", "0"):
    print("(0,0) is at the origin.")
default:
    print("The point is at (\(point.0), \(point.1)).")
}


struct Employee {
    var salary: Float
}
let e = Employee(salary: 9999)
func ~=(lhs: Range<Float>, rhs: Employee) -> Bool {
    return lhs.contains(rhs.salary)
}
switch e {
case 0.0..<1000:
    print("艰难生活")
case 1000..<5000:
    print("小康社会")
case 5000..<10000:
    print("活的很滋润")
default:
    break
}
