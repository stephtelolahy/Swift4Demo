// Idea: update view if content changed

extension Array where Element: Equatable {
    func containsSameElements(as other: [Element]) -> Bool {
        return self.count == other.count
            && self.filter { !other.contains($0) }.isEmpty
    }
}

let a1 = [1, 2, 3]
let a2 = [2, 3, 1]
let containsSameElements = a1.containsSameElements(as: a2)



