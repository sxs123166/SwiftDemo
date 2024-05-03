import UIKit

var greeting = "Hello, playground"

// 创建数组

/// 字面量创建
/// 可以使用数组字面量来初始化一个数组，它是一种以数组集合来写一个或者多个值的简写方式。数组字面量写作一系列的值，用逗号分隔，用方括号括起来

let array = [1,2,3,4]

/// 创建空数组的时候必须携带类型信息
/// 如果内容已经提供了类型信息，比如说作为函数的实际参数或者已经分类了的变量或常量，你可以通过空数组字面量来创建一个空数组

var array1:[Int] = []
var array2:[String] = []

var array3 = [1,2,3,4]
print(array3)
array3 = []
print(array3)

// 初始化器
/// 使用初始化器有两种方式
///  类型[]()
///  Array<类型>()

var myArray = [String]()
var myArray2 = Array<String>()

// 初始化器参数
/// init() (repeating repeatedValue:Element,count:Int)
/// init(arrayLiteral elements:Element...)

let fiveZs = Array(repeating: "Z", count: 5)
print(fiveZs)

/// init<S>(_elements:S) where S:Sequence,Self.Element == S.Element
/// init(from decoder:Decoder) throws

let numbers = [Int](0...7)
print(numbers)
let persons = ["zhangsan": 27, "lisi": 28, "wangwu": 29]
let names = [String](persons.keys)
print(names)

// 数组遍历
/// For-In
/// ForEach方法
///   无法使用break或continue跳出或者跳过循环
///    使用return只能退出当前一次的循环体

// 同时得到索引和值 enumerated()
for (index, num) in numbers.enumerated(){
    print("the index is: \(index)")
    print(num * 10)
}

// 使用Iterator遍历数组
var numIterator = numbers.makeIterator()
while let num = numIterator.next() {
    print(num * 10)
}

// 索引
///  startIndex返回第一个元素的位置，对于数组来说，等同于count
///  endIndex返回最后一个元素索引+1的位置，对于数组来说，等同于count
///  如果数组为空，startIndex等于endIndex

/// indices获取数组的索引区间

for i in numbers.indices {
    print(numbers[i] * 10)
}


// 判断是否包含指定元素
/// contains(_:) 判断数组是否包含指定元素
/// contains(where:)判断数组是否包含符合给定条件的元素

// 判断所有元素符合某个条件
/// allsatisfy(_:)判断数组的每一个元素都符合给定的条件

var array4 = [10, 20, 45, 30, 98, 101, 30, 4]
print(array4.allSatisfy({ $0 > 10}))
print(array4.allSatisfy({ $0 >= 4}))

// 查找元素
/// first返回数组第一个元素（optional），如果数组为空，返回nil
/// last返回数组最后一个元素（optional），如果数组为空，返回nil
/// first(where:)返回数组第一个符合给定条件的元素（optional）
/// last(where:)返回数组最后一个符合给定条件的元素（optional）

print(array4.first)
print(array4.last)
print(array4.first(where: {$0 > 25}))
print(array4.last(where: {$0 > 25}))

// 查找索引
/// firstIndex(of:)返回给定的元素在数组中出现的第一个位置（optional）
/// lastIndex(of:)返回给定的元素在数组中出现的最后一个位置（optional）

print(array4.firstIndex(of: 30))
print(array4.lastIndex(of: 20))

/// firstIndex(where:)返回符合条件的第一个元素的位置（optional）
/// lastIndex(where:)返回符合条件的最后一个元素的位置（optional）

print(array4.firstIndex(where: {$0 > 25}))
print(array4.lastIndex(where: {$0 > 25}))


// 查找最大最小元素
/// min()返回数组中最小的元素
/// max()返回数组中最大的元素

var array5 = [10, 20, 45, 30, 98, 101, 30, 4]
print(array5.min())
print(array5.max())

/// min(by:)利用给定的方式比较元素并返回数组中的最小元素
/// max(by:)利用给定的方式比较元素并返回数组中的最大元素

var array6 = [(45, "error1"), (23, "error2"), (30, "error3")]
print(array6.min {a, b in a.0 < b.0 })
print(array6.max {a, b in a.0 < b.0 })

// 数组添加和删除
/// append(_:)在末尾添加一个元素
/// append(contentsOf:)在末尾添加多个元素

var numbers1 = [Int](2...7)
numbers1.append(100)
print(numbers1)

numbers1.append(contentsOf: 100...105)
print(numbers1)

// 在任意位置插入
/// insert(_:at:)在指定的位置插入一个元素
/// insert(contentsOf:at:)在指定位置插入多个元素

var numbers2 = [Int](2...7)
numbers2.insert(-1, at: 0)
print(numbers2)

numbers2.insert(contentsOf: -2...0, at: 0)

// 字符串也是Collection
/// 字符串也是Collection，Element是Character类型

//var chars: [Character] = ["a", "b", "c"]
//chars.insert(contentsOf: "hello", at: 0)
//print(chars)

// 移除单个元素
/// remove(at:)移除并返回指定位置的一个元素
/// removeFirst()移除并返回数组的第一个元素
/// popFirst()移除并返回数组的第一个元素（optional），数组为空返回nil

//var chars: [Character] = ["a", "b", "c", "d"]
//let removedChar = chars.remove(at: 1)
//print(removedChar)
//print(chars)
//
//var chars1: [Character] = ["a", "b", "c", "d"]
//let removedChar1 = chars1.removeFirst()
//print(removedChar1)
//print(chars1)

// 移除多个元素
/// removeFirst(:)移除数组前面多个元素
/// removeLast(:)移除数组后面多个元素

//var chars: [Character] = ["a", "b", "c", "d"]
//chars.removeFirst(2)
//print(chars)
//
//chars.removeLast(2)
//print(chars)

/// removeSubrange(_:)移除数组中给定范围的元素
/// removeAll()移除数组所有的元素
/// removeAll(keepingCapacity:)移除数组所有元素，保留数组容量
//var chars: [Character] = ["a", "b", "c", "d"]
//chars.removeSubrange(1...2)
//print(chars)

//var chars: [Character] = ["a", "b", "c", "d"]
//chars.removeAll()
//print(chars)
//print(chars.capacity)

var chars: [Character] = ["a", "b", "c", "d"]
chars.removeAll(keepingCapacity: true)
print(chars)
print(chars.capacity)
