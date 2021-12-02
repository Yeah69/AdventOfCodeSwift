class Day01 : Day {
    let label = "01"
    let input = inputDay01

    lazy var measurements: [Int] = {
        input.split(whereSeparator: \.isNewline).map { Int($0) }.compactMap { $0 }
    }()

    func scanMeasurements(andCountSubsequentIncreasingSumsOf elementCount: Int) -> String {
        let mapped = stride(from: 0, to: measurements.count - elementCount, by: 1)
            .map({ (prev: measurements[$0], next: measurements[$0 + elementCount]) })
        return String(mapped.filter({ $0.prev < $0.next }).count)
    }

    func taskZeroLogic() -> String { scanMeasurements(andCountSubsequentIncreasingSumsOf: 1) }
    func taskOneLogic() -> String { scanMeasurements(andCountSubsequentIncreasingSumsOf: 3) }
}