import UIKit

var greeting = "Hello, playground"

// Set的概念
/// set是指某种具有特定性质的具体的或抽象的对象汇总而成的集体。其中，构成Set的这些对象则称为该Set的元素

// 集合的三个特性
/// 确定性：给定一个集合，任给一个元素，该元素或者属于或者不属于该集合，二者必居其一
/// 互斥性：一个集合中，任何两个元素都认为是不相同的，即每个元素只能出现一次
/// 无序性：一个集合中，每个元素的地位都是相同的，元素之间是无序的

/// Swift的集合类型写作Set<Element>，这里的Element是Set要存储的类型。不同于数组，集合没有等价的简写

// 创建Set
/// 使用初始化器语法来创建一个确定类型的空Set
/// 使用数组字面量创建Set

//var letters = Set<Character>()
//letters.insert("c")
//print(letters)
//
//var course: Set<String> = ["Math", "English", "History"]
//course.insert("History")
//print(course)

// Set类型的哈希值
/// 为了能让类型存储在Set中，它必须是可哈希的--就是说类型必须提供它计算自身哈希值的方法
/// 所有的Swift的基础类型（比如String,Int,Double和Bool）默认都是可哈希的，并且可以用于Set或者Dictionary的键

/// 自定义类型需要实现Hashable协议
//struct Person {
//    var name: String
//    var age: Int
//}
//
//extension Person: Hashable {
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(name)
//        hasher.combine(age)
//    }
//}
//
//var personSet = Set<Person>()
//personSet.insert(Person(name: "zhangsan", age: 28))


// 访问和修改Set
/// 可以使用for-in遍历Set
/// 因为Set是无序的，如果要顺序遍历Set，使用sorted()方法

/// 使用count获取Set里元素个数
/// 使用isEmpty判断Set是否为空

// 添加元素
/// insert(_:)Tina加一个元素到Set
/// update(with:)如果已经有相等的元素，替换为新元素。如果Set中没有，则插入

// 移除元素
/// filter(_:)返回一个新的Set,新Set的元素是原始Set符合条件的元素
/// remove(_:)从Set当中移除一个元素，如果元素是Set的成员就移除它，并且返回移除的值，如果合集没有这个成员就返回nil
/// removeAll()移除所有元素
/// removeFirst()移除Set的第一个元素，因为Set是无序的，所以第一个元素并不是放入的第一个元素

let course: Set = ["Math", "english", "History"]
for c in course {
    print(c)
}

for c in course.sorted() {
    print(c)
}

struct Person {
    var name: String
    var age: Int
}

extension Person: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(age)
    }
}

extension Person: Equatable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.name == rhs.name
    }
}

// 两个元素hashable和equatable都符合时，才会进行更新

var personSet: Set<Person> = [Person(name: "zhangsan", age: 20), Person(name: "lisi", age: 29)]
personSet.update(with: Person(name: "zhangsan", age: 35))
personSet.update(with: Person(name: "wangwu", age: 18))
print(personSet)
let person = personSet.removeFirst()
print(person)
let person1 = personSet.remove(Person(name: "zhangsan", age: 33))
print(personSet)
print(personSet.filter({ $0.age > 20 }))


// 基本Set操作
/// intersection(_:)交集，由属于A且属于B的相同元素组成的集合
/// union(_:)并集，由所有属于集合A或属于集合B的元素所组成的集合
/// symmetricDifference(_:)对称差集，集合A与集合B的对称差集定义为集合A与集合B中所有不属于A交B的元素的集合
/// subtracting(_:)相对补集，由属于A而不属于B的元素组成的集合，称为B关于A的相对补集

let set1: Set = ["A", "B", "C"]
let set2: Set = ["B", "E", "F", "G"]
print(set1.intersection(set2))
print(set1.union(set2))
print(set1.symmetricDifference(set2))
print(set1.subtracting(set2))

// Set判断方法
/// isSubset(of:)判断是否是林一个Set或者Sequence的子集
/// isSuperset(of:)判断是否是另一个Set或者Sequence的子集
/// isStrictSubset(of:)和isStrictSuperset(of:)判断是否是另一个Set的子集或者超集，但是又不等于另一个Set
/// isDisjoint(with:)判断两个Set是否有公共元素，如果没有返回true，如果有返回false

let smallSet: Set = [1, 2, 3]
let bigSet: Set = [1, 2, 3, 4]
print(smallSet.isSubset(of: bigSet))
print(bigSet.isSuperset(of: smallSet))
print(smallSet.isStrictSubset(of: bigSet))
print(bigSet.isStrictSuperset(of: smallSet))
print(smallSet.isDisjoint(with: bigSet))

// 给定一个集合，返回这个集合的所有子集

// 方法一 位运算
func getSubsetsOfSet<T>(set: Set<T>) -> Array<Set<T>> {
    let count = 1 << set.count
    let elements = Array(set)
    var subSets = Array<Set<T>>()
    for i in 0..<count {
        var subSet = Set<T>()
        for j in 0...elements.count {
            if ((i >> j) & 1) == 1 {
                subSet.insert(elements[j])
            }
        }
        subSets.append(subSet)
    }
    return subSets
}

print(getSubsetsOfSet(set: smallSet))


// 方法二 递归
func getSubsetsOfSet2<T>(set: Set<T>) -> Array<Set<T>> {
    let elements = Array(set)
    return getSubsetsOfSets3(elements: elements, index: elements.count, count: elements.count)
}

func getSubsetsOfSets3<T>(elements: Array<T>, index: Int, count: Int) -> Array<Set<T>> {
    var subSets = Array<Set<T>>()
    if index == 0 { //处理第一个元素
        subSets.append(Set<T>())
        var subSet = Set<T>()
        subSet.insert(elements[0])
        subSets.append(subSet)
        return subSets
    }
    subSets = getSubsetsOfSets3(elements: elements, index: index - 1, count: count)
    for subSet in subSets {
        var subSetWithCurrent = subSet
        subSetWithCurrent.insert(elements[index])
        subSets.append(subSetWithCurrent)
    }
    return subSets
}

// Set哈希冲突解决使用的是开放寻址法
