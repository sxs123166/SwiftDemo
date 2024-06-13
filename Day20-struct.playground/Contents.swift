import UIKit

var greeting = "Hello, playground"

// 常量结构体实例的存储属性
/// 如果你创建了一个结构体的实例并且把这个实例变量赋给常量，你不能修改这个实例的属性，即使是声明为变量的属性

// 延迟存储属性
/// 延迟存储属性的初始值在其第一次使用时才进行计算。你可以通过在其声明前标注lazy修饰语来表示一个延迟存储属性。
/// 如果被标记为lazy修饰符的属性同时被多个线程访问并且属性还没有被初始化，则无法保证属性只初始化一次

class DataImporter {
    var fileName = "data.txt"
    init() {
        print("DataImporter inits")
    }
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
print("manager.data.append finish")
print(manager.importer.fileName)

