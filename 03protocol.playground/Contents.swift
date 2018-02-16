// Idea: get nearby friends

struct User {
    let name: String
    let department: Int
}

extension User {
    var livesInParis: Bool {
        return self.department / 1000 == 75
    }
}

let friends = [User(name: "Daniella", department: 60100),
               User(name: "Chris", department: 75011),
               User(name: "Eva", department: 75095),
               User(name: "Alex", department: 21017)]
let sameCityAsMe = friends.filter{$0.livesInParis}.map{$0.name}
print(sameCityAsMe)

// Idea: update view if content changed

extension Array where Element: Equatable {
    func containsSameElements(as other: [Element]) -> Bool {
        return self.count == other.count
            && self.filter{!other.contains($0)}.isEmpty
    }
}

let a1 = [1, 2, 3]
let a2 = [2, 3, 1]
let containsSameElements = a1.containsSameElements(as: a2)
