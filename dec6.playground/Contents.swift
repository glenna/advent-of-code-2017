//: Playground - noun: a place where people can play

import Foundation

var str = "Hello, playground"

var input = [4, 10, 4, 1, 8, 4, 9, 14, 5, 1, 14, 15, 0, 15, 3, 5]

var outputItrs = [[Int]]()

func outputContainsAtIndex(_ array: [Int]) -> (Bool, Int) {
    
    for idx in 0..<outputItrs.count {
        let arr = outputItrs[idx]
        if arr == array {
            return (true, idx)
        }
    }
    return (false, -1)
}

func biggestIdx(of array: [Int]) -> Int {
    var maxIdx = array.count - 1
    for idx in (0..<array.count).reversed() {
        if array[idx] >= array[maxIdx] {
            maxIdx = idx
        }
    }
    return maxIdx
}

func nextIdx(after idx: Int, ofArrayWith count: Int) -> Int {
    
    if idx == count - 1 {
        return 0
    } else {
        return idx + 1
    }
}

var currArray = input
var alreadySeen = false
var idxOfPrev = -1

while (!alreadySeen) {
    outputItrs.append(currArray)
    var idx = biggestIdx(of: currArray)
    var value = currArray[idx]
    currArray[idx] = 0

    while (value > 0) {
        idx = nextIdx(after: idx, ofArrayWith: currArray.count)
        currArray[idx] = currArray[idx] + 1
        value -= 1
    }
    (alreadySeen, idxOfPrev) = outputContainsAtIndex(currArray)
}

//part 1
print(outputItrs.count)

//part 2
print(outputItrs.count - idxOfPrev)


