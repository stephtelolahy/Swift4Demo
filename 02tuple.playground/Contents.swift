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

/// Filtering results into dictionary rather than array of tuples
let cities = ["Shanghai": 24_256_800, "Karachi": 23_500_000, "Beijing": 21_516_000, "Seoul": 9_995_000];
let massiveCities = cities.filter { $0.value > 10_000_000 }
print(massiveCities)

/// Grouping sequences by computed key
let groupedCities = Dictionary(grouping: cities.keys) { $0.first! }
print(groupedCities)

/// Multiline strings
let longString = """
When you write a string that spans multiple
lines make sure you start its content on a
line all of its own, and end it with three
quotes also on a line of their own.
Multi-line strings also let you write "quote marks"
freely inside your strings, which is great!
"""

