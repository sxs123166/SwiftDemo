import UIKit

var greeting = "Hello, playground"

// 运算符优先级和结合性

/// 运算符的优先级是的一些运算符优先于其他运算符，高优先级的运算符会被先计算
/// 结合性定义了具有相同优先级的运算符是如何结合（或关联）的--是与左边结合为一组，还是与右边结合为一组。可以这样理解：“他们是与左边的表达式结合的”或者
/// 他们是与右边的表达式结合的

// Swift语言中逻辑运算符&&和||是左相关的，这意味着多个逻辑运算符的表达式会首先计算最左边的字表达式

// 运算符重载
/// 类和结构体可以为现有的运算符提供自定义的实现，称为运算符重载

struct Vector2D {
    var x = 0.0, y = 0.0
}

extension Vector2D {
    static func + (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y + right.y)
    }
}

//let vector = Vector2D(x: 3.0, y: 1.0)
//let anotherVector = Vector2D(x: 2.0, y: 4.0)
//let combinedVector = vector + anotherVector

/// 类与结构体也能提供标准一元运算符的实现
/// 要实现前缀或者后缀运算符，需要在声明运算符函数的时候在func关键字之前指定prefix或者postfix限定符

extension Vector2D {
    static prefix func - (vector: Vector2D) -> Vector2D {
        return Vector2D(x: -vector.x, y: -vector.y)
    }
}

let positive = Vector2D(x: 3.0, y: 4.0)
let negative = -positive
let alsoPositive = -negative

// 组合赋值运算符重载
/// 组合赋值运算符将赋值运算符（=）与其他运算符进行结合
/// 在实现的时候，需要把运算符的左参数设置成inout类型，因为这个参数的值会在运算符函数内直接被修改

extension Vector2D {
    static func += (left: inout Vector2D, right: Vector2D) {
        left = left + right
    }
}

var original = Vector2D(x: 1.0, y: 2.0)
let vectorToAdd = Vector2D(x: 3.0, y: 4.0)
original += vectorToAdd


// 等价运算符重载
/// 自定义类和结构体不接收等价运算符的默认实现，也就是所谓的“等于”运算符（==）和“不等于”运算符（!=）
/// 要使用等价运算符来检查你自己类型的等价，需要和其他运算中缀运算符一样提供一个“等于”运算符重载，并且遵循标准库的Equatable协议

extension Vector2D: Equatable {
    static func == (left: Vector2D, right: Vector2D) -> Bool {
        return (left.x == right.x) && (left.y == right.y)
    }
}

// Swift为以下自定义类型提供等价运算符合成实现：
/// 只拥有遵循Equatable协议存储属性的结构体
/// 只拥有遵循Equatable协议关联类型的枚举
/// 没有关联类型的枚举

struct Vector3D: Equatable {
    var x = 0.0, y = 0.0, z = 0.0
}

let twoThreeFour = Vector3D(x: 2.0, y: 3.0, z: 4.0)
let anotherTwoThreeFour = Vector3D(x: 2.0, y: 3.0, z: 4.0)
if(twoThreeFour == anotherTwoThreeFour) {
    print("These two vectors are also equivalent")
}

// 自定义运算符
/// 除了实现标准运算符，在Swift当中还可以声明和实现自定义运算符（custom operators）
/// 新的运算符要在全局作用域内，使用operator关键字进行声明，同时还要指定prefix、infix或者postfix限定符

prefix operator +++

extension Vector2D {
    static prefix func +++ (vector: inout Vector2D) -> Vector2D {
        vector += vector
        return vector
    }
}

var toBeDoubled = Vector2D(x: 1.0, y: 4.0)
let afterDoubling = +++toBeDoubled

// 自定义中缀运算符的优先级和结合性
/// 自定义的中缀（infix）运算符也可以指定优先级和结合性
/// 每一个自定义的中缀运算符都属于一个优先级组
/// 优先级组指定了中缀运算符和其他中缀运算符的关系

//precedencegroup MyPrecedence {
//    associativity: left
//    lowerThan: AdditionPrecedence
//}

infix operator +-: AdditionPrecedence
extension Vector2D {
    static func +- (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y - right.y)
    }
}

infix operator *^: MultiplicationPrecedence  // MyPrecedence
precedencegroup MyPrecedence {
    // 结合性
    associativity: left
    // 优先级
    lowerThan: AdditionPrecedence
}
extension Vector2D {
    static func *^ (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x * right.x, y: left.y * left.y + right.y * right.y)
    }
}

let firstVector = Vector2D(x: 1.0, y: 2.0)
let secondVector = Vector2D(x: 3.0, y: 7.0)
let plusMinusVector = firstVector +- secondVector
let thirdVector = Vector2D(x: 2.0, y: 2.0)
let vector = firstVector +- secondVector *^ thirdVector
print(vector.x)
print(vector.y)

