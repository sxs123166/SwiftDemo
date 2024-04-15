import UIKit

var greeting = "Hello, playground"

func addTwoNum(num1: Int, num2: Int) -> Int {
    return num1 + num2
}

let sum = addTwoNum(num1: 100, num2: 56)
print(sum)

class Person {
    var name: String
    var age : Int
    init(name: String, age: Int) {
        self.name  = name
        self.age = age
    }
}

extension Person : CustomStringConvertible {
    var description: String {
        get {
            return "\(name) age \(age)"
        }
    }
}

let zhangsan = Person(name: "zhangsan", age: 28)


