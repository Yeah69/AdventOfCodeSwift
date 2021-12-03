class Day03 : Day {
    let label = "03"
    let input = inputDay03

    func generateCountsOfOne(_ strings: [Substring]) -> [Int] {
        var counts : [Int] = []
        for str in strings {
            let diff = str.count - counts.count
            if (diff > 0) {
                for _ in 0..<diff {
                    counts.append(0)
                }
            }
            for (index, char) in str.enumerated() {
                if (char == "1") {
                    counts[index] += 1
                }
            }
        }
        return counts
    }

    lazy var diagnosticReport = { input.split(whereSeparator: \.isNewline) }()
    lazy var half = { diagnosticReport.count / 2 }()
    lazy var countsOfOne : [Int] = { generateCountsOfOne(diagnosticReport) }()

    func taskZeroLogic() -> String { 
        let values = countsOfOne.reduce(("", "")) {
            $1 > half ? ($0.0 + "1", $0.1 + "0") : ($0.0 + "0", $0.1 + "1")
        }
        if let gamma = Int(values.0, radix: 2), let epsilon = Int(values.1, radix: 2) {
            return String(gamma * epsilon)
        }
        return noSolutionFound
    }

    func taskOneLogic() -> String { 
        func taskOneLogicInner(_ bitCriteria: (Int, Double) -> String) -> String {
            var selection = Array(diagnosticReport)
            print(type(of: selection))
            var i = 0
            repeat {
                let currentBitCriteria = bitCriteria(generateCountsOfOne(selection)[i], Double(selection.count) / 2.0)
                selection.removeAll(where: { 
                    let strin = String($0)
                    let temp = String(strin[strin.index(strin.startIndex, offsetBy: i)])
                    return temp != currentBitCriteria })
                i += 1
            } while selection.count != 1
            return String(selection[0])
        }

        func generalBitCriteria(_ positiveCase: String, _ negativeCase: String) -> (Int, Double) -> String {
            return {
                switch $0 {
                    case let x where Double(x) > $1: return positiveCase
                    case let x where Double(x) == $1: return positiveCase
                    default: return negativeCase
                }
            }
        }

        let oxygenText = taskOneLogicInner(generalBitCriteria("1", "0"))

        let co2Text = taskOneLogicInner(generalBitCriteria("0", "1"))

        if let oxygen = Int(oxygenText, radix: 2), let co2 = Int(co2Text, radix: 2) {
            return String(oxygen * co2)
        }
        return noSolutionFound
    }
}