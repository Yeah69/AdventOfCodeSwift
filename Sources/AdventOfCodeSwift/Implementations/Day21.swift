class Day21 : Day {
    let label = "21"
    let input = inputDay21

    lazy var initialPositions: (Int, Int) = {
        let positions = input.split(whereSeparator: \.isNewline)
            .compactMap { Int(String($0.last ?? "1")) ?? 1 }
        return (positions[0], positions[1])
    }()

    func taskZeroLogic() -> String {
        var scores = (0, 0)
        var playerPositions = initialPositions
        var deterministicDice = 1
        var diceRollCount = 0
        while scores.0 < 1000 && scores.1 < 1000 {
            var playerZeroSum = deterministicDice
            deterministicDice += 1
            diceRollCount += 1
            if deterministicDice > 100 { deterministicDice = 1 }
            playerZeroSum += deterministicDice
            deterministicDice += 1
            diceRollCount += 1
            if deterministicDice > 100 { deterministicDice = 1 }
            playerZeroSum += deterministicDice
            deterministicDice += 1
            diceRollCount += 1
            if deterministicDice > 100 { deterministicDice = 1 }

            playerZeroSum += playerPositions.0
            
            while playerZeroSum > 10 {
                playerZeroSum -= 10
            }

            scores = (scores.0 + playerZeroSum, scores.1)
            playerPositions = (playerZeroSum, playerPositions.1)

            if scores.0 >= 1000 { break }

            var playerOneSum = deterministicDice
            deterministicDice += 1
            diceRollCount += 1
            if deterministicDice > 100 { deterministicDice = 1 }
            playerOneSum += deterministicDice
            deterministicDice += 1
            diceRollCount += 1
            if deterministicDice > 100 { deterministicDice = 1 }
            playerOneSum += deterministicDice
            deterministicDice += 1
            diceRollCount += 1
            if deterministicDice > 100 { deterministicDice = 1 }

            playerOneSum += playerPositions.1

            while playerOneSum > 10 {
                playerOneSum -= 10
            }

            scores = (scores.0, scores.1 + playerOneSum)
            playerPositions = (playerPositions.0, playerOneSum)
        }
        return String((scores.0 < scores.1 ? scores.0 : scores.1) * diceRollCount) 
    }

    func taskOneLogic() -> String { 
        var map: [String: (UInt64, UInt64)] = [:]

        func playerZero(playerPositions: (UInt64, UInt64), scores: (UInt64, UInt64), zeroPlayer: Bool) -> (UInt64, UInt64) {
            let key = "\(playerPositions.0),\(playerPositions.1),\(scores.0),\(scores.1),\(zeroPlayer)"
            if let result = map[key] { return result }
            if scores.1 >= 21 {
                return zeroPlayer ? (0, 1) : (1, 0)
            }
            let sums : [UInt64] = stride(from: 1, through: 3, by: 1)
                .flatMap { zero in return stride(from: 1, through: 3, by: 1)
                    .flatMap {one in return stride(from: 1, through: 3, by: 1).map { zero + one + $0 }}}
            let intermediates : [(UInt64, UInt64)] = sums
                .map {
                    var temp = playerPositions.0 + $0
                    temp = temp > 10 ? temp - 10 : temp
                    return playerZero(playerPositions: (playerPositions.1, temp), scores: (scores.1, scores.0 + temp), zeroPlayer: !zeroPlayer)
                }
            let ret = intermediates
                .reduce((0, 0)) { ($0.0 + $1.0, $0.1 + $1.1) }
            map[key] = ret
            return ret
        }

        let result = playerZero(playerPositions: (UInt64(initialPositions.0), UInt64(initialPositions.1)), scores: (0, 0), zeroPlayer: true)
        return String(result.0 > result.1 ? result.0 : result.1) 
    }
}