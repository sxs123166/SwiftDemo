import UIKit

var greeting = "Hello, playground"

// 函数式编程

let NON_WORDS: Set = ["the", "and", "of", "to", "a", "i", "it", "in", "or", "is", "as", "so", "but", "be"]

func wordFreq(words: String) -> [String: Int] {
    var wordDict: [String: Int] = [:]
    let wordList = words.split(separator: " ")
    for word in wordList {
        let lowerCaseWord = word.lowercased()
        if !NON_WORDS.contains(lowerCaseWord) {
            if let count = wordDict[lowerCaseWord] {
                wordDict[lowerCaseWord] = count + 1
            } else {
                wordDict[lowerCaseWord] = 1
            }
        }
    }
    return wordDict
}

let words = """
There are moments in life when you miss someone so
  much that you just want to pick them from your
  dreams and hug then for real Dream what you
  want to dream go where you want to go be what
  you want to be because you have only one life
  and one chance to do all the things you want to
  do
"""
print(wordFreq(words: words))

func wordFreq2(words: String) -> [String: Int] {
    var wordDict: [String: Int] = [:]
    let wordList = words.split(separator: " ")
    wordList.map { $0.lowercased() }
        .filter{ !NON_WORDS.contains($0) }
        .forEach { (word) in wordDict[word] = (wordDict[word] ?? 0) + 1
            
        }
    return wordDict
}




let employee = ["neal", "s", "stu", "j", "rich", "bob", "aiden", "j", "ethan", "liam", "mason", "noah", "lucas", "jacob", "jack"]

func cleanNames(names: Array<String>) -> String {
    var cleanedNames = ""
    for name in names {
        if name.count > 1 {
            cleanedNames += name.capitalized + ","
        }
    }
    cleanedNames.remove(at: cleanedNames.index(before: cleanedNames.endIndex))
    return cleanedNames
}

print(cleanNames(names: employee))


let cleanedNames = employee.filter{ $0.count > 1 }
    .map{ $0.capitalized }
    .joined(separator: ",")

print(cleanedNames)

// 对Swift的尝试改进
extension Array where Element: Any {
    func parallelMap<T>(_ transform: (Element) -> T) -> [T] {
        
        let n = self.count
        if n == 0 {
            return []
        }
            
        var result = ContiguousArray<T>()
        result.reserveCapacity(n)
        
        DispatchQueue.concurrentPerform(iterations: n) { (i) in
            result.append(transform(self[i]))
        }
        
        return Array<T>(result)
    }
}
