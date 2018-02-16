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
