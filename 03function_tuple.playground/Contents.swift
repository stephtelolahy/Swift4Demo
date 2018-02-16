// Idea: sort events in two list: thisMonth and earlier

import Foundation

// TODO: define class

extension Date {
    var isOnThisMonth: Bool {
        let calendar = Calendar.current
        let dateMonthNumber = calendar.component(.month, from: self)
        let currentMonthNumber = calendar.component(.month, from: Date())
        return dateMonthNumber == currentMonthNumber
    }
}

func splitThisMonthAndEarlier(_ array: [Date]) -> (thisMonth: [Date], earlier: [Date]) {
    var thisMonth: [Date] = []
    var earlier: [Date] = []
    array.forEach { (date) in
        if date.isOnThisMonth {
            thisMonth.append(date)
        } else {
            earlier.append(date)
        }
    }
    return (thisMonth: thisMonth, earlier: earlier)
}


let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd"

let datesString = ["2018-01-11", "2018-02-17", "2018-02-09", "2017-12-21"]
let dates = datesString.flatMap{ dateFormatter.date(from: $0)}
let groups = splitThisMonthAndEarlier(dates)

print(groups.thisMonth)
print(groups.earlier)

