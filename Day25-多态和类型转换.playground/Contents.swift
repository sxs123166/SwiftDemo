import UIKit

var greeting = "Hello, playground"
// 类型
class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

let library = [
Movie(name: "Casablanca", director: "Michael Curtiz"),
Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
Movie(name: "Citizen Kane", director: "Orson welles"),
Song(name: "The One And Only", artist: "Chesney Hawkes"),
Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]
print(type(of: library))

// 类型检查
// 使用类型检查符操作符（is）来检查一个实例是否属于一个特定的子类。如果实例是该子类类型，类型检查操作符返回true,否则返回false

// 向下类型转换
/// 某个类类型的常量或变量可能实际上在后台引用自一个子类的实例。当你遇到这种情况时你可以尝试使用类型转换操作符（as?或as!）将它向下类型转换至其子类类型
/// 由于向下类型转换可能失败，类型转换操作符就有了两个不同的形式。条件形式，as?，返回了一个你将要向下类型转换的值的可选项。强制形式，as!,则将向下类型转换和强制展开结合为一个步骤

// Any和AnyObject
/// Swift为不确定的类型提供了两种特殊的类型别名：
///     AnyObject可以表示任何类类型的实例
///     Any可以表示任何类型，包括函数类型


// 嵌套类型
/// Swift中的类，结构体和枚举可以进行嵌套，即在某一类型的内部定义类型，这种嵌套在Java中称为内部类
/// 嵌套类型的能够访问它外部的成员

for item in library {
    if let realItem = item as? Movie {
        print(realItem.director)
    }
}
