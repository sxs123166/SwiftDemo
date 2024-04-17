import UIKit

var greeting = "Hello, playground"

// Optional
/// 通过在变量类型后面加？表示：
///      这里有一个值，他等于x
///               或者
///      这里根本没有值

// 你可以通过给可选变量赋值一个nil来将之设置为没有值
///    在Objective-C中是一个指向不存在对象的指针
///
///    在Swift中，nil不是指针，他是值缺失的一种特殊类型，任何类型得可选项都可以设置成nil而不仅仅是对象类型
///

//var str: String = nil
//var str1: String? = nil

/// 可选项是没法直接使用的
/// 需要用!展开之后才能使用（意思是我知道这个可选项里面有值，展开吧）

//错误示范
//var str1: String? = nil
//let count = str1.count

//var str: String? = "abc"
//if str != nil {
//    let count = str!.count
//    print(count)
//}

// Optional - 强制展开
/// 使用!来获取一个不存在的可选值会导致运行错误，再使用!强制展开之前必须确保可选项中包含一个非 nil 的值

//var str: String?
//let count = str!.count

// Optional-绑定
/// 可以使用可选项绑定来判断可选项是否包含值，如果包含就把值赋给一个临时的变量或者常量
/// 可选绑定可以与if和while的语句使用来检查可选项内部的值，并赋给一个常量或变量
/// 同一个if语句中包含多可选项绑定，用逗号分隔即可。如果任意可选绑定是nil或者bool值为false，那么整个if判断会被看作false

//var str: String? = "abc"
//if let actualStr = str {
//    let count = actualStr.count
//    print(count)
//}

// Optional-隐式展开
///  有些可选项一旦被设定值之后，就会一直拥有值，在这种情况下，就可以去掉检查的需求，也不必每次访问的时候都进行展开
///  通过在声明的类型后面添加一个！号（String！）而非问号（String？）来书写隐式展开可选项
///   隐式展开可选项主要被用在Swift类的初始化过程中

//var str: String! = "abc"
//let count = str.count
//print(count)

// Optional-可选链
/// 可选项后面加问号
/// 如果可选项不为nil,返回一个可选项结果，否则返回nil

// 错误示范
//var str: String? = "abc"
//let count = str?.count
//let lastIndex = count - 1

//var str: String? = "abc"
//let count = str?.count
//if count != nil {
//    let lastIndex = count! - 1
//    print(lastIndex)
//}


// Optional - 实现探究
/// Optional其实是标准库里的一个enum类型
/// 用标准库实现语言特性的典型

///  Optional.none就是nil
///  Optional.some则包装了实际的值

//var str: Optional<String> = "abc"   //实际上和？是一样的
//if let actualStr = str {
//    let count = actualStr.count
//    print(count)
//}


/// 范型属性 unsafelyUnwrapped
/// 理论上我们可以直接调用 unsafelyUnwrapped 获取可选项的值

var str: String? = "abc"
if str != nil {
    let count = str.unsafelyUnwrapped.count
    print(count)
}
