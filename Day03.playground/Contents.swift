import UIKit

var greeting = "Hello, playground"

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
