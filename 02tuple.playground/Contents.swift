// Idea: sort events in list: earlier, this week, later

import Foundation

let jsonMeetings = """
[
{"title":"A", "date":"2018-11-16T02:02:55+01:00"},
{"title":"B", "date":"2017-11-16T02:02:55+01:00"},
{"title":"C", "date":"2018-02-22T02:02:55+01:00"},
{"title":"D", "date":"2018-02-26T02:02:55+01:00"}
]
"""

struct Meeting: Codable {
    let title: String
    let date: Date
}

extension Meeting {
    var isEarlier: Bool {
        return self.date < Date()
    }
    var isOnThisWeek: Bool {
        let calendar = Calendar.current
        return calendar.component(.weekOfYear, from: self.date) == calendar.component(.weekOfYear, from: Date())
    }
}

func splitMeetings(_ meetings: [Meeting]) -> (earlier: [Meeting], thisWeek: [Meeting], later: [Meeting]) {
    var earlier: [Meeting] = []
    var thisWeek: [Meeting] = []
    var later: [Meeting] = []
    meetings.forEach { (meeting) in
        if meeting.isOnThisWeek {
            thisWeek.append(meeting)
        } else if meeting.isEarlier {
            earlier.append(meeting)
        } else {
            later.append(meeting)
        }
    }
    return (earlier: earlier, thisWeek: thisWeek, later: later)
}

func decodeMeetings(json: String) -> [Meeting] {
    let decoder = JSONDecoder()
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
    formatter.calendar = Calendar(identifier: .iso8601)
    decoder.dateDecodingStrategy = .formatted(formatter)
    guard let jsonData = json.data(using: .utf8),
        let meetings = try? decoder.decode([Meeting].self, from: jsonData) else {
            fatalError("Failed mapping")
    }
    return meetings
}

let meetings = decodeMeetings(json: jsonMeetings)
let groups = splitMeetings(meetings)
print("earlier: \(groups.earlier.map{$0.title})")
print("thisWeek: \(groups.thisWeek.map{$0.title})")
print("later: \(groups.later.map{$0.title})")






/// Filtering results into dictionary rather than array of tuples
let cities = ["Shanghai": 24_256_800, "Karachi": 23_500_000, "Beijing": 21_516_000, "Seoul": 9_995_000];
let groupedCities = Dictionary(grouping: cities.keys) { $0.first! }
print(groupedCities)

