import UIKit

var greeting = "Hello, playground"

// 实例方法
// 实例方法是属于特定类实例、结构体实例或者枚举实例的函数。他们为这些实例提供功能性，要么通过提供访问和修改实例属性的方法，要么通过提供与实例目的相关的功能

class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    func increment(by amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}

// 实例方法 self
// 每一个类的实例都隐含一个叫做self的属性，他完完全全与实例本身相等。你可以使用self属性来在当前实例当中调用它自身的方法
// 实际上，你不需要经常在代码中写self。如果你没有显示的写出self,Swift会在你于方法中使用已知属性或者方法的时候假定你是调用了当前实例中的属性或者方法
// 例外就是当一个实例方法的形式参数名与实例中某个属性拥有相同的名字的时候。在这种情况下，形式参数名具有优先权，并且调用属性的时候使用更加严谨的方式就很有必要了。你可以使用self属性来区分形式参数名和属性名

//struct Point {
//    var x = 0.0, y = 0.0
//    func isToTheRightOf(x: Double) -> Bool {
//        return self.x > x
//    }
//}
//let somePoint = Point(x: 4.0, y: 5.0)
//if somePoint.isToTheRightOf(x: 1.0) {
//    print("This point is to the right of the line where x == 1.0")
//}

// 在实例方法中修改属性
// 结构体和枚举是值类型。默认情况下，值类型属性不能被自身的实例方法修改
// 你可以选择在func关键字前放一个mutating关键字来指定方可以修改属性

struct Point {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}
var somePoint = Point(x: 1.0, y: 1.0)
somePoint.moveBy(x: 2.0, y: 3.0)
print("The point is now at (\(somePoint.x), \(somePoint.y))")

// 枚举的mutating方法
// 枚举的异变方法可以设置隐含的self属性为相同枚举里的不同成员
enum TriStateSwitch {
    case off, low, high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}
var ovenLight = TriStateSwitch.low
ovenLight.next()
ovenLight.next()

// 类型方法
// 通过在func关键字之前使用static关键字来明确一个类型方法。类同样可以使用class关键字来允许子类重写父类对类型方法的实现
class SomeClass {
    class func someTypeMethod() {
        // do Something
    }
}
SomeClass.someTypeMethod()
