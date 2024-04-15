import UIKit

// 一、常量和变量
/// 使用关键字 let 来声明 常量
/// 使用关键字 var 来声明 变量

let num1 = 10
var num2 = 11

//num1 = 1
num2 = 2

// 类型标注
/// 在声明一个变量或常量的时候提供类型标注， 来明确变量或常量能够存储值的类型
/// 添加标注的方法是在常量或者变量的后面加一个冒号，再跟一个空格，最后加上要是用的类型名称
/// 可以在一行中定义多个相关的变量为相同的类型，用逗号分隔，只要在最后的变量名字后面加上类型标注

var welcomeMessage: String
welcomeMessage = "Hello"
//welcomeMessage = 10

/// 常量和变量的名字几乎可以使用任何字符，甚至包括Unicode字符
/// 常量和变量的名字不能包含空白字符、数字符号、箭头、保留的（或者无效的）Unicode码位、连线和制表符。也不能以数字开头，尽管数字几乎可以使用在名字其他的任何地方

// 打印常量和变量
// print()

let 你好 = "你好"
print("欢迎语是\(你好)")

let x = 0.0, y = 0.0, z = "123"
print("x=\(x), y=\(y), z=\(z)")

let ab = "abc"

// 二、swift中的数值类型
/// swift提供了8，16，32和64位编码的有符号和无符号整数
/// 命名方式：例如8位无符号整数的类型是UInt8,32位有符号整数的类型是Int32
/// 通过min和max属性来访问每个整数类型的最小值和最大值

// 整数
/// swift提供了一个额外的整数类型：Int，他拥有与当前平台的原生字相同的长度
/// 同时Swift也提供UInt类型，来表示平台长度相关的无符号整数
/// 建议在用到整数的地方都使用Int

// 浮点型
/// Double：64位浮点数，至少有15位数字的精度
/// Float：32位浮点数，至少有6位数字的精度
/// 在两种类型都可以的情况下，推荐使用Double类型
///

// Bool
/// Bool:  true和false
/// Swift的类型安全机制会阻止你用一个非布尔量的值替换掉Bool

//let i = 1
//if i {   //会报错
//    print(i)
//}

// 类型别名
/// 类型别名是一个为已存在类型定义的一个可选择的名字
/// 可以用关键字 typealias 定义一个类型的别名
/// 当你想通过一个在上下文中看起来更合适更具有表达性的名字来引用一个已存在的类型时，这时别名就非常有用了

//typealias AudioSample = UInt8
//let sample: AudioSample = 32;


let a = 8
let b: UInt8 = 240
print("UInt8 min \(UInt8.min), UInt8 max \(UInt8.max)")

let i = 1
if i == 1 {
    print(i)
}

typealias AudioSample = UInt8
let sample: AudioSample = 32;


// 三、元组 Tuple
/// 元组把多个值合并成单一的复合型的值
/// 元祖内的值可以是任何类型，而且可以不必是同一类型

//let error = (1, "没有权限")
//print(error.0)
//print(error.1)

/// 元组中的每一个元素可以指定对应的元素名称
/// 如果没有指定名称的元素也可以使用下标的方式来引用

//let error = (errorCode: 1, errorMessage: "没有权限")
//print(error.errorCode)
//print(error.errorMessage)

// tuple修改
/// 用var定义的元组就是可变元组，let定义的就是不可变元组
/// 不管是可变还是不可变元组，元组在创建后就不能增加和删除元素
/// 可以对可变元组的元素进行修改，但是不能改变其类型
/// any类型可以更改为任何类型

//var error = (errorCode: 1, errorMessage: "没有权限")
//error.errorCode = 2
//error.errorMessage = "用户取消"

//var error:(Any, String) = (1, "没有权限")
//error.0 = 2
//print(error)
//error.0 = "abc"
//print(error)

// Tuple分解
/// 以将一个元组的内容分解成单独的常量或者变量
/// 如果只需要使用其中的一部分数据，不需要的数据可以使用下划线(_)代替

//let error = (1, "没有权限")
//let (errorCode, errorMessage) = error
//print(errorCode)
//print(errorMessage)
//
//let error = (1, "没有权限")
//let (_, errorMessage) = error
//print(errorMessage)

// 作为函数返回值
/// 使用Tuple为函数返回多个值
/// 返回值的Tuple可以在函数的返回类型部分被命名

//func writeToFile(content: String) -> (errorCode: Int, errorMessage: String) {
//    return(1, "没有权限")
//}

//var error: (errorCode: Int, errorMessage: Any) = (errorCode: 1, errorMessage: "没有权限")
//error.errorCode = 2
//error.errorMessage = "用户取消"
//error.errorMessage = 3


func writeToFile(content: String) -> (errorCode: Int, errorMessage: String) {
    return(1, "没有权限")
}

let error = writeToFile(content: "")
print(error)
