import UIKit

var greeting = "Hello, playground"

// 类的初始化和反初始化
/// 初始化器在创建特定类型的实例时被调用

struct Faharenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}

var f = Faharenheit()
print("The default temperature is \(f.temperature) Fahrenheit")

// 默认的属性值
// 如上所述，你可以在初始化器里为存储属性设置初始值。另外，制定一个默认属性值作为属性声明的一部分。当属性被定义的时候你可以通过为这个属性分配一个初始值来指定默认的属性值
struct Fahrenheit2 {
    var temperature = 32.0
}
var f2 = Fahrenheit2()
print("The default temperature is \(f2.temperature) Fahrenheit")

// 自定义初始化
// 可以提供初始化形式参数作为初始化器的一部分，来定义初始化过程中的类型和值的名称。初始化形式参数于函数和方法的形式参数具有相同的功能和语法

struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelVin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}
let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
let freezingPointOfWater = Celsius(fromKelVin: 273.15)

// 在初始化中分配常量属性
// 在初始化的任意时刻，你都可以给常量属性赋值，只要它在初始化结束结束时设置了确定的值即可。一旦为常量属性赋值，他就不能再被修改了。

class SurveyQuestion {
    let text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}
let beetsQuestion = SurveyQuestion(text: "How about beets")
beetsQuestion.ask()
beetsQuestion.response = "I also like beets. (But not cheese.)"

// 结构体的成员初始化器
// 如果结构体类型中没有定义任何的初始化器，他会自动获得一个成员初始化器。不同于默认初始化器，结构体会接收成员初始化器即使他的存储属性没有默认值

//struct Size {
//    var width = 0.0, height = 0.0
//}
//let twoByTwo = Size(width: 2.0, height: 2.0)

// 值类型的初始化器委托
struct Size {
    var width = 0.0, height = 0.0
}

struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    init() {}
    init(origin: Point, size: Size) {
        self.origin = Point()
        self.size = size
    }
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

// 类的继承和初始化
// 所有类的属性（包括从它的父类继承的所有属性）都必须在初始化期间分配初始值
// Swift为类类型定义了两种初始化器以确保所有的存储属性接收一个初始值。这就是所谓的指定初始化器和便捷初始化器
// 指定初始化器是类的主要初始化器。指定的初始化器可以初始化所有那个类引用的属性并且调用合适的父类初始化器来继续这个初始化过程给父类链
// 类偏向于少量指定初始化器，并且一个类通常只有一个指定初始化器。指定初始化器是初始化开始并持续初始化过程到父类链的“传送”点
// 每个类至少得有一个指定初始化器。如同初始化器的自动继承里描述的那样，在某些情况下，这些需求通过从父类继承一个或多个指定初始化器来满足
// 便捷初始化器是次要的。你可以在相同的类里定义一个便捷初始化器来调用一个指定的初始化器作为便捷初始化器来给指定初始化器设置默认形式参数。你也可以为具体的使用情况或输入的值类型定义一个便捷初始化器从而创建这个类的实例
// 如果你的类不需要便捷初始化器你可以不提供它，在为通用初始化模式创建快捷方式以节省时间或者类的初始化更加清晰明了的时候使用便捷初始化器


// 指定初始化器和便捷初始化器
/// 用于值类型的简单初始化器相同的方式来写类的指定初始化器
/// 用 convenience修饰符放到init关键字前定义便捷初始化器

//init(parameters) {
//    statements.
//}

//convenience init(parameters) {
//    statements
//}

// 类的初始化委托
// 指定初始化器必须从它的直系父类调用指定初始化器
// 便捷初始化器必须从相同的类里调用另一个初始化器
// 便捷初始化器必须最终调用一个指定初始化器


// 两段式初始化
// Swift的类初始化是一个两段式过程。在第一个阶段，每一个存储属性被引入类分配了一个初始值。一旦每个存储属性的初始状态被确定，第二个阶段就开始了，每个类都有机会在新的实例准备使用之前来定制他的存储属性
// 两段式初始化过程的使用让初始化更安全，同时让每个类的层级结构给与了完备的灵活性。两段式初始化过程可以防止属性值在初始化之前被访问。还可以防止属性值被另一个初始化器意外地赋予不同的值。

// 安全检查
// 1、指定初始化器必须保证向上委托给父类初始化器之前，其所在类引入的所有属性都要初始化完成
// 2、指定初始化器必须先向上委托父类初始化器，然后才能为继承的属性设置新值。如果不这样做，指定初始化器赋予的新值将被父类中的初始化器所覆盖
// 3、便捷初始化器必须先委托同类中的其他初始化器，然后再为任意属性赋新值（包括同类里定义的属性）。如果没这么做，便捷初始化器赋予的新值将被自己类中其他指定初始化器所覆盖
// 4、初始化器在第一阶段完成之前，不能调用任何实例方法、不能读取任何实例属性的值，也不能引用self作为值

