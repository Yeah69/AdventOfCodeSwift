class Day25 : Day {
    let label = "25"
    let input = inputDay25

    enum Cucumber {
        case none
        case east
        case south
    }

    lazy var initialState: [[Cucumber]] = {
        input.split(whereSeparator: \.isNewline).map { String($0).map { $0 == ">" ? .east : $0 == "v" ? .south : .none } }
    }()

    func taskZeroLogic() -> String {
        var i = 0
        var changes = true
        var state = initialState
        repeat {
            changes = false
            var prev = state
            state = state
                .enumerated()
                .map { (y, line) in 
                    return line
                        .enumerated()
                        .map{ (x, element) in 
                            let leftIndex = x == 0 ? prev[y].count - 1 : x - 1
                            let rightIndex = x == prev[y].count - 1 ? 0 : x + 1
                            if element == .none && prev[y][leftIndex] == .east {
                                changes = true
                                return .east
                            }
                            if element == .east && prev[y][rightIndex] == .none {
                                changes = true
                                return .none
                            }
                            return element
                        }
                }
            prev = state
            state = state
                .enumerated()
                .map { (y, line) in 
                    return line
                        .enumerated()
                        .map{ (x, element) in 
                            let upIndex = y == 0 ? prev.count - 1 : y - 1
                            let downIndex = y == prev.count - 1 ? 0 : y + 1
                            if element == .none && prev[upIndex][x] == .south {
                                changes = true
                                return .south
                            }
                            if element == .south && prev[downIndex][x] == .none {
                                changes = true
                                return .none
                            }
                            return element
                        }
                }
            i += 1
        } while changes

        return String(i) 
    }
    func taskOneLogic() -> String { nothingToDoHere }
}