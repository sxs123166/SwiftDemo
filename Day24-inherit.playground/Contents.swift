import UIKit

var greeting = "Hello, playground"

// 定义基类
/// 任何不从另一个类继承的类都是所谓的基类
/// Swift类不会从一个通用基类继承。你没有指定特定父类的类都会以基类的形式创建

class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        // do nothing - an arbitrary vehicle doesn't necessarily make a noise
    }
}

// 子类
/// 子类是基于现有类创建类的行为。子类从现有的类继承了一些特征，你可以重新定义他们。你也可以为子类添加新的特征
/// 为了表明子类有父类，要把子类写在父类的前面，用冒号分隔

class Bicycle: Vehicle {
    var hasBasket = false
}

let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 15.0
print("Bicycle: \(bicycle.description)")

// 重写
/// 子类可以提供它自己的实例方法、类型方法、实例属性，类型属性或下标脚本的自定义实现，否则它将会从父类继承。这就是所谓的重写。
/// 要重写而不是继承一个特征，你需要在你的重写定义前面加上override关键字。这样做说明你打算提供一个重写而不是意外提供了一个相同定义。意外的重写看可能导致意想不到的行为，并且任何没有使用override关键字的重写都会在编译时被诊断为错误

// 访问父类的方法、属性和下标脚本
/// 你可以通过使用super前缀访问父类的方法、属性和下标脚本
///   一个命名为someMethod()的重写方法可以通过super.someMethod()在重写方法的实现中调用父类版本的someMethod方法
///   一个命名为someProperty的重写属性可以通过super.someProperty在重写的getter或setter实现中访问父类版本的someProperty属性
///   一个命名为someIndex的重写下标脚本可以使用super[someIndex]在重写的下标脚本实现中访问父类版本中相同的下标脚本

// 重写方法
/// 可以在子类中重写一个继承的实例或类型方法来提供定制的或替代方法的实现

class Train: Vehicle {
    override func makeNoise() {
        print("呜呼！呜呼")
    }
}

let train = Train()
train.makeNoise()

// 重写属性的getter和setter
/// 可以提供一个自定义的getter（和setter,如果合适的话）来重写任意继承的属性，无论在最开始继承的属性是存储属性还是计算属性

class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}

let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("Car: \(car.description)")

// 重写属性的观察器
/// 可以使用属性重写来为继承的属性添加属性观察器。这就可以让你在继承属性的值改变时得到通知，无论这个属性最初如何实现
/// 不能给继承而来的常量存储属性或者只读的计算属性添加属性观察器。这些属性的值不能被设置，所以提供willSet或didSet实现作为重写的一部分也是不合适的
/// 不能为同一个属性同时提供重写的setter和重写的属性观察器。如果你想要监听属性值的改变，并且你已经为那个属性提供了一个自定义的setter，那么你从自定义的setter里就可以监听任意值的改变

class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("AutomaticCar: \(automatic.description)")

// 阻止重写
/// 可以通过标记为final来阻止一个方法、属性或下标脚本被重写。通过在方法、属性或者下表脚本的关键字前写final修饰符（比如final var,final func, final class func, final subscript）

//class Vehicle {
//    var currentSpeed: Int = 0
//    final var desc: String {
//        return "run at speed \(currentSpeed)"
//    }
//    
//    func makeNoise() -> {
//        
//    }
//}
//
//class Car: Vehicle {
//    var gear: Int = 0
//    
//    override var desc: String {
//        return super.desc + "at gear \(gear)"
//    }
//}
//
//var car = Car()
//car.gear = 3
//car.currentSpeed = 30
//print(car.desc)

