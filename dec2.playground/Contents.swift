//: Playground - noun: a place where people can play

import UIKit


func getInputData() -> [[Int]] {
    var result = [[Int]]()
    if let path = Bundle.main.path(forResource: "input", ofType: "txt") {
        do {
            let data = try String(contentsOfFile: path, encoding: .utf8)
            let myStrings = data.components(separatedBy: .newlines)
            var inputRow = Array<Int>()
            for string in myStrings {
                let scanner = Scanner(string: string)
                var num = Int()
                while(scanner.scanInt(&num)) {
                    inputRow.append(num)
                }
                if inputRow.count > 0 {
                    result.append(inputRow)
                }
                inputRow.removeAll()
            }
        } catch {
            print(error)
        }
    } else {
        print("ugh")
    }
    
    return result
    
}

func biggest(inArray array: [Int]) -> Int {
    var biggest = 0
    for num in array {
        if num > biggest {
            biggest = num
        }
    }
    return biggest
}

func smallest(inArray array: [Int]) -> Int {
    var smallest = Int.max
    for num in array {
        if num < smallest {
            smallest = num
        }
    }
    return smallest
}

let inputData = getInputData()

// part 1
var sum = 0
for row in inputData {
    let smallNum = smallest(inArray: row)
    let bigNum = biggest(inArray: row)
    sum += (bigNum - smallNum)
}

print("part 1: \(sum)")

// part 2

func evenlyDivisibleNumbersResult(inArray array: [Int]) -> Int {
    var result = 0
    for i in 0..<array.count  {
            for j in i + 1..<array.count {
            let x = array[i]
            let y = array[j]
            
            if x >= y && x % y == 0 {
                result += x / y
            }
            if y > x && y % x == 0 {
                result += y / x
            }
        }
    }
    return result
}

var result = 0
for row in inputData {
    result += evenlyDivisibleNumbersResult(inArray: row)
}

print("part 2: \(result)")