class Person {
    var name: String
    var age: Int
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    convenience init() {
        self.init(name:"[Unnames]", age: 0)
    }
}

class Teacher: Person {
    var salary: Int
    init(name: String, age: Int, salary: Int) {
        self.salary = salary
        super.init(name: name, age: age)
        self.name = name + "老师"
    }
    convenience init(name: String) {
        self.init(name: name, age: 30, salary: 5000)
    }
    
    func test() {
        print("i am a teacher")
    }
    
    func showInfo() {
        print("teacher name \(name), age \(age), salary \(salary)")
    }
}

// 两段式初始化过程-阶段1
// 指定或便捷初始化器在类中被调用
// 为这个类的新实例分配内存。内存还没有被初始化
// 这个类的指定初始化器确保所有由此类引入的存储属性都有一个值。现在这些存储属性的内存被初始化了
// 指定初始化器上交父类的初始化器为其存储属性执行相同的任务
// 这个调用父类初始化器的过程将沿着初始化器链一直向上进行，直到到达初始化器链的最顶部
// 一旦达到了初始化器链的最顶部，在链顶部的类确保所有的存储属性都有一个值，此实例的内存被认为完全初始化了，此是第一阶段完成

// 从顶部初始化器往下，链中的每一个指定初始化器都有机会进一步定制实例。初始化器现在能够访问self并且可以修改他的属性，调用他的实例方法等等
// 最终，链中的任何便捷初始化器都有机会定制实例以及使用self

// 初始化器的继承和重写
// 不像在Objective-C中的子类，Swift的子类不会默认继承父类的初始化器。Swift的这种机制防止父类的简单初始化器被一个更专用的子类继承并被用来创建一个完全没有或错误初始化的新实例的情况发生。只有在特定情况下才会继承父类的初始化器
// 如果你想自定义子类来实现一个或多个和父类相同的初始化器，你可以在子类中为那些初始化器提供定制的实现。
// 当你写的子类初始化器匹配父亲指定初始化器的时候，你实际上可以重写那个初始化器。因此，在子类的初始化器定义之前你必须写override修饰符。如同默认初始化器所描述的那样，即使是自动提供的默认初始化器你也可以重写

// 初始化器的自动继承
/// 如果你的子类没有定义任何初始化器，他会自动继承父类所有的指定初始化器
/// 如果你的子类提供了所有父类指定初始化器的实现--要么是通过规则1继承来的，要么通过在定义中提供自定义实现的--那么它自动继承所有的父类便捷初始化器

// 可失败初始化器
// 定义类、结构体或枚举初始化时可以失败在某些情况下会管大用。这个失败可能由以下几种方式触发，包括给初始化传入无效的形式参数值，或缺少某种外部所需的资源，又或是其他阻止初始化的情况。
// 为了妥善处理这种可能失败的情况，在类、结构体或枚举中定义一个或多个可失败的初始化器。通过在init关键字后面添加问号（init？）来写

// 必要初始化器
/// 在类的初始化器前添加required修饰符来表明所有该类的子类都必须实现该初始化器

// 反初始化
// 在类实例被释放的时候，反初始化器就会立即被调用。你可以使用deinit关键字来写反初始化器，就如同写初始化器要用init关键字一样。反初始化器只在类类型中有效。
// 反初始化器会在实例被释放之前自动被调用。你不能自行调用反初始化器。父类的反初始化器可以被子类继承，并且子类的反初始化器实现结束之后父类的反初始化器会被调用。父类的反初始化器总会被调用，就算子类没有反初始化器

class Person2 {
    var name: String
    var age: Int
    
//    init(name: String, age: Int) {
//        self.name = name
//        self.age = age
//    }
    
    init?(name: String, age: Int) {
        if age > 200 {
            return nil
        }
        self.name = name
        self.age = age
    }
    
//    convenience init(age: Int) {
//        self.init(name: "[Unnamed]", age: age)
//    }
}

//class Teacher2: Person2 {
//    var salary: Int
//    
//    override init(name: String, age: Int) {
//        self.salary = 5000
//        super.init(name: name, age: age)
//    }
//    
//    init(name: String, age: Int, salary: Int) {
//        self.salary = salary
//        super.init(name: name, age: age)
//        self.test()
//        self.name = name + "老师"
//    }
//    
//    func test() {
//        print("teacher test")
//    }
//    
//    convenience init(salary: Int) {
//        self.init(name: "zhangsan", age: 30, salary: salary)
//        self.salary = self.salary + 1000
//    }
//}

//let teacher = Teacher2(age: 20)
let person = Person2(name: "zhangsan", age: 300)
print(person)
