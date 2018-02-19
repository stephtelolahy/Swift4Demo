import Foundation

//------------------------------------------------------------------------------
//                             CODABLE Protocol
//------------------------------------------------------------------------------

// MARK: Model

struct Photo: Codable {
    var title: String
    var url: URL
    var metaData: [String: String]
    var type: PhotoType
    var size: Size
    var tags: [String]?
}

struct Size: Codable {
    var height: Double
    var width: Double
}

enum PhotoType: String, Codable {
    case flower
    case animal
    case fruit
    case vegetable
}

// MARK: Decoding

let jsonString = """
{
"type": "fruit",
"size": {
"width": 150,
"height": 150
},
"title": "Apple",
"url": "https:\\/\\/www.fruits.com\\/apple",
"metaData": {
"color": "green"
},
"tags": ["bio", "health"]
}
"""
if let jsonData = jsonString.data(using: .utf8),
    let photoObject = try? JSONDecoder().decode(Photo.self, from: jsonData) {
    print(photoObject)
}


//------------------------------------------------------------------------------
//                             Limitations
//------------------------------------------------------------------------------

class Person {
    var name: String?
    var age: Int?
}

//extension Person: Codable {
//}

// MARK: Custom date
//https://useyourloaf.com/blog/swift-codable-with-custom-dates/
