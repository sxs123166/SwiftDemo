import UIKit

var greeting = "Hello, playground"

// 闭包是可以在你的代码中被传递和引用的功能性独立代码块

// 闭包能够捕获和存储定义在其上下文中的任何常量和变量的引用，这也是所谓的闭合并包裹那些常量和变量，因此被称作闭包，SWift能够为你处理所有关于捕获的内存管理的操作

// 闭包的概念
// 在函数的章节中有介绍的全聚合内嵌函数，实际上是特殊的闭包。闭包符合如下三种形式的一种：
// 1。全剧函数是一个有名字但不会捕获任何值得闭包
// 2.内嵌函数是一个有名字且能从其上层函数捕获值的闭包
// 3.闭包表达式是一个轻量级语法所写的可以捕获其上下文中常量或变量值的没有名字的闭包


let names = ["zhangsan", "lisi", "wangwu", "zhaoliu"]
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
//var reversedNames = names.sorted(by: backward)
//print(reversedNames)

// 闭包表达式语法
// 闭包表达式语法能够使用常量形式参数、变量形式参数和输入输出形式参数，但不能提供默认值。可变形式参数也能使用，但需要在形式参数列表的最后面使用。元祖也可被用来作为形式参数和返回类型

//{
//    (parameters) -> (return type) in
//    statements
//}

//var reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
//    return s1 > s2
//})
//print(reversedNames)

//var reversedNames = names.sorted(by: { s1, s2 in
//    return s1 > s2
//})

//var reversedNames = names.sorted(by: { s1, s2 in s1 > s2 })

//var reversedNames = names.sorted(by: { $0 > $1 })

//var reversedNames = names.sorted(by: > )

var reversedNames = names.sorted{ $0 > $1 }


// 捕获值
// 一个闭包能够从上下文捕获已被定义的常量和变量。即使定义这些常量和变量的原作用域已经不存在，闭包仍然能够在其函数体内引用和修改这些变量值

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

// 做为一种优化，如果一个值没有改变或者在闭包的外面，Swift可能会使用这个值得拷贝而不是捕获
// Swift也处理了变量的内存管理操作，当变量不再需要时会被释放

let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()
incrementByTen()
incrementByTen()

// 如果你建立了第二个incrementer,它将会有一个新的、独立的runningTotal变量的引用
let incrementBySenven = makeIncrementer(forIncrement: 7)
incrementBySenven()

incrementByTen()

// 在Swift中，函数和闭包都是引用类型
//无论你什么时候赋值一个函数或者闭包给常量或者变量，你实际上都是将常量和变量设置为对函数和闭包的引用

let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()

// 如果你分配了一个闭包给类实例的属性，并且闭包通过引用该实例或者它的成员来捕获实例，你将在闭包和实例间会产生循环引用


// 逃逸闭包
// 当闭包作为一个实际参数传递给一个函数的时候，并且他会在函数返回之后调用，我们就说这个闭包逃逸了。当你声明一个接受闭包作为形式参数的函数时，你可以在形式参数前写@escaping来明确闭包是允许逃逸的
// 闭包可以逃逸的一种方法是被储存在定义于函数外的变量里。比如说，很多函数接受闭包实际参数来作为启动异步任务的回调。函数在启动任务后返回，但是闭包要直到任务完成--闭包需要逃逸，以便于稍后调用

var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping() -> Void) {
    completionHandlers.append(completionHandler)
}

// 让闭包@escaping 意味着你必须在闭包中显式的引用self
func someFunctionWithNonescapingClosure( closure: () -> Void) {
    closure()
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
    
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)

completionHandlers.first?()
print(instance.x)

// 自动闭包
// 自动闭包是一种自动创建的用来把作为实际参数传递给函数的表达式打包的闭包。它不接受任何实际参数，并且当他被调用时，它会返回内部打包的表达式的值
// 这个语法的好处在于通过写普通表达式代替显式闭包而使你省略包围函数形式参数的括号

public func assert(_ condition: @autoclosure () -> Bool, _ message: @autoclosure () -> String = String(), file: StaticString = #file, line: UInt = #line) {}

let number = 3
assert(number > 3, "number不大于3")

// 自动闭包允许你延迟处理，因此闭包内部的代码直到你调用它的时候才会运行。对于有副作用或者占用资源的代码来说很有用，因为它可以允许你控制代码何时进行求值

var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)

let customerProvider = { customersInLine.remove(at: 0) }
print(customersInLine.count)

print("Now serving \(customerProvider())!")
print(customersInLine.count)

// 当你传一个闭包作为实际参数到函数的时候，你会得到与延迟处理相同的行为
func serve(customer cusomerProvider: () -> String) {
    print("Now serving \(cusomerProvider())!")
}

serve(customer: { customersInLine.remove(at: 0) })
