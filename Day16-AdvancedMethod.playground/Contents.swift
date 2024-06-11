import UIKit

var greeting = "Hello, playground"

// flatMap
// 对于元素是集合的集合，可以得到单级的集合

let results = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
let allResults = results.flatMap{ $0.map{ $0 > 10 }}
let passMarks = results.flatMap{ $0.filter{ $0 > 5 }}
print(allResults)
print(passMarks)

// compactMap
// 过滤空值
let keys: [String?] = ["zhangsan", nil, "Lisi", nil, "Wangwu"]
let ValidNames = keys.compactMap{ $0 }
print(ValidNames)
let counts = keys.compactMap{ $0?.count }
print(counts)


let numbers = [1, 2, 4, 5, 10]
// map
// 对于原始集合里的每一个元素，以一个变换后的元素替换之形成一个新的集合
print(numbers.map { $0 * 10 })
// filter
//对于原始集合里的每一个元素，通过判定来将其丢弃或者放进新集合
print(numbers.filter{ $0 > 10 })
//对于原始集合里的每一个元素，作用于当前累积的结果上
print(numbers.reduce(100) { $0 + $1 })

