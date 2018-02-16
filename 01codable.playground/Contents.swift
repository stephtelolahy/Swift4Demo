struct CuriosityLog: Codable {
    enum Discovery: String, Codable {
        case rock, water, martian
    }
    
    var sol: Int
    var discoveries: [Discovery]
}

// Create a log entry for Mars sol 42
let logSol42 = CuriosityLog(sol: 42, discoveries: [.rock, .rock, .rock, .rock])

let jsonEncoder = JSONEncoder() // One currently available encoder

// Encode the data
let jsonData = try jsonEncoder.encode(logSol42)
// Create a String from the data
let jsonString = String(data: jsonData, encoding: .utf8) // "{"sol":42,"discoveries":["rock","rock","rock","rock"]}"

let jsonDecoder = JSONDecoder() // Pair decoder to JSONEncoder

// Attempt to decode the data to a CuriosityLog object
let decodedLog = try jsonDecoder.decode(CuriosityLog.self, from: jsonData)
decodedLog.sol         // 42
decodedLog.discoveries // [rock, rock, rock, rock]
