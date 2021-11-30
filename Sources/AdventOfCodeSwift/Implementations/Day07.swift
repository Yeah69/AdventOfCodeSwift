class Day07 : Day {
    let label = "07"
    let input = inputDay07

    lazy var horizontalPositions: [Int] = {
        input.components(separatedBy: ",").compactMap { Int($0) }
    }()

    lazy var minPosition: Int = {
        horizontalPositions.min() ?? 2147483647
    }()

    lazy var maxPosition: Int = {
        horizontalPositions.max() ?? -2147483648
    }()

    func day07Logic(_ distanceToFuelCosts: (Int) -> Int) -> String {
        let costs = stride(from: minPosition, through: maxPosition, by: 1)
            .map { target in horizontalPositions.map { abs(target - $0) }.map(distanceToFuelCosts).reduce(0,+) }
            .min() ?? 0
        return String(costs) 
    }

    func taskZeroLogic() -> String { day07Logic { $0 } }
    func taskOneLogic() -> String  { day07Logic { n in n * (n + 1) / 2 } }
}