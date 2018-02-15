//: Playground - noun: a place where people can play

func extremums(array: [Int]) -> (min: Int, max: Int) {
    return (array.min()!, array.max()!)
}

func positiveNegatives(array: [Int]) -> (positives: [Int], negatives: [Int]) {
    return (array.filter{$0 > 0}, array.filter{$0 < 0})
}

let a = extremums(array: [1, -2, 3, -4, 5, -6, 7, 8, 9])
let b = positiveNegatives(array: [1, -2, 3, -4, 5, -6, 7, 8, 9])


// Idea: sort events in two list: last24h, earlier
