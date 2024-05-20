import UIKit

var greeting = "Hello, playground"

// 函数的定义

func greet(person: String) -> String {
    let greeting = "Hello," + person + "!"
    return greeting
}


func sayHelloWorld() -> String {
    return "hello, world"
}
print(sayHelloWorld())

//func greet(person: String, alreadyGreeted: Bool) -> {
//    if alreadyGreeted {
//        return greetAgain(person: person)
//    } else {
//        return greet(person: person)
//    }
//}
//print(greet(person: "Tim", alreadyGreeted: true))

//func greet(person: String) {
//    print("Hello, \(person)!")
//}
greet(person: "Dave")


func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if(value < currentMin) {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
 
func minMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if(value < currentMin) {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

if let bounds = minMax(array: [8, -6, 2, 109, 3, 71]) {
    print("min is \(bounds.min) and max is \(bounds.max)")
}

// 隐式返回的函数
/// 如果整个函数体是一个单一表达式，那么函数隐式返回这个表达式
func greeting(for person: String) -> String {
    "Hello," + person + "!"
}
print(greeting(for: "Dave"))

func anotherGreeting(for person: String) -> String {
    return "Hello," + person + "!"
}
 print(anotherGreeting(for: "Dave"))

// 函数的实际参数标签和形式参数名
/// 每一个函数的形式参数都包含实际参数标签和形式参数名。实际参数标签用在调用函数的时候，在调用函数的时候每一个实际参数前边都要写实际参数标签。形式参数名用在函数的实现当中。默认情况下，形式参数使用他们的形式参数名作为实际参数标签
/// 所有的形式参数必须有唯一的名字。尽管有可能多个形式参数拥有相同的实际参数标签，唯一的实际参数标签有助于让代码更易读

// 指定实际参数标签
///  在提供形式参数名之前写实际参数标签，用空格分隔
///   如果你为一个形式参数提供了实际参数标签，那么这个实际参数就必须在调用函数的时候使用标签
///   实际参数标签的使用能呕让函数的调用更加明确，更像是自然语句，同时还能提供更可读的函数体病更清晰的表达你的意图

/// from： 实际参数标签， person：形式参数名
func greet2(person: String, from hometown: String) -> String {
    return "Hello \(person)! Glad you could vist from \(hometown)"
}

print(greet2(person: "Bill", from: "Cupertino"))

// 省略实际参数标签
/// 如果对于函数的形式参数不想使用实际参数标签的话，可以使用下划线(_)来为这个形式参数代替显式的实际参数标签

func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
    
}
someFunction(1, secondParameterName: 2)


// 默认形式参数值
/// 你可以通过在形式参数后给形式参数敷一个值来给函数的任意形式参数定义一个默认值
/// 如果定义了默认值，你就可以在调用函数时候省略这个形式参数

func someFunction2(parameterWithDefault: Int = 12) {
    
}
someFunction2(parameterWithDefault: 6)
someFunction2()

// 可变形式参数
/// 一个可变形式参数可以接受零或多个类型的值。当调用函数的时候你可以利用可变形式参数来生命形式参数可以背传入值的数量是可变的。可以通过在形式参数的类型名称后面插入三个点符号（...）来书写可变形式的参数
/// 传入到可变形式参数中的值在函数的主题中被当作是对应类型的数组

func aritmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
aritmeticMean(1, 2, 3, 4, 5)
aritmeticMean(3, 8.25, 18.75)

// 输入输出函数
/// 可变形式参数只能在函数内部做改变。如果你想函数能够修改一个形式参数值，而且你想这些改变在函数结束之后仍然生效，那么就需要将形式参数定义为输入输出形式参数
/// 在形式参数定义开始的时候在前边添加一个inout关键字可以定义一个输入输出形式参数。输入输出形式参数有一个能输入给函数的值，函数能对其进行修改，还能输出到函数外边替换原来的值
/// 你只能把变量做为输入输出形式参数的实际参数，再将变量做为实际参数传递给输入输出形式参数的时候，直接在它前边添加一个和符号（&）来明确可以被函数修改
/// 输入输出形式参数不能有默认值，可变形式参数不能标记为inout

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

func addTwoNumber(_ num1: Int, _ num2: Int = 10) -> Int {
    return num1 + num2
}

func addNumbers(nums: Int...) -> Int {
    var sum = 0
    for num in nums {
        sum += num
    }
    return sum
}

print(addNumbers(nums: 1, 2, 3, 4, 5))

var n1 = 10
var n2 = 20

func swapTwoNumber(n1: inout Int, n2:  inout Int) {
    var temp = n1
    n1 = n2
    n2 = temp
}

swapTwoNumber(n1: &n1, n2: &n2)

print(n1)
print(n2)


// 函数类型
/// 每一个函数都有一个特定的函数类型，他由形式参数类型，返回类型组成

func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a+b
}

func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

//(Int, Int) -> Int


// 你可以像使用Swift中的其他类型一样使用函数类型。例如，你可以给一个常量或者变量定义一个函数类型，并且为变量指定一个相应的函数

func addTwoNumber(first num: Int,second num2: Int) -> Int {
    return num + num2
}

var mathFunction: (Int, Int) -> Int = addTwoNumber(_:_:)
print(mathFunction(2, 3))


// 返回值为空时需要加一个空括号
let swapFunc: (inout Int, inout Int) -> () = swapTwoNumber

// 函数类型作为形式参数类型
/// 你可以利用使用一个函数的类型例如（Int, Int）-> Int作为其他函数的形式参数类型。这允许你预留函数的部分实现从而让函数的调用者在调用函数的时候提供

func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}

printMathResult(addTwoInts(_:_:), 3, 5)

// 函数作为返回类型
/// 你可以利用函数的类型作为另一个函数的返回类型。写法是在函数的返回箭头（->）后立即写一个完整的函数类型

//func stepForward(_ input: Int) -> Int {
//    return input + 1
//}
//
//func stepBackward(_ input: Int) -> Int {
//    return input - 1
//}
//
//func chooseStepfunction(backwards: Bool) -> (Int) -> Int {
//    return backwards ? stepBackward(_:) : stepForward(_:)
//}


//var currentValue = 3
//let moveNearerToZero = chooseStepfunction(backwards: currentValue > 0)


//print("Counting to Zero:")
//while currentValue != 0 {
//    print("\(currentValue)...")
//    currentValue = moveNearerToZero(currentValue)
//}
//print("zero!")

// 内嵌函数
/// 可以在函数的内部定义另外一个函数。这就是内嵌函数
/// 内嵌函数在默认情况下在外部是被隐藏起来的，但却仍然可以通过包裹他们的函数来调用他们。包裹的函数也可以返回它内部的一个内嵌函数来在另外的范围里使用

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward(input:) : stepForward(input:)
}
var currentValue = -4
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
while currentValue != 0 {
    print("\(currentValue)...")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")
