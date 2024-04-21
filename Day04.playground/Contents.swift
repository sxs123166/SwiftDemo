import UIKit

var greeting = "Hello, playground"

// 运算符

/// 一元运算符对一个目标进行操作。一元前缀运算符（如!b）,一元后缀运算符（b!）
/// 二元运算符对两个目标进行操作（比如a+b）同时因为它们出现在两个目标之间，所以是中缀
/// 三元运算符操作三个目标。Swift语言也仅有一个三元运算符，三元条件运算符（a?b:c）

// Swift运算符的改进
/// Swift在支持C中的大多数标准运算符的同时也增加了一些排除常见代码错误的能力：
///         赋值符号(=)不会返回值，以防他被误用于等于符号（==）的意图上
///         算数符号(+,-,*,/,%，以及其他)可以检测并阻止值溢出，以避免你在操作比存储类型允许的范围更大或者更小的数字时得到各种奇奇怪怪的结果


// 赋值运算符
/// 赋值运算符将一个值赋给另外一个值
/// 如果赋值符号右侧是拥有多个值的元组，他的元素将会一次性的拆分成常量或者变量
/// Swift的赋值符号自身不会返回值

// error
//var a = 1
//var b = 2
//if b = a {
//
//}

// 算术运算符-标准运算符
/// 标准算术运算符+ - * /
/// 加法运算符同时也支持String的拼接
/// Swift算术运算符默认不允许值溢出

// 算术运算符 - 余数运算符
/// 余数运算符（a%b）可以求出多少个b的倍数能够刚好放进a中并且返回剩下的值（就是我们所谓的余数）
/// 当a是负数时也使用相同的方法来进行计算
/// 当b为负数时它的正负号被忽略掉了。这意味着a%b与a%-b能够获得相同的答案

// 算术运算符-一元
/// 数字值的正负号可以用前缀-来切换，我们称之为一元减号运算符
/// 一元减号运算符（-）直接在要操作的值前面放置，不加任何空格
/// 一元加号运算符（+）直接返回它操作的值，不会对其进行任何的修改

print(9 % 4)
print(9 % -4)
print(-9 % 4)


// 溢出运算符
/// 在默认情况下，当向一个整数赋超过他容量的值时，swift会报错而不是生成一个无效的数，给我们操作过大或者过小的数的时候提供了额外的安全性
/// 同时提供三个算术溢出运算符来让系统支持整数溢出运算
///   溢出加法（&+）
///   溢出减法（&-）
///   溢出乘法（&*）

// 值溢出
/// 溢出也会发生在有符号整形数值上
/// 对于无符号与有符号整型数值来说，当出现上溢时，他们会从数值所能容纳的最大数变成最小的数。同样的，当发生下溢时，他们会从所能容纳的最小数变成最大的数

//var num1: UInt8 = 251
//var num2 = num1 &+ 20
//print("num2: \(num2)")

//var num1: UInt8 = 0
//var num2 = num1 &- 1
//print("num2: \(num2)")

// 循环 0 &- 1 ->255

var num1: Int8 = -128
var num2 = num1 &- 1
print("num2: \(num2)")

// 合并空值运算符
/// 合并空值运算符（a ?? b）如果可选项a有值则展开如果没有值，是nil,则返回默认值b
/// 表达式a必须是一个可选类型。表达式b必须与a的储存类型相同
/// 实际上是三元运算符作用到Optional上的缩写(a!=nil?a!:b)
/// 如果a的值是非空的，b的值将不会被考虑，也就是合并空值运算符是短路的

//func addTwoNum(num1: Int?, num2: Int?) -> Int {
////    return num1! + num2!
//
//    if num1 != nil {
//        if num2 != nil {
//            return num1! + num2!
//        } else {
//            return num1!
//        }
//    } else {
//        if num2 != nil {
//            return num2!
//        } else {
//            return 0
//        }
//    }
//
//    return (num1 ?? 0) + (num2 ?? 0)
//}

let a: Int? = nil
print(a ?? 8)


// 区间运算符
/// 闭区间运算符
/// 闭区间运算符（a...b）定义了从a到b的一组范围，并且包含a和b。a的值不能大于b
for index in 1...5 {
    print("\(index) time 5 is \(index * 5)")
}

// 半开区间运算符
/// 半开区间运算符（a..<b）定义了从a到b但不包括b的区间
/// 如同闭区间运算符，a的值也不能大于b，如果a与b的值相等，那返回的区间将会是空的

let names = ["zhangsan", "lisi", "wangwu", "zhaoliu"]
let count = names.count
for i in 0..<count {
    print("Person \(i + 1) is called \(names[i])")
}

// 单侧区间
/// 闭区间有另外一种形式来让区间朝一个方向尽可能的远，这种区间叫做单侧区间
/// 半开区间运算符同样可以有单侧形式，只需要写他最终的值
/// 比如说，一个包含数组所有元素的区间，从索引2到数组的结束。在这种情况下，你可以省略区间运算符一侧的值

for name in names[2...] {
    print(name)
}
print("-----------")
for name in names[...2] {
    print(name)
}
print("-----------")
for name in names[..<2] {
    print(name)
}

/// 单侧区间可以在其他上下文中使用，不仅仅是下标
/// 不能遍历省略了第一个值的单侧区间，因为遍历根本不知道该从哪里开始。你可以遍历省略了最终值的单侧区间

//let range = ...5
//range.contains(7)
//range.contains(4)
//range.contains(-1)

// 字符串范围也可以使用区间运算符

//var welcome = "hello,world"
//let range = welcome.index(welcome.endIndex, offsetBy: -6) ..< welcome.endIndex
//welcome.removeSubrange(range)

// 倒序索引
/// 通过reversed()方法，我们可以将一个正序循环变成逆序循环
for i in (0..<10).reversed(){
    print(i)
}

// Comparable区间
/// 区间运算符可以作用在Comparable类型上，返回闭区间和半闭区间
let welcome = "hello, world"
let interval = "a"..."z"
for c in welcome {
    if !interval.contains(String(c)) {
        print("\(c)不是小写字母")
    }
}
