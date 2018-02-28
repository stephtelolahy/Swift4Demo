import Foundation

//------------------------------------------------------------------------------
//          Custom date format
//------------------------------------------------------------------------------
struct Podcast: Codable {
    let name: String
    let releaseDate: Date
}

let jsonPocast = """
{
"name":"Nostalgie en direct",
"releaseDate":"2018-02-27"
}
"""

extension DateFormatter {
    static let iso8601DayOnly: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        //See more date formatting http://nsdateformatter.com
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(identifier: "UTC")
        return formatter
    }()
}

let decoder = JSONDecoder()
decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601DayOnly)
let jsonData = jsonPocast.data(using: .utf8)!
let podcast = try! decoder.decode(Podcast.self, from: jsonData)
print("Name: \(podcast.name) \nRelease date: \(podcast.releaseDate)")

//------------------------------------------------------------------------------
//              Choosing Properties to Encode and Decode — CodingKeys
//------------------------------------------------------------------------------

let jsonPhoto = """
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

if let jsonData = jsonPhoto.data(using: .utf8),
    let photo = try? JSONDecoder().decode(Photo.self, from: jsonData) {
    print(photo)
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

