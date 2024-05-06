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

var letters = Set<Character>()
letters.insert("c")
print(letters)

var course: Set<String> = ["Math", "English", "History"]
course.insert("History")
print(course)

// Set类型的哈希值
/// 为了能让类型存储在Set中，它必须是可哈希的--就是说类型必须提供它计算自身哈希值的方法
/// 所有的Swift的基础类型（比如String,Int,Double和Bool）默认都是可哈希的，并且可以用于Set或者Dictionary的键

/// 自定义类型需要实现Hashable协议
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

var personSet = Set<Person>()
personSet.insert(Person(name: "zhangsan", age: 28))


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

// hashable和equatable都符合时，才会进行更新

var personSet: Set<Person> = [Person(name: "zhangsan", age: 20), Person(name: "lisi", age: 29)]
personSet.update(with: Person(name: "zhangsan", age: 35))
personSet.update(with: Person(name: "wangwu", age: 18))
let person = personSet.removeFirst()
print(person)
let person1 = personSet.remove(Person(name: "zhangsan", age: 33))
print(personSet)
print(personSet.filter({ $0.age > 20 }))
