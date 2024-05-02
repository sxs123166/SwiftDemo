import UIKit

var greeting = "Hello, playground"

// 控制转移

//continue
//break
//fallthrough
//return
//throw

// continue
/// continue语句告诉循环停止正在做的事情并且再次从头开始循环的下一次遍历。它是说“我不再继续当前的循环遍历了”而不是离开整个的循环

// break
/// break语句会立即结束整个控制流语句。当你想要提前结束switch或者循环语句或者其他情况时可以在switch语句或者循环语句中使用break语句
/// 当在循环语句中使用时，break会立即结束循环的执行，并且转移控制到循环结束花括号（}）后的第一行代码上，当前遍历循环里的其他代码都不会被执行，并且鱼虾的遍历循环也不会开始了
/// 当在switch语句里使用时，,break导致switch语句立即结束他的执行，并且转移控制到switch语句结束花括号(})之后的第一行代码上

// fallthrough
/// 如果你确实需要C或者Objective-C风格的贯穿行为，你可以选择在switch每个case末尾使用fallthrough关键字

let intergerToDescribe = 5
var description = "The number \(intergerToDescribe) is"
switch intergerToDescribe {
case 2,3,5,7,11,13,17,19:
    description += "a prime number, and also"
    fallthrough
default:
    description += " an integer."
}
print(description)

// 语句标签
/// 可以使用语句标签来给循环语句或者条件语句做标记。在一个条件语句中，你可以使用一个语句标签配合break语句来结束被标记的语句。
///  在循环语句中，你可以使用语句标签来配合break或者continue语句来结束或者继续执行被标记的语句

var number = 10
whileLoop : while number > 0 {
    switch number {
    case 9:
        print("9")
    case 10:
        var sum = 0
        for index in 0...10 {
            sum += index
            if(index == 9) {
                print(sum)
                break whileLoop
            }
        }
    default:
        break
    }
    number -= 1
}
