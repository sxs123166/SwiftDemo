import UIKit

// 字符串相关

/// 字面量
/// 初始化器语法
/// isEmpty检查是否为空串

var emptyString = ""
var anotherEmptyString = String()

if emptyString.isEmpty {
    print("Nothing to see here")
}

// 字面量
/// 字符串字面量是被双引号（”）包裹的固定顺序文本字符
/// Swift会为str常量推断类型为string

let str = "some string"

// 多行字面量
/// 多行字符串字面量使用三个双引号引起来的一系列字符
/// 多行字符串字面量把所有行包括在引号内，开始和结束默认不会有换行符
/// 当你的代码中在多行字符串字面量里包含了换行，那个换行符同样会成为字符串里的值。如果你想使用换行符来让你的代码易读，却不想让换行符成为字符串里的值，那就在末尾使用反斜杠（\）

let str1 = """
           some string
           some string
           """

let str2 = """
           some string \
           some string
           """

// 字符串里的特殊字符
/// 转义特殊字符\0（空字符），\\（反斜杠），\t（水平制表符），\n（换行符）,\r(回车符)，\"（双引号）以及\'（单引号）
/// 任意的Unicode标量，写作\u{n}，里边的n是一个1-8位的16进制数字，其值是合法Unicode值
/// 可以在多行字符串字面量中包含双引号（"）而不需转义。要在多行字符串中包含文本"",转义至少一个双引号
let wiseWords = "\" Imagination is more important than knowledge\" - Einstain"
let dollarSign = "\u{24}"
let blackHeart = "\u{2665}"
let sparklingHeart = "\u{1F496}"

// 扩展字符串分隔符
/// 在字符串字面量中放置扩展分隔符来在字符串中包含特殊字符而不让它们真的生效
/// 把字符串放在双引号（“）内并由（#）包裹
/// 如果字符串里有“#则首尾需要两个##
/// 如果你需要字符串中某个特殊符号的效果，使用匹配你包裹的井号数量的井号并在前面写转义符号\

let str3 = #"Line 1\nLine2 "#
let str4 = #"Line 1\#nLine2"#
let str5 = ###"Line 1\###nLine2"###
print(str3)
print(str4)
print(str5)

   let numbers = """
   1
   2\
      3
   4
   5
   """
print(numbers)

let str6 = ##"1"#2\#n3"##


// 字符串的常见操作
/// var指定的可以修改
/// let指定的不可修改
/// 对比Objective-C(NSString和NSMutableString)

var str7 = "Horse"
str7 += "+ carriage"
print(str7)

// error
//let constStr = "High"
//constStr += "Another High"

// 字符串是值类型
/// string值在传递给方法或者函数的时候会被复制过去
/// 赋值给常量或者变量的时候也一样
/// Swift编译器优化了字符串使用的资源，实际上拷贝只会在确实需要的时候进行（字符串更改的时候）

var str8: String = "abc"
var str9 = str8
print(str8 == str9)
str8 += "def"
print(str8)
print(str9)
print(str8 == str9)

// 操作字符
/// for-in循环遍历String中每一个独立的Character
/// Character类型
/// String值可以通过传入Character数组来构造

for character in "Dog!🐶" {
    print(character)
}

let catCharacters: [Character] = ["C",
"a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString)

// 字符串拼接
/// 使用加运算符(+)创建新的字符串
/// 使用加赋值符号（+=）在已经存在的String值末尾追加一个String值
/// 使用String类型的append()方法来给一个String变量的末尾追加Character值

// 字符串插值
/// 字符串插值是一种从混合常量、变量、字面量和表达式的字符串字面量构造新String值的方法
/// 每一个你插入到字符串字面量的元素都要被一对圆括号包裹，然后使用反斜杠前缀
/// 类似于NSString的stringWithFormat方法，但是更加简便，更强大

let multiplier = 3
let message = "\(multiplier) time 2.5 is \(Double(multiplier) * 2.5)"

print(#"Write an interpolated string in Swift using \(multiplier)."#)
print(#"6 times 7 is \#(6 * 7)"#)

// 字符串索引
/// 每一个String都有相关的索引类型，String.Index,它相当于每个Character在字符串中的位置
/// startIndex属性来访问String中第一个Character的位置。endIndex属性就是String中最后一个字符后的位置
/// endIndex属性并不是字符串下标脚本的合法实际参数
/// 如果String为空，则startIndex与endIndex相等

let greeting = "Guten Tag!"
greeting[greeting.startIndex]

// error
//greeting[1]

/// 使用index(before:)和index(after:)方法来访问给定索引的前后
/// 要访问给定索引更远的索引，你可以使用index(_:offsetBy:)
/// 要使用indices属性来访问字符串中每个字符的索引

//greeting[greeting.startIndex]
//greeting[greeting.index(before: greeting.endIndex)]
//greeting[greeting.index(after: greeting.startIndex)]
//let index = greeting.index(greeting.startIndex, offsetBy: 7)
//greeting[index]

// 插入
/// 插入字符，使用insert(_:at:)方法
/// 插入另一个字符串的内容到特定的索引，使用insert(contentsOf:at:)方法

//var welcome = "hello"
//welcome.insert("!", at: welcome.endIndex)
//
//welcome.insert(contentsOf: " there", at: welcome.index(before: welcome.endIndex))

// 删除
/// 移除字符，使用remove(at:)方法
/// 移除一小段特定范围的字符串，使用removeSubrange(_:)方法

//welcome.remove(at: welcome.index(before: welcome.endIndex))
//print(welcome)
//let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex //构造区间
//welcome.removeSubrange(range)
//print(welcome)


// 子字符串
/// 使用下标或者类似prefix(_:)的方法得到的子字符串是SubString类型
/// Substring拥有String的大部分方法
/// Substring可以转换成String类型

let greeting2 = "Hello,world"
let index = greeting2.firstIndex(of: ",") ?? greeting.endIndex
let beginning = greeting2[..<index]
let newString = String(beginning)

/// 子字符串重用一部分原字符串的内存
/// 修改字符串或者子字符串之前都不需要花费拷贝内存的代价
/// String和Substring都遵循StringProtocol协议，也就是说它基本上能很方便的兼容所有接受StringProtocol值的字符串操作函数


// 字符串比较
/// 字符串和字符串相等性（== 和 !=）
/// 前缀相等性 hasPrefix(_:)
/// 后缀相等性 hasSuffix(_:)

var welcome = "hello world"
var welcome1 = "hello world"
print(welcome == welcome1)
print(welcome.hasPrefix("hello"))
print(welcome.hasSuffix("world"))
