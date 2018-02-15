//: Playground - noun: a place where people can play

protocol Localisable {
    var distanceFromMe: Int {get}
}

extension Array where Element: Localisable {
    func sortedByProximity() -> [Element] {
        return self.sorted(by: {$0.distanceFromMe < $1.distanceFromMe })
    }
}

struct User {
    let name: String
    let department: Int
}

extension User: Localisable {
    var distanceFromMe: Int {
        return self.department
    }
}

let users = [User(name: "Daniella", department: 60),
             User(name: "Chris", department: 11),
             User(name: "Eva", department: 95),
             User(name: "Alex", department: 17)]
let nearbyUsers = users.sortedByProximity().map{$0.name}
print(nearbyUsers)

// Idea: sort friends by proximity
