class Day02 : Day {
    let label = "02"
    let input = inputDay02

    enum Direction {
        case up, down, forward
    }

    lazy var plannedCourse: [(Direction, Int)] = {
            input.split(whereSeparator: \.isNewline).map { 
            let split = $0.components(separatedBy: " ")
            let maybeDirection : Direction? = { switch split[0] {
                case "up": return Direction.up
                case "down": return Direction.down
                case "forward": return Direction.forward
                default: return nil
            } }()
            let maybeUnit = Int(split[1])
            if let direction = maybeDirection, let unit = maybeUnit {
                return (direction, unit)
            }
            else {
                return nil
            }
        }.compactMap { $0 }
    }()

    func day02Logic(_ reduceFunc: ((Int, Int), (Direction, Int)) -> (Int, Int)) -> String {
        let result = plannedCourse.reduce((0, 0), reduceFunc)
        return String(result.0 * result.1)
    }

    func taskZeroLogic() -> String { 
        return day02Logic {
            switch $1.0 {
            case Direction.up: return ($0.0 - $1.1, $0.1)
            case Direction.down: return ($0.0 + $1.1, $0.1)
            case Direction.forward: return ($0.0, $0.1 + $1.1)
            }
        }
    }

    func taskOneLogic() -> String { 
        var aim = 0
        return day02Logic { agg, inst in
            aim =  { switch inst.0 {
                case Direction.up: return aim - inst.1
                case Direction.down: return aim + inst.1
                case Direction.forward: return aim
            } }()

            switch inst.0 {
                case Direction.up: return agg
                case Direction.down: return agg
                case Direction.forward: return (agg.0 + aim * inst.1, agg.1 + inst.1)
            }
        }
    }
}