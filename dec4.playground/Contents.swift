//: Playground - noun: a place where people can play

import Foundation

var str = "Hello, playground"

var arrayOfPassphrases : [String]?

if let path = Bundle.main.path(forResource: "input", ofType: "txt") {
    let data = try String(contentsOfFile:path, encoding: String.Encoding.utf8)
    arrayOfPassphrases = data.components(separatedBy: CharacterSet.newlines)
}

var count = 0

if let array = arrayOfPassphrases {
    for i in 0..<array.count {
        if !array[i].trimmingCharacters(in: .whitespaces).isEmpty {
            let passphrase = array[i].components(separatedBy: CharacterSet.whitespaces)
            let passphraseSet = Set(passphrase.map({ $0 }))
            if passphrase.count == passphraseSet.count {
                count += 1
            }
        }
    }
}

print(count)

//part 2

func dictionary(from string: String) -> Dictionary<Character, String> {
    var dict = Dictionary<Character, String>()
    let characters = Array(string)
    for letter in characters {
        dict[letter] = ""
    }
    
    return dict
}

func checkPassphrase(_ passphrase: Set<String>) -> Bool {
    var arrayOfPassphraseDicts = [Dictionary<Character, String>]()
    for word in passphrase {
        arrayOfPassphraseDicts.append(dictionary(from:word))
    }
    
    for i in 0..<arrayOfPassphraseDicts.count {
        for j in i..<arrayOfPassphraseDicts.count {
            if i == j {
                continue;
            }
            if arrayOfPassphraseDicts[i] == arrayOfPassphraseDicts[j] {
                return false
            }
        }
    }
    
    return true
}

count = 0

if let array = arrayOfPassphrases {
    for i in 0..<array.count {
        if !array[i].trimmingCharacters(in: .whitespaces).isEmpty {
            let passphrase = array[i].components(separatedBy: CharacterSet.whitespaces)
            let passphraseSet = Set(passphrase.map({ $0 }))
            if passphrase.count == passphraseSet.count {
                if checkPassphrase(passphraseSet) {
                    count += 1
                }
            }
        }
    }
}

print(count)
