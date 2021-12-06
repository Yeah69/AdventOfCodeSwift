class Day06 : Day {
    let label = "06"
    let input = inputDay06

    lazy var initialAges: [UInt64] = {
        input.components(separatedBy: ",").compactMap { UInt64($0) }
    }()

    func simulate(numberOfDays: Int) -> String {
        var fishCountedByAge = Dictionary(uniqueKeysWithValues: 
            Dictionary(grouping: initialAges, by: { Int($0) })
                .map { key, value in (key, value.count) })
        for _ in 0 ..< numberOfDays {
            let temp = fishCountedByAge[0] ?? 0
            for i in 0 ..< 8 {
                fishCountedByAge[i] = fishCountedByAge[i + 1] ?? 0
            }
            fishCountedByAge[6] = (fishCountedByAge[6] ?? 0) + temp
            fishCountedByAge[8] = temp
        }
        return String(fishCountedByAge.values.reduce(0,+)) 
    }

    func taskZeroLogic() -> String { simulate(numberOfDays: 80) }
    func taskOneLogic() -> String { simulate(numberOfDays: 256) }
}