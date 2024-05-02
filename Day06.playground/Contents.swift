import UIKit

var greeting = "Hello, playground"

// for-in循环
/// 使用for-in循环来遍历序列，比如一个范围中的数字，数组中的元素或者字符串中的字符

for i in 0...3 {
    print(i)
}

for c in "Hello,World" {
    print(c)
}

let names = ["zhangsan", "lisi", "wangwu", "zhaoliu"]
for name in names {
    print(name)
}

/// 当字典遍历时，每一个元素都返回一个（key, value）元组，你可以在for-in循环体中使用显式命名常量来分解（kay, value)元组成员

let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName) has \(legCount) legs")
}

for t in numberOfLegs {
    print("\(t.0) has \(t.1) legs")
}

/// 如果你不需要序列的每一个值，你可以使用下划线来取代遍历名以忽略值

let base = 3
let power = 5
var answer = 1
for _ in 1...power {
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)")

/// 使用stride(from:to:by:)函数来跳过不想要的区间（开区间）
/// 闭区间也同样适用，使用stride(from:through:by:)即可。

let minuteInterval = 5
for tickMark in stride(from: 0, to: 50, by: minuteInterval) {
    print(tickMark)
}

for tickMark in stride(from: 0, through: 50, by: minuteInterval) {
    print(tickMark)
}


// while循环
/// repeat-while循环
var count = 0
repeat {
    print(count)
    count += 1
}while count < 5


