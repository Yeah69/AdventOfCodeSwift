class Day11 : Day {
    let label = "11"
    let input = inputDay11

    class DumboOctopus {
        var neighbors: [DumboOctopus]? = nil
        let x: Int
        let y: Int
        var countOfFlashes: Int = 0
        var energyLevel: Int

        init(_ x: Int, _ y: Int, _ energyLevel: Int) {
            self.x = x
            self.y = y
            self.energyLevel = energyLevel
        }

        func increase() {
            if energyLevel < 10 {
                energyLevel += 1
                if energyLevel == 10, let existingNeighbors = neighbors {
                    for neighbor in existingNeighbors {
                        neighbor.increase()
                    }
                }
            }
        }

        func completion() {
            if energyLevel == 10 {
                energyLevel = 0
                countOfFlashes += 1
            }
        }
    }

    lazy var dumboOctopuses: [DumboOctopus] = { 
        let dumbos = input
            .split(whereSeparator: \.isNewline)
            .enumerated()
            .flatMap { (y, rowText) in return String(rowText)
                .enumerated()
                .compactMap { (x, energyText) in 
                    if let energyLevel = Int(String(energyText)) {
                        return (x, y, energyLevel)
                    }
                    return nil
                }
            }
            .map(DumboOctopus.init)
        let dict = Dictionary(uniqueKeysWithValues: dumbos.map { ("\($0.x),\($0.y)", $0) })
        for dumbo in dumbos {
            let x = dumbo.x
            let y = dumbo.y
            dumbo.neighbors =
                [ (x - 1, y - 1), (x    , y - 1), (x + 1, y - 1),
                  (x - 1, y    ),                 (x + 1, y    ),
                  (x - 1, y + 1), (x    , y + 1), (x + 1, y + 1)]
                .compactMap { dict["\($0.0),\($0.1)"] }
        }
        return dumbos
    }()

    var hundrethStepFlashCount: Int? = nil
    var synchronizedStep: Int? = nil
    var stepCount = 0
    func step() {
        for dumboOctopus in dumboOctopuses {
            dumboOctopus.increase()
        }
        for dumboOctopus in dumboOctopuses {
            dumboOctopus.completion()
        }
        stepCount += 1
        if stepCount == 100 {
            hundrethStepFlashCount = dumboOctopuses.map { $0.countOfFlashes }.reduce(0, +)
        }
        if dumboOctopuses.allSatisfy({ $0.energyLevel == 0 }){
            synchronizedStep = stepCount
        }
    }

    func taskZeroLogic() -> String { 
        while hundrethStepFlashCount == nil { step() }
        return String(hundrethStepFlashCount ?? 0) 
    }
    func taskOneLogic() -> String { 
        while synchronizedStep == nil { step() }
        return String(synchronizedStep ?? 0) 
    }
}