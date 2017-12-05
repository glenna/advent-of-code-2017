//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//let input = 361527
let input = 26
//let input = 10

var size = Int(ceil(sqrt(Double(input))))

//the array must be odd number sized
if size % 2 == 0 {
    size += 1
}

print(size)

// 0...601 x 0...601 is the bounds of the array
// 1 is in the center, so at 300, 300

//we know the center is at 2, 2

//37 36  35  34  33  32 31
//38 17  16  15  14  13 30
//39 18   5   4   3  12 29
//40 19   6   1   2  11 28
//41 20   7   8   9  10 27
//42 21  22  23  24  25 26
//43 44  45  46  47  48 49
//                         81
//                            121
//                                169
//                                    225

var middle = Int(size / 2)

var array = Array.init(repeating: Array.init(repeating: 0, count: size), count: size)
let theSquare = size * size

var countdown = size * size

var x = 0
var y = 0

for i in (0..<size).reversed() {
    if countdown == input {
        x = size - 1
        y = i
    }
    array[size - 1][i] = countdown
    countdown -= 1
}

for i in (0..<size - 1).reversed() {
    if countdown == input {
        x = i
        y = 0
    }
    array[i][0] = countdown
    countdown -= 1
}

for i in 1..<size {
    if countdown == input {
        x = 0
        y = i
    }
    array[0][i] = countdown
    countdown -= 1
}

for i in 1..<size - 1 {
    if countdown == input {
        x = i
        y = size - 1
    }
    array[i][size - 1] = countdown
    countdown -= 1
}

//print(array)
print("weee (\(x), \(y))")
print(middle)

var manhattan = abs(x - middle) + abs(y - middle)

print("manhattan distance is: \(manhattan)")

//part 2



//start fresh
array = Array.init(repeating: Array.init(repeating: 0, count: size), count: size)
size = 3
array[middle][middle] = 1

var counter = 2

let stepSize = 2

repeat {
    let variation = size / 2
    let mid = variation
    
    let upperBounds = mid + variation
    let lowerBounds = mid - variation

    print((lowerBounds...upperBounds - 1).reversed())

    for i in (lowerBounds...upperBounds - 1).reversed() {
        array[i][upperBounds] = counter
        print("(\(i),\(upperBounds)) = \(counter)")
        counter += 1
    }
    print("==")
    for i in (lowerBounds...upperBounds - 1).reversed() {
        array[lowerBounds][i] = counter
        print("(\(lowerBounds),\(i)) = \(counter)")
        counter += 1
    }
    print("==")
    for i in (lowerBounds...upperBounds - 1).reversed() {
        array[i][lowerBounds] = counter
        print("(\(i),\(lowerBounds)) = \(counter)")
        counter += 1
    }
    print("==")
    for i in lowerBounds+1...upperBounds {
        array[upperBounds][i] = counter
         print("(\(upperBounds),\(i)) = \(counter)")
        counter += 1
    }
    print("==")
    size += 2

} while(size < 7)

print(array)
