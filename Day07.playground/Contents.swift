import UIKit

var greeting = "Hello, playground"

// switch

/// switch语句会将一个值与多个可能的模式匹配。然后基于第一个成功匹配的模式来执行合适的代码块。
/// switch语句一定得是全面的。就是说，给定类型里每一个值都值得被考虑并且匹配到一个switch的case。如果无法提供一个switch case所有可能的值，你可以
/// 定义一个默认匹配所有的case来匹配所有未明确出来的值。这个匹配所有的情况用关键字default标记，并且必须在所有case的最后出现

/// swift需要写default,不然会报错 (值绑定可以不写)

/// 没有隐式贯穿
/// 相比于C和Objective-C里的switch语句来说，Swift里的switch语句不会默认从匹配case的末尾贯穿到下一个case里
/// 相反，整个switch语句会在匹配到第一个switch的case执行完毕之后退出，不再需要显式的break语句

let someCharacter: Character = "z"
switch someCharacter {
case "a":
    print("The first letter of the alphabet")
case "z":
    print("The last letter of the alphabet")
default:
    print("some other character")
}

/// 每一个case的函数体必须包含至少一个可执行的语句
/// 在一个switch的case中匹配多个值可以用逗号分隔，并且可以写成多行

let anotherCharacter: Character = "a"
switch anotherCharacter {
case "a", "A":
    print("The letter A")
default:
    print("Not the letter A")
}

// 区间匹配
let approximateCount = 62
let countedThings = "moons orbiting Saturn"
var naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).")


// 元组匹配
/// 你可以使用元组来在一个switch语句中测试多个值
/// 使用下划线（_）来表明匹配所有可能的值

let somePoint = (1,1)
switch somePoint {
case (0, 0):
    print("(0,0) is at the origin")
case (_, 0):
    print("(\(somePoint.0), 0) is on the x-axis")
case (0, _):
    print("(0, \(somePoint.1) is on the y-axis")
case (-2...2, -2...2):
    print("(\(somePoint.0), \(somePoint.1)) is inside the box")
default:
    print("(\(somePoint.0), \(somePoint.1)) is outside of the box")
}

// 值绑定
/// switch的case可以将匹配到的值临时绑定一个常量或者变量，来给case的函数体使用
/// 如果使用var关键字，临时的变量就会以合适的值来创建并初始化。对这个变量的任何改变都只会在case的函数体内有效

let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y)")
}

/// where子句
/// switch case可以使用where分句来检查是否符合特定的约束

let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x,y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}

// 复合匹配
/// 多种情形共享同一个函数体的多个情况可以在case后写多个模式来复合，在每个模式之间用逗号分隔。如果任何一个模式匹配了，那么这个情况就会被认为是匹配的
/// 如果模式太长，可以吧他们写成多行

let someCharacter1: Character = "e"
switch someCharacter1 {
case "a","e","i","o","u":
    print("\(someCharacter1) is a vowel")
case "b","c","d","f","g","h","j","k","l","m",
    "n","p","q","r","s","t","v","w","x","y","z":
    print("\(someCharacter1) is a consonant")
default:
    print("\(someCharacter1) is not a vowel or a consonant")
}

//复合匹配-值绑定
/// 复合匹配同样可以包含值绑定。所有复合匹配的模式都必须包含相同的值绑定集合，并且复合情况中的每一个绑定都得有相同的类型格式。
/// 这才能确保无论复合匹配的那部分命中了，接下来的函数体中的代码都能访问到绑定的值并且值的类型也都相同

let stillAnotherPoint = (9, 0)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("On an Axis, \(distance) from the origin")
default:
    print("Not on an axis")
}

