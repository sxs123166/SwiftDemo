import UIKit

var greeting = "Hello, playground"

// 泛型

// 泛型函数定义
// 泛型函数可以用于任何类型

func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

// 上面的swapTwoValues(_:_:)中，占位符类型T就是一个类型形式参数的例子。类型形式参数指定并且命名一个占位符类型，紧挨着写在函数名后面的一对尖括号里比如<T>

// 一旦你指定了一个类型形式参数，你就可以用它定义一个函数形式参数（比如swapTwoValues(_:_:)）函数中的形式参数a和b的类型，或者用它做函数返回值类型，或者做函数体中类型标注。在不同情况下，用调用函数时的实际类型来替换类型形式参数。（上面的swapTwoValues(_:_:)）例子中，第一次调用函数的时候用Int替换了T，第二次掉用适用String替换的。）
// 你可以通过在尖括号里写多个用逗号隔开的类型形式参数名，来提供更多类型形式参数



// 命名形式参数

// 大多数情况下，类型形式参数的名字要有描述性，比如Dictionary<Key, Value>中的Key和Value，借此告知读者类型形式参数和泛型类型、泛型用到的函数之间的关系。但是，他们之间的关系没有意义时，一般按照惯例用单个字母命名，比如T,U,V，比如上面的swapTwoValues(_:_:)函数中的T
// 类型形式参数永远用大写开头的驼峰命名法（比如T和MyTypeParameter）命名，以指明他们是一个类型的占位符，不是一个值

