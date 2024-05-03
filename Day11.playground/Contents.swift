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

var chars: [Character] = ["a", "b", "c", "d"]
chars.removeFirst(2)
print(chars)

chars.removeLast(2)
print(chars)

let num = chars.popLast()
print(num)
print(chars)

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

//var chars: [Character] = ["a", "b", "c", "d"]
//chars.removeAll(keepingCapacity: true)
//print(chars)
//print(chars.capacity)


// ArraySlice
/// ArraySlice是数组或者其他ArraySlice的一段连续切片，和原数组共享内存
/// 当要改变ArraySlice的时候，ArraySlice会copy出来，形成单独内存
/// ArraySlice拥有和Array基本完全类似的方法

// 通过Drop得到ArraySlice
/// dropFirst(:)“移除”原数组前面指定个数的元素得到一个ArraySlice
/// dropLast(:)"移除"原数组后面指定个数的元素得到一个ArraySlice
/// drop(:)“移除”原数组符合指定条件的元素得到一个ArraySlice

let array7 = [5, 2, 10, 1, 0, 100, 46, 99]
array7.dropFirst()
array7.dropFirst(3)
array7.dropLast()
array7.dropLast(3)
print(array7.drop { $0 < 15 })

// 通过prefix 得到ArraySlice
/// prefix()获取数组前面指定个数的元素组成的ArraySlice
/// prefix(upTo:)获取数组到指定位置（不包含指定位置）前面的元素组成的ArraySlice
/// prefix(through:)获取数组到指定位置（包含指定位置）前面的元素组成的ArraySlice
/// prefix(while:)获取数组前面符合条件的元素（到第一个不符合条件的元素截止）组成的ArraySlice

let array8 = [5, 2, 10, 1, 0, 100, 46, 99]
array8.prefix(4)
array8.prefix(upTo: 4)
array8.prefix(through: 4)
print(array8.prefix { $0 < 10 })

// 通过suffix得到数组切片
/// suffix()获取数组后面指定个数的元素组成的ArraySlice
/// suffix(from:)获取数组从指定位置到结尾（包含指定位置）的元素组成的ArraySlice

let array9 = [5, 2, 10, 1, 0, 100, 46, 99]
array9.suffix(3)
array9.suffix(from: 5)


// 通过Range得到ArraySlice
/// 可以通过对数组下标指定Range获取ArraySlice，可以使用闭区间、半开半闭区间、单侧区间、甚至可以只使用...来获取整个数组组成的ArraySlice

let array10 = [5, 2, 10, 1, 0, 100, 46, 99]
array10[3...5]
array10[3..<5]
array10[...2]
array10[..<2]
array10[6...]
array10[...]

// ArraySlice转为Array
/// ArraySlice无法直接赋值给一个Array的常量或者变量，需要使用Array(slice)

var array11 = [5, 2, 10, 1, 0, 100, 46, 99]
let slice = array11[3...5]
array11 = Array(slice)

// ArraySlice和原Array相互独立

var array12 = [10, 46, 99]
var slice1 = array12.dropLast()
array12.append(333)
print(slice1)
slice1.append(555)
print(array12)


// 数组元素的随机化
/// shuffle()在原数组基础上将数组元素打乱，只能坐拥在数组变量上
/// shuffled()返回原数组的随机化数组，可以作用在数组变量和常量上

var array13 = [Int](1...8)
array13.shuffle()
print(array13)

let array14 = [Int](1...8)
var array15 = array14.shuffled()
print(array15)


// 数组的逆序
/// reverse()在原数组上将数组逆序，只能作用在数组变量上
/// reveresd()返回数组的逆序“集合表示”，可以作用在数组变量和常量上，该方法不会分配新内存空间
var array16 = [Int](1...8)
array16.reverse()
print(array16)

let array17 = [Int](1...8)
var array18 = array17.reversed()
print(array18)


// 数组的分组
/// partition(by belongsInSecondPartition:(Element) throws -> Bool) 将数组以某个条件分组，数组前半部分都是不符合条件的元素，数组后半部分都是符合条件的元素

var array19 = [10, 20, 45, 30, 98, 101, 30, 4]
let index = array19.partition{(element) -> Bool in element > 30 }
print(array19)
let partition1 = array19[..<index]
let partition2 = array19[index...]
print(partition1)
print(partition2)

/// shuffle和partition是不稳定的分组，即原本的先后顺序会被随机的改变


// 数组的排序
/// sort()在原数组上将元素排序，只能作用于数组变量
/// sorted返回原数组的排序结果数组，可以作用在数组变量和常量上

var array20 = [10, 20, 45, 30, 98, 101, 30, 4]
array20.sort()
print(array20)

let array21 = [10, 20, 45, 30, 98, 101, 30, 4]
let array22 = array21.sorted()
print(array22)

// 交换数组的两个元素
/// swap(_:_:)交换指定位置的两个元素

var array23 = [10, 20, 45, 30, 98, 101, 30, 4]
array23.swapAt(array23.startIndex, array.endIndex - 1)
print(array23)



// 字符串数组拼接
/// joined()拼接字符串数组里的所有元素为一个字符串
/// joined(separator:)以给定的分隔符拼接字符串数组里的所有元素为一个字符串

var array24 = ["hello", "world"]
print(array24.joined())
print(array24.joined(separator: ","))


// 元素为Sequence数组的拼接
/// joined()拼接数组里的所有元素为一个更大的Sequence
/// joined(separator:)以给定的分隔符拼接数组里的所有元素为一个更大的Sequence

let ranges = [0..<3, 8..<10, 15..<17]
for range in ranges {
    print(range)
}
for i in ranges.joined() {
    print(i)
}


let nestedNumbers = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
let joined = nestedNumbers.joined(separator: [-1, -2])
print(Array(joined))
