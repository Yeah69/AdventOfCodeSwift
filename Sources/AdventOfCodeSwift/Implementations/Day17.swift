class Day17 : Day {
    let label = "17"
    let input = inputDay17

    lazy var targetArea: (Int, Int, Int, Int) = {
        let temp = input.components(separatedBy: "=")
        let temp_0 = String(temp[1]).components(separatedBy: ",")
        let temp_1 = String(temp_0[0]).components(separatedBy: "..")
        let xLow = Int(String(temp_1[0])) ?? 0
        let xHigh = Int(String(temp_1[1])) ?? 0
        let temp_2 = String(temp[2]).components(separatedBy: "..")
        let yLow = Int(String(temp_2[0])) ?? 0
        let yHigh = Int(String(temp_2[1])) ?? 0
        return (xLow, xHigh, yLow, yHigh)
    }()

    func gaussianSumFormula(n: Int) -> Int { n * (n + 1) / 2 }

    lazy var minX: Int = {
        var i = 1
        while gaussianSumFormula(n: i) < targetArea.0 {
            i += 1
        }
        return i
    }()
    lazy var maxX: Int = { targetArea.1 }()

    lazy var minY: Int = { targetArea.2 }()
    lazy var maxY: Int = { abs(targetArea.2) - 1 }()

    lazy var possibleYRanges: [Int: (Int, Int)] = {
        func getYStepRange(_ yVelo: Int) -> (Int, Int)? {
            func doStep() { step += 1; position += velocity; velocity -= 1 }
            var start: Int? = nil
            var end: Int? = nil
            var position = 0
            var step = 0
            var velocity = yVelo
            while position > targetArea.3 { doStep() }
            if position <= targetArea.3 && position >= targetArea.2 {
                start = step
                end = step
                doStep()
                while position >= targetArea.2 {
                    end = step
                    doStep()
                }

                if let rStart = start, let rEnd = end {
                    return (rStart, rEnd)
                }
            }
            return nil
        } 
        var ret: [Int: (Int, Int)] = [:]

        for yVelocity in minY ... maxY {
            if let yRange = getYStepRange(yVelocity) {
                ret[yVelocity] = yRange
            }
        }
        return ret

    }()

    lazy var possible: [(Int, Int)] = {
        var ret: [(Int, Int)] = []
        for (y, stepRange) in possibleYRanges {
            for x in minX ... maxX {
                let check = stride(from: stepRange.0, through: stepRange.1, by: 1)
                    .map { gaussianSumFormula(n: x) - gaussianSumFormula(n: max(x - $0, 0)) }
                    .contains { targetArea.0 <= $0 && $0 <= targetArea.1 }
                if check {
                    ret.append((x, y))
                }
            }
        }
        return ret
    }()


    func taskZeroLogic() -> String { String(possible.map { gaussianSumFormula(n: $0.1) }.max() ?? 0) }
    func taskOneLogic() -> String { String(possible.count) }
}