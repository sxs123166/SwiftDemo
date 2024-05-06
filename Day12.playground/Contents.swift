import UIKit

var greeting = "Hello, playground"



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
