import Foundation

//------------------------------------------------------------------------------
//                             Basic JSON parsing in Swift
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

struct Photo {
    var title: String
    var url: URL
    var metaData: [String:String]
    var type: PhotoType
    var size: Size
    var tags: [String]?
}

struct Size {
    var height: Double
    var width: Double
}

enum PhotoType: String {
    case flower
    case animal
    case fruit
    case vegetable
}

extension Size {
    init?(_ json: [String: Any]) {
        guard let width = json["width"] as? Double,
            let height = json["height"] as? Double else {
                return nil
        }
        self.width = width
        self.height = height
    }
}

extension Photo {
    init?(_ json: [String: Any]) {
        guard let title = json["title"] as? String,
        let urlString = json["url"] as? String,
        let url = URL(string: urlString),
        let metaData = json["metaData"] as? [String: String],
        let typeString = json["type"] as? String,
        let type = PhotoType(rawValue: typeString),
        let sizeJson = json["size"] as? [String: Any],
        let size = Size(sizeJson) else {
            return nil
        }
        let tags = json["tags"] as? [String]
        self.title = title
        self.type = type
        self.tags = tags
        self.url = url
        self.metaData = metaData
        self.size = size
    }
}

if let jsonData = jsonString.data(using: .utf8),
    let json = try JSONSerialization.jsonObject(with: jsonData) as? [String: Any],
    let photoObject = Photo(json) {
    print(photoObject)
}
