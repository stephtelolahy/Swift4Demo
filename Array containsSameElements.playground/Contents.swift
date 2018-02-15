//: Playground - noun: a place where people can play

import UIKit

extension Array where Element: Equatable {
    func containsSameElements(as other: [Element]) -> Bool {
        guard self.count == other.count else {
            return false
        }
        let distinctElements = self.filter { !other.contains($0) }
        return distinctElements.count == 0
    }
}


var str = "Hello, playground"

// Initialize the Arrays
let a1 = [1, 2, 3]
let a2 = [2, 3, 1]

// Check if they are the same

if a1.containsSameElements(as: a2) {
    print("S1 is the same as S2")
}
else {
    print("S1 is not the same as S2")
}
