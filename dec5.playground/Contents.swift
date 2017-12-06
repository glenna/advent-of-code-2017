//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func getInputData() -> [Int] {
    var result = [Int]()
    if let path = Bundle.main.path(forResource: "input", ofType: "txt") {
        do {
            let data = try String(contentsOfFile: path, encoding: .utf8)
            result = data.components(separatedBy: .newlines).flatMap{Int($0)}
            
        } catch {
            print(error)
        }
    } else {
        print("ugh")
    }
    return result
}


var data = getInputData()

var currPosition = 0
var stepCount = 0


print(stepCount)

// part 2

data = getInputData()
currPosition = 0
stepCount = 0

while (currPosition < data.count) {
    let num = data[currPosition]
    var offset = 1
    if (num >= 3) {
        offset = -1
    }
    data[currPosition] += offset
    currPosition += num
    stepCount += 1
}

print(stepCount)
