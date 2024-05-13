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

// 添加或更新元素
/// 使用下标添加或更新元素
/// 使用updateValue(_:forKey:)方法添加或更新元素，返回一个字典值类型的可选项值

// 移除元素
/// 使用下标脚本语法给一个键赋值nil来从字典当中一出一个键值对
/// 使用removeValue(forKey:)来从字典里移除键值对。这个方法移除键值对如果他们存在的话，并且返回移除的值，如果值不存在则返回nil

// 合并两个字典
///  merge(_:uniquequingKeysWith:)

var dictionary: Dictionary<String, Int> = ["a": 1, "b": 2]
dictionary.merge(["a": 3, "c": 4]) {(current, _) in current}
print(dictionary)
dictionary.merge(["a": 5, "d": 6]) {(_, new) in new}
print(dictionary)

// firstIndex
/// 虽然字典是无序的，但是每个kv对在扩容之前的位置是稳定的。如果你需要保持顺序的kv对可以使用KeyValuePairs

let imagePaths = ["star": "/glyphs/star.png",
                  "portrait": "/images/content/portrait.jpg",
                  "spacer": "/images/shared/spacer.gif"]

let glyphIndex = imagePaths.firstIndex(where: {
    $0.value.hasPrefix("/glyphs")
})

if let index = glyphIndex {
    print(index)
    print("The '\(imagePaths[index].key)' image is a glyph")
} else {
    print("No glyphs found")
}
 
let recordTimes: KeyValuePairs = ["Florence Griffith-Joyner": 10.49,
                                  "Evelyn Ashford": 10.76,
                                  "Evelyn Ashford": 10.79,
                                  "Marlies Gohr": 10.81]
print(recordTimes.first!)

var personDict = ["zhangsan": 18, "lisi": 19, "wangwu": 20]
personDict["zhangsan"] = nil
print(personDict)

// merging方法不会改变原本字典中的值, merge改变原字典中的值
var dict4 = ["a": 1, "b": 2]
print(dict4.merging(["a": 2, "c": 5], uniquingKeysWith: { (current, _) -> Int in current }))

print(dict4.merging(["a": 10, "d": 11], uniquingKeysWith: { (_, new ) -> Int in new }))

let index = dict4.firstIndex(where: { (_, value) -> Bool in
    value == 1
})
print(index)

dict4["c"] = 6
//dict4["d"] = 6
//dict4["e"] = 6
//dict4["f"] = 6
//dict4["g"] = 6
//dict4["h"] = 6

if let i = index {
    print(dict4[i].value)
}

let kvs: KeyValuePairs = ["a": 1, "b": 2, "c": 3]
print(kvs)
