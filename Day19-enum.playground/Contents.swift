import UIKit

var greeting = "Hello, playground"

// 枚举语法
// 用enum关键字来定义一个枚举，然后将其所有的定义内容放在一个大括号（{}）中
// 多个成员值可以出现在同一行中，要用逗号隔开

enum CompassPoint {
    case north
    case south
    case east
    case west
}

// 每个枚举都定义了一个全新的类型。正如Swift中其他的类型那样，他们的名称（例如：CompassPoint和Planet）需要首字母大写。给枚举类型起一个单数的而不是复数的名字，从而使得他们能够顾名思义

enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

// 可以用Swift语句来匹配每一个单独的枚举值

let directionToHead = CompassPoint.south
switch directionToHead {
case .north:
    print("Lots of plants have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
}

// 对某些枚举来说，如果能有一个集合包含了枚举的所有情况就好了。你可以通过在枚举名字后面写：CaseIterable来允许枚举被遍历。Swift会暴露一个包含对应枚举类型所有情况的集合名为allCases

enum CompassPoint2: CaseIterable {
    case north
    case south
    case east
    case west
}

let numberOfDirections = CompassPoint2.allCases.count
print("\(numberOfDirections) directions")

for direction in CompassPoint2.allCases {
    print(direction)
}

// 可以定义Swift枚举来存储任意给定类型的关联值，如果需要的话不同枚举成员关联值的类型可以不同
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode = Barcode.upc(8, 85909, 51226, 3)
print(productBarcode)
productBarcode = .qrCode("ABCDEFGHIJKLMNOP")
print(productBarcode)

// 关联值
switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
    print("QR code: \(productCode).")
}

// 原始值
// 枚举成员可以用相同类型的默认值预先填充（称为原始值）

enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

// 预设原始值
// 当你在操作存储整数或字符串原始值枚举的时候，你不必显示的给每一个成员都分配一个原始值。当你没有分配时，Swift将会自动为你分配值

enum Planet2: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

enum CompassPoint3: String {
    case north, south, east, west
}

// 从原始值初始化
// 如果你使用原始值类型来定义一个枚举，那么枚举就会自动收到一个可以接受原始值类型的值的初始化器（叫做rawValue的形式参数）然后返回一个枚举成员或者nil。你可以使用这个初始化器来尝试创建一个枚举的新实例

let possiblePlanet = Planet2(rawValue: 7)

let positionToFind = 11
if let somePlanet = Planet2(rawValue: positionToFind) {
    switch somePlanet {
    case .earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for humans")
    }
} else {
    print("There isn't a planet at position \(positionToFind)")
}


// 递归枚举
// 递归枚举是拥有另一个枚举作为枚举成员关联值的枚举。当编译器操作递归枚举时必须插入间接寻址层。你可以在声明枚举成员之前使用indirect关键字来明确它是递归的
// 如说表达式（5+4） * 2 在乘法右侧有一个数但有其他表达式在乘法的左侧

indirect enum ArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}

print(evaluate(product))
