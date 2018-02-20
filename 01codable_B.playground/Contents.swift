import Foundation

//------------------------------------------------------------------------------
//                             CODABLE Protocol
//------------------------------------------------------------------------------

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

struct Photo: Codable {
    let title: String
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

if let jsonData = jsonString.data(using: .utf8),
    let photo = try? JSONDecoder().decode(Photo.self, from: jsonData) {
    print(photo)
}
