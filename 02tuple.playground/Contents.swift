import Foundation
//------------------------------------------------------------------------------
//         Idea: split meetings using tutple {earlier, this week, later}
//------------------------------------------------------------------------------

class Meeting {
    let name: String
    let date: Date
    
    init(_ name: String, date dateString: String) {
        self.name = name
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.calendar = Calendar(identifier: .iso8601)
        self.date = formatter.date(from: dateString)!
    }
}

func split(_ meetings: [Meeting]) -> (earlier: [Meeting], thisWeek: [Meeting], later: [Meeting]) {
    var earlier: [Meeting] = []
    var thisWeek: [Meeting] = []
    var later: [Meeting] = []
    meetings.forEach { (meeting) in
        if meeting.isEarlier {
            earlier.append(meeting)
        } else if meeting.isOnThisWeek {
            thisWeek.append(meeting)
        } else {
            later.append(meeting)
        }
    }
    return (earlier: earlier, thisWeek: thisWeek, later: later)
}

extension Meeting {
    var isEarlier: Bool {
        return self.date < Date()
    }
    var isOnThisWeek: Bool {
        let calendar = Calendar.current
        return calendar.component(.weekOfYear, from: self.date)
            == calendar.component(.weekOfYear, from: Date())
    }
}

//------------------------------------------------------------------------------
//         Compute
//------------------------------------------------------------------------------

let meetings = [Meeting("A", date: "2018-3-16"),
                Meeting("B", date: "2017-11-16"),
                Meeting("C", date: "2018-02-22"),
                Meeting("D", date: "2018-02-28")]
let groups = split(meetings)
print("earlier: \(groups.earlier.map{$0.name})")
print("thisWeek: \(groups.thisWeek.map{$0.name})")
print("later: \(groups.later.map{$0.name})")

