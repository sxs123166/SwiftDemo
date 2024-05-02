import UIKit

var greeting = "Hello, playground"

// guard

/// guard语句，类似于if语句，基于布尔值表达式来执行语句。使用guard语句来要求一个条件必须是真才能执行guard之后的语句。
/// 与if语句不同，guard语句总是有一个else分句--else分句里的代码会在条件不为真的时候执行

//https://github.com/objc-zen/objc-zen-book

/// 不要嵌套if语句。多个return语句是OK的。这样可以避免圈复杂度，并且让代码更加容易阅读。因为你的方法的重要部分没有嵌套在分支上，你可以很清楚的找到相关的代码

//if(![someOther boolValue]) {
//    return;
//}

func isIPAddress2(ipAddr: String) -> (Int, String) {
    let components = ipAddr.split(separator: ".")
    guard components.count == 4 else {
        return (100, "ip智能有四部分")
    }
    
    // if是为true的时候执行{}里面的语句，而guard是为false时执行else里面的语句
    guard let first = Int(components[0]), first >= 0 && first < 256 else {
        return (1, "第一个数不对")
    }
    
    guard let second = Int(components[1]), second >= 0 && second < 256 else {
        return (2, "第二个数不对")
    }
    
    guard let third = Int(components[2]), third >= 0 && third < 256 else {
        return (3, "第三个数不对")
    }
    
    guard let fourth = Int(components[3]), fourth >= 0 && fourth < 256 else {
        return (4, "第四个数不对")
    }
    
    return (0, "")
}

// 检查API可用性
/// Swift拥有内置的对API的可用性检查的功能，它能够确保你不会悲剧的使用了对部属目标不可用的API
/// 你可以在if或者guard语句中使用一个可用性条件来有条件的执行代码，基于在运行时你想用的哪个API是可用的

if #available(iOS 10, macOS 10.12, *) {
    
} else {
    
}
