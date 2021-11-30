import Foundation

class Day14 : Day {
    let label = "14"
    let input = inputDay14

    lazy var polymerTemplate: String = { String(input.split(whereSeparator: \.isNewline).first ?? "") }()

    lazy var pairInsertions: [String: String] = {
         let temp: [(String, String)] = input
            .split(whereSeparator: \.isNewline)
            .map { String($0).components(separatedBy: " -> ") }
            .filter { $0.count == 2 }
            .map { ($0[0], $0[1]) }
        return Dictionary(uniqueKeysWithValues: temp)
    }()

    func day14Logic(_ steps: Int) -> String { 
        func pairing(_ current: String) -> [String: Int] {
            let temp: [String] = stride(from: 0, to: current.count - 1, by: 1)
                .map {
                    let indexZero = current.index(current.startIndex, offsetBy: $0)
                    let indexOne = current.index(current.startIndex, offsetBy: $0 + 1)
                    let zero = String(current[indexZero])
                    let one = String(current[indexOne])
                    return zero + one }
            let tempDict = Dictionary(grouping: temp) { $0 }
            return Dictionary(uniqueKeysWithValues: tempDict.map { ($0.0, $0.1.count) })
        }
        func processPairs(_ currentPairs: [String: Int]) -> [String: Int] {
            var nextPairs: [String: Int] = [:]

            for tuple in currentPairs {
                let intermediate = pairInsertions[tuple.0] ?? ""
                let indexZero = tuple.0.index(tuple.0.startIndex, offsetBy: 0)
                let indexOne = tuple.0.index(tuple.0.startIndex, offsetBy: 1)
                let zero = String(tuple.0[indexZero]) + intermediate
                let one = intermediate + String(tuple.0[indexOne])
                nextPairs[zero] = (nextPairs[zero] ?? 0) + tuple.1
                nextPairs[one] = (nextPairs[one] ?? 0) + tuple.1
            }

            return nextPairs
        }

        func calculateCounts(_ currentPairs: [String: Int]) -> [Character: Int] { 
            var result: [Character: Int] = [:]

            for tuple in currentPairs {
                let indexZero = tuple.0.index(tuple.0.startIndex, offsetBy: 0)
                let indexOne = tuple.0.index(tuple.0.startIndex, offsetBy: 1)
                let charZero = tuple.0[indexZero]
                let charOne = tuple.0[indexOne]
                result[charZero] = (result[charZero] ?? 0) + tuple.1
                result[charOne] = (result[charOne] ?? 0) + tuple.1
            }
            
            return Dictionary(uniqueKeysWithValues: result.map { ($0.0, Int(ceil(Double($0.1) / 2.0))) })
        }

        var pairs = pairing(polymerTemplate)

        for _ in 0 ..< steps {
            pairs = processPairs(pairs)
        }
        let calculated = calculateCounts(pairs)
        print(calculated)
        let max = calculated.values.max() ?? 0
        let min = calculated.values.min() ?? 0
        return String(max - min)
    }
    func taskZeroLogic() -> String { day14Logic(10) }

    func taskOneLogic() -> String { day14Logic(40) }
}