import UIKit

var greeting = "Hello, playground"

// Dictionary
/// 字典储存无序的相互关联的同一类型的键和同一类型的值的集合
/// 字典类型的全写方式Dictionary<Key, Value>，简写方式[Key: Value]，建议使用简写方式
/// 字典的key必须是可哈希的

// 创建空字典
/// 初始器方式
/// 简写方式
/// 字面量方式

var dict1 = Dictionary<String, Int>()
var dict2 = [String: Int]()
var dict3: Dictionary<String, Int> = [:]


let dict = ["zhangsan": 18, "lisi": 19, "wangwu": 20]

// count和isEmpty
/// 可以使用count只读属性来找出Dictionary拥有多少元素
/// 使用布尔量isEmpty属性检查字典是否是空


// 遍历字典
/// For-In循环
/// 可以通过访问字典的keys和values属性来取回可遍历的字典的键或值的集合
/// Swift的Dictionary类型是无序的。要以特定的顺序遍历字典的键或值，使用键或值的sorted()方法

for (key, value) in dict {
    print("name \(key), age \(value)")
}

for key in dict.keys.sorted() {
    print("name \(key), age \(dict[key])")
}
