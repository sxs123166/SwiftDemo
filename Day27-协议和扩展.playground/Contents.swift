import UIKit

var greeting = "Hello, playground"

// 协议&扩展

// 在扩展里添加协议遵循
/// 你可以扩展一个已经存在的类型来采纳和遵循一个新的协议，就算是你无法访问现有类型的源代码也行。扩展可以添加新的属性、方法和下标到已经存在的类型，并且因此允许你添加
/// 协议需要的任何需要

protocol TextRepresentable {
    var textualDescription: String { get }
}

//extension Dice: TextRepresentable {
//    var texttualDescription: String {
//        return "A \(sides)-sided dice"
//    }
//}

// 有条件的遵循协议
// 泛型类型可能只在某些情况下满足一个协议的要求，比如当类型的范型形式参数遵循对应的协议时。你可以通过在扩展类型时列出限制让泛型类型有条件的遵循某协议。
// 在你采纳的协议后面写反省where分句

//extension Array: TextRepresentable where Element: TextRepresentable {
//    var texttualDescription: String {
//        let itemsAsText = self.map { $0.texttualDescription }
//        return "[" + itemsAsText.joined(separator: ",") + "]"
//    }
//}
//let myDice = [d6, d12]
//print(myDice.texttualDescription)

// 使用扩展声明采纳协议
// 如果一个类型已经遵循了协议的所有需求，但是还没有声明它采纳了协议，你可以让通过一个空的扩展来让他采纳这个协议

struct Hamster {
    var name: String
    var textualDescription: String {
        return "A hamster named \(name)"
    }
}

extension Hamster: TextRepresentable {}

// 协议扩展
// 协议可以通过扩展来提供方法和属性的实现以遵循类型。这就允许你在协议自身定义行为，而不是在每一个遵循或者全局函数里定义

extension RandomNumberGenerator {
    func randomBool() -> Bool {
        return (Double)(arc4random()) > 0.5
    }
}

//let genetor = LinearCongruentialGenerator()
//print("Here's a random number: \(genetor.random())")
//print("And here's a random Boolean: \(genetor.randomBool())")

// 提供默认实现
// 你可以使用协议扩展来给协议的任意方法或者计算属性要求提供默认实现。如果遵循类型给这个协议的要求
// 提供了它自己的实现，那么它就会替代扩展中提供的默认实现

// 给协议扩展增加限制
// 当你定义一个协议扩展，你可以明确遵循类型必须在扩展的方法和属性可用之前满足的限制。在扩展协议名字后面使用where分句来写这些限制

extension Collection where Iterator.Element: TextRepresentable {
    var textualDescription: String {
        let itemsAsText = self.map{ $0.textualDescription }
        return "[" + itemsAsText.joined(separator: ",") + "]"
    }
}


//protocol TextRepresentable {
//    var desc: String { get }
//}
//
//extension Person : TextRepresentable {
//    var desc: String {
//        return "name \(name) age \(age)"
//    }
//}
//
//extension Array: TextRepresentable where Element: TextRepresentable {
//    var desc: String {
//        let itemDesc = self.map{$0.desc}
//        return itemDesc.joined(separator: ",")
//    }
//}
//
//let array = [Person(name: "zhangsan", age: 20), Person(name: "lisi", age: 30)]
//print(array.desc)

//let intArray = [1, 2, 3]
//print(intArray.d)
