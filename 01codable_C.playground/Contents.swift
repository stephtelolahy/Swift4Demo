import Foundation

//------------------------------------------------------------------------------
//              Choosing Properties to Encode and Decode — CodingKeys
//------------------------------------------------------------------------------

let jsonString = """
{
"name": "Apple",
"link": "https:\\/\\/www.fruits.com\\/apple"
}
"""

struct Photo: Codable {
    var title: String
    var url: URL
    //This property is not included in the CodingKeys enum
    //and hence will not be encoded/decoded.
    var format: String = "png"
    // Define codingKeys
    enum CodingKeys: String, CodingKey {
        case title = "name"
        case url = "link"
    }
}

if let jsonData = jsonString.data(using: .utf8),
    let photoObject = try? JSONDecoder().decode(Photo.self, from: jsonData) {
    print(photoObject)
}

//------------------------------------------------------------------------------
//          Custom date format
//------------------------------------------------------------------------------
//https://useyourloaf.com/blog/swift-codable-with-custom-dates/
//http://nsdateformatter.com

struct Podcast: Codable {
    let name: String
    let releaseDate: Date
}

let jsonPocast = """
{
"name":"Top Audio Podcasts",
"releaseDate":"2017-11-16T11:13:30+00:00"
}
"""

extension DateFormatter {
    static let iso8601Full: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone.current
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
}

let decoder = JSONDecoder()
decoder.dateDecodingStrategy = .iso8601
decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
if let jsonData = jsonPocast.data(using: .utf8),
    let podcast = try? decoder.decode(Podcast.self, from: jsonData) {
    print(podcast.name + " " + "\(podcast.releaseDate)")
} else {
    print("Failed mapping")
}


//------------------------------------------------------------------------------
//          Limitations: cannot conform to Codable in an extension
//------------------------------------------------------------------------------

//class Person {
//    var name: String?
//    var age: Int?
//}
//extension Person: Codable {
//}

