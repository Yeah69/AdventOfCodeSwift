func day01Scan(_ measurements: [Int], andCountSubsequentIncreasingSumsOf elementCount: Int) -> Int {
    let mapped = stride(from: 0, to: measurements.count - elementCount, by: 1)
        .map { measurements[$0...($0 + elementCount)] }
    return mapped
        .filter { $0.prefix($0.count - 1).reduce(0, +) < $0.suffix($0.count - 1).reduce(0, +) }
        .count
}

print("")
let measurements = inputDay01.split(whereSeparator: \.isNewline).map { Int($0) }.compactMap { $0 }
print(day01Scan(measurements, andCountSubsequentIncreasingSumsOf: 1))
print(day01Scan(measurements, andCountSubsequentIncreasingSumsOf: 3))