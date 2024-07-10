import UIKit

var greeting = "Hello, playground"

// extension
/// 扩展为现有的类、结构体、枚举类型或协议添加了新功能。这也包括了为无访问权限的源代码扩展类型的能力（即所诶的逆向建模）
/// 扩展和Objective-C中的category类似（与Objective-C的分类不同的是，Swift的扩展没有名字）
///

// extension的能力
/// 添加计算实例属性和计算类型属性
/// 定义实例方法和类型方法
/// 提供新初始化器
/// 定义下标
/// 定义和使用新内嵌类型
/// 使现有的类型遵循某协议
/// 扩展可以向一个类型添加新的方法，但是不能重写已有的方法

// 计算属性
/// 扩展可以向已有的类型添加计算实例属性和计算类型属性

extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084}
}
let oneInch = 25.4.mm
print("One inch is \(oneInch) meters")
let threeFeet = 3.ft
print("Three feet is \(threeFeet) meters")

// 初始化器
/// 扩展可向已有的类型添加新的初始化器。这允许你扩展其他类型以使初始化器接收你的自定义类型作为形式参数，或提供该类型的原始实现中未包含的额外初始化选项。
/// 扩展能为类添加新的便捷初始化器，但是不能为类添加指定初始化器或反初始化器。指定初始化器和反初始化器必须由原来类的实现提供

struct Size {
    var width = 0.0, height = 0.0
}

struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
}

extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))

// 方法
///  扩展可以为已有的类型添加新的实例方法和类型方法

extension Int {
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}

3.repetitions {
    print("Hello!")
}

// mutating方法
/// 扩展的实例方法仍可以修改（或异变）实例本身。结构体和枚举类型方法在修改self或本身的属性时必须标记实例方法为mutating，和原本实现的异变方法一样

extension Int {
    mutating func square() {
        self = self * self
    }
}

var someInt = 3
someInt.square()

// 下标
/// 扩展能为已有的类型添加新的下标

extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}
746381295[0]
746381295[1]
746381295[2]
746381295[8]

// 添加内嵌类型
/// 扩展可以为已有的类、结构体和枚举类型添加新的内嵌类型

extension Int {
    enum Kind {
        case negative, zero, positive
    }
    var kind: Kind {
        switch self {
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
}


print(0.kind)
