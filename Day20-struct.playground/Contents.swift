import UIKit

var greeting = "Hello, playground"

// 常量结构体实例的存储属性
/// 如果你创建了一个结构体的实例并且把这个实例变量赋给常量，你不能修改这个实例的属性，即使是声明为变量的属性

// 延迟存储属性
/// 延迟存储属性的初始值在其第一次使用时才进行计算。你可以通过在其声明前标注lazy修饰语来表示一个延迟存储属性。
/// 如果被标记为lazy修饰符的属性同时被多个线程访问并且属性还没有被初始化，则无法保证属性只初始化一次

class DataImporter {
    var fileName = "data.txt"
    init() {
        print("DataImporter inits")
    }
}

class DataManager {
    lazy var importer = DataImporter() // 调用初始化器是不会真正的初始化，而是使用属性时才会真正的初始化
    var data = [String]()
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
print("manager.data.append finish")
print(manager.importer.fileName)

// 计算属性
// 除了存储属性，类、结构体和枚举也能够计算定义属性，而它实际并不存储值。相反，它提供一个读取器和一个可选的设置器来间接得到和设置它的属性和值
struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
//struct Rect {
//    var origin = Point()
//    var size = Size()
//    var center: Point {
//        get {
//            let centerX = origin.x + (size.width / 2)
//            let centerY = origin.y + (size.height / 2)
//            return Point(x: centerX, y: centerY)
//        }
//        set(newCenter) {
//            origin.x = newCenter.x - (size.width / 2)
//            origin.y = newCenter.y - (size.height / 2)
//        }
//    }
//}

// 简写setter
// 如果一个计算属性的设置器没有为将要被设置的值定义一个名字，那么他将被默认命名为newValue
//struct Rect {
//    var origin = Point()
//    var size = Size()
//    var center: Point {
//        get {
//            return Point(x: origin.x + (size.width / 2), y: origin.y + (size.height / 2))
//        }
//        set {
//            origin.x = newValue.x - (size.width / 2)
//            origin.y = newValue.y - (size.height / 2)
//        }
//    }
//}

//简写getter
//struct Rect {
//    var origin = Point()
//    var size = Size()
//    var center: Point {
//        get {
//            Point(x: origin.x + (size.width / 2), y: origin.y + (size.height / 2))
//        }
//        set {
//            origin.x = newValue.x - (size.width / 2)
//            origin.y = newValue.y - (size.height / 2)
//        }
//    }
//}

// 只读计算属性
// 一个有读取器但是没有设置器的计算属性就是所谓的只读计算属性。只读计算属性返回一个值，也可以通过点语法访问，但是不能被修改为另外一个值。
// 你必须用var关键字定义计算属性（包括只读计算属性）为变量属性，因为他们的值不是固定的。let关键字只用于常量属性，用于那些值一旦作为实例初始化就不能更改

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            Point(x: origin.x + (size.width / 2), y: origin.y + (size.height / 2))
        }
    }
}

// 属性观察者
// willSet会在该值被存储之前被调用
// didSet会在一个新值被存储后被调用
// 如果你实现了一个willSet观察者，新的属性会以常量形式参数传递。你可以在你的willSet实现中为这个参数定义名字。如果你没有为它命名，那么它会使用默认的名字newValue。
// 如果你实现了一个didSet观察者，一个包含旧属性值的常量形式参数将会被传递。你可以为它命名，也可以使用默认的形式参数名oldValue.如果你在属性自己的didSet观察者里给自己赋值，你赋值的新值就会取代刚刚设置的值

class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360
stepCounter.totalSteps = 896

// 全局和局部变量
// 观察属性的能力同样对全局变量和局部变量有效。全局变量是定义在任何函数、方法、闭包或者类型环境之外的变量。局部变量是定义在函数、方法或者闭包环境之中的变量。

var count: Int = 0 {
    willSet(newCount) {
        print("About to set count to \(newCount)")
    }
    didSet {
        if count > oldValue {
            print("Added \(count - oldValue)")
        }
    }
}

count = 10
if count == 10 {
    print("ten")
}

// 类型属性
// 使用static关键字来定义类型属性。对于类类型的计算类型属性，你可以使用class关键字来允许子类重写父类的实现

class SomeClass {
    static var storedTypeProperty = "Some Value"
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}
