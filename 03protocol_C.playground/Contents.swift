
//------------------------------------------------------------------------------
//         Idea: search people by preferences
//------------------------------------------------------------------------------

struct User {
    let name: String
    var preferredFoods: [Food]
    var visitedCities: [String]
    var favouriteMovies: [Movie]
}

enum Food {
    case burger
    case salad
    case cheeseCake
    case sushi
    case springRolls
}

struct Movie {
    let title: String
    let year: String
}

//------------------------------------------------------------------------------
//         Define behaviour
//------------------------------------------------------------------------------

protocol Likable {
    func isLiked(by user: User) -> Bool
}

extension Food: Likable {
    func isLiked(by user: User) -> Bool {
        return user.preferredFoods.contains(self)
    }
}

extension String: Likable { // Obviously extension of City
    func isLiked(by user: User) -> Bool {
        return user.visitedCities.contains(self)
    }
}

extension Movie: Likable {
    func isLiked(by user: User) -> Bool {
        return user.favouriteMovies.contains(self)
    }
}

extension Movie: Equatable {
    static func ==(lhs: Movie, rhs: Movie) -> Bool {
        return lhs.title == rhs.title && lhs.year == rhs.year
    }
}

//------------------------------------------------------------------------------
//         Compute
//------------------------------------------------------------------------------

extension User {
    func isInterested(in likables: [Likable]) -> Bool {
        for likable in likables {
            if likable.isLiked(by: self) {
                return true
            }
        }
        return false
    }
}

let starWars = Movie(title: "Star Wars", year: "1977")
let theDarkKnight = Movie(title: "The Dark Knight ", year: "2008")
let avatar = Movie(title: "Avatar", year: "2009")
let GOT = Movie(title: "Game of Thrones", year: "2011")

let people = [User(name: "Daniel",
                   preferredFoods: [.burger, .cheeseCake],
                   visitedCities: ["Paris"],
                   favouriteMovies: [avatar]),
              
              User(name: "Chris",
                   preferredFoods: [.sushi, .springRolls],
                   visitedCities: ["Rome", "Bonn"],
                   favouriteMovies: [theDarkKnight, GOT]),
              
              User(name: "Valeria",
                   preferredFoods: [.salad, .burger],
                   visitedCities: ["Barcelona"],
                   favouriteMovies: [starWars, avatar]),
              
              User(name: "Alex",
                   preferredFoods: [.sushi],
                   visitedCities: ["Amsterdam"],
                   favouriteMovies: [])]

let preferences: [Likable] = [GOT, Food.burger, "Paris"]
let mates = people.filter{$0.isInterested(in: preferences)}
print(mates.map{$0.name})

