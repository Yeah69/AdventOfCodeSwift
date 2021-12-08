class Day08 : Day {
    let label = "08"
    let input = inputDay08

    lazy var outputs: [String] = {
        func analysis(_ inputs: [Set<Character>]) -> [Set<Character>:String] {
            let maybeOne = inputs.filter { $0.count == 2 }.first
            let maybeSeven = inputs.filter { $0.count == 3 }.first
            let maybeFour = inputs.filter { $0.count == 4 }.first
            let maybeEight = inputs.filter { $0.count == 7 }.first
            if let one = maybeOne, let seven = maybeSeven, let four = maybeFour, let eight = maybeEight {
                let maybeZero = inputs.filter { $0.count == 6 && $0.isSuperset(of: seven) && !$0.isSuperset(of: four) }.first
                let maybeNine = inputs.filter { $0.count == 6 && $0.isSuperset(of: four) }.first
                let maybeSix = inputs.filter { $0.count == 6 && !$0.isSuperset(of: seven) && !$0.isSuperset(of: four) }.first
                let maybeThree = inputs.filter { $0.count == 5 && $0.isSuperset(of: seven) }.first
                if let zero = maybeZero, let nine = maybeNine, let six = maybeSix, let three = maybeThree {
                    let maybeFive = inputs.filter { $0.count == 5  && !$0.isSuperset(of: seven) && six.isSuperset(of: $0) }.first
                    let maybeTwo = inputs.filter { $0.count == 5  && !$0.isSuperset(of: seven) && !six.isSuperset(of: $0) }.first
                    if let five = maybeFive, let two = maybeTwo {
                        return [zero: "0", one: "1", two: "2", three: "3", four: "4", five: "5", six: "6", seven: "7", eight: "8", nine: "9"]
                    }
                }
            }
            return [:]
        }

        func decode(dict: [Set<Character>:String], output: [Set<Character>]) -> String { output.compactMap { dict[$0] }.reduce("", +) }

        let strings: [[String]] = input.split(whereSeparator: \.isNewline).map { $0.components(separatedBy: " ") } 
        let sets = strings.map { $0.map { string in Set(string) } }
        return sets.map { decode(dict: analysis(Array($0.prefix(10))), output: Array($0.suffix(4))) }
    }()

    func taskZeroLogic() -> String { String(outputs.map { $0.filter { $0 == "1" || $0 == "4" || $0 == "7" || $0 == "8" }.count }.reduce(0, +)) }
    func taskOneLogic() -> String { String(outputs.compactMap { Int($0) }.reduce(0, +)) }
}