extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}

class Day04 : Day {
    let label = "04"
    let input = inputDay04

    class BoardNumber {
        var marked = false
        var value = 0

        init(_ value: Int) {
            self.value = value
        }

        func mark(_ number: Int) {
            if value == number {
                marked = true
            }
        }
    }

    class Board {
        var all: [BoardNumber] = []
        var rows: [[BoardNumber]] = [[]]
        var columns: [[BoardNumber]] = [[]]
        var won = false

        init(_ values: [Int]) {
            all = values.map { BoardNumber($0) }
            rows = all.chunked(into: 5)
            columns = stride(from: 0, through: 4, by: 1).map{ Array(stride(from: $0, through: 24, by: 5).map { index in all[index] }) }
        }

        func check(_ number: Int) -> Int? {
            if won { return nil }
            for og in all {
                og.mark(number)
            }

            func satisfied(_ view: [[BoardNumber]]) -> Bool { view.contains { $0.allSatisfy{ n in n.marked } }}

            if satisfied(rows) || satisfied(columns) {
                won = true
                return score(number)
            }
            return nil
        }

        func score(_ number: Int) -> Int { all.filter({ !$0.marked }).map{ $0.value }.reduce(0, +) * number } 
    }

    lazy var randomOrder: [Int] = { 
        if let first = input.split(whereSeparator: \.isNewline).first {
            return String(first).components(separatedBy: ",").compactMap{ Int($0) }
        }
        return []
    }()

    lazy var randomBoardValues: [[Int]] = { 
        input.split{ $0.isWhitespace }.compactMap{ Int($0) }.chunked(into: 25)
    }()

    func getRandomBoards() -> [Board] { randomBoardValues.map{ Board($0) } }

    func taskZeroLogic() -> String { 
        let randomBoards = getRandomBoards()
        for number in randomOrder {
            for board in randomBoards {
                if let score = board.check(number) {
                    return String(score)
                }
            }
        }
        return noSolutionFound  
    }
    func taskOneLogic() -> String { 
        let randomBoards = getRandomBoards()
        var lastWinnerScore = 0
        for number in randomOrder {
            for board in randomBoards {
                if let score = board.check(number) {
                    lastWinnerScore = score
                }
            }
        }
        return String(lastWinnerScore)   
    }
}