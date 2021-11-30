class Day13 : Day {
    let label = "13"
    let input = inputDay13

    enum FoldInstruction {
        case x(Int)
        case y(Int)
    }

    lazy var initialCoordinates: [(Int, Int)] = {
         return input
            .split(whereSeparator: \.isNewline)
            .map { String($0).components(separatedBy: ",") }
            .filter { $0.count == 2 }
            .compactMap { 
                if let x = Int($0[0]), let y = Int($0[1]) { return (x, y) }
                return nil
            }
    }()

    lazy var foldInstructions: [FoldInstruction] = {
         return input
            .split(whereSeparator: \.isNewline)
            .map { String($0).components(separatedBy: "=") }
            .filter { $0.count == 2 }
            .compactMap { 
                if let coordinate = Int($0[1]) { 
                    return $0[0].hasSuffix("x") ? FoldInstruction.x(coordinate) : FoldInstruction.y(coordinate)
                }
                return nil
            }
    }()

    func fold(coordinates: [(Int, Int)], byInstruction instruction: FoldInstruction) -> [(Int, Int)] {
        func foldX(_ coordinate: Int) -> [(Int, Int)] {
            var leftHalf = Array(coordinates.filter { $0.0 < coordinate })
            let rightHalf = coordinates.filter { $0.0 > coordinate } 
            for right in rightHalf {
                leftHalf.append((2 * coordinate - right.0, right.1))
            }
            return leftHalf
        }

        func foldY(_ coordinate: Int) -> [(Int, Int)] {
            var upperHalf = Array(coordinates.filter { $0.1 < coordinate }) 
            let lowerHalf = coordinates.filter { $0.1 > coordinate } 
            for lower in lowerHalf {
                upperHalf.append((lower.0, 2 * coordinate - lower.1))
            }
            return upperHalf
        }

        switch instruction {
            case let .x(coordinate): return foldX(coordinate)
            case let .y(coordinate): return foldY(coordinate)
        }
    }

    func taskZeroLogic() -> String { 
        let firstFold = fold(coordinates: initialCoordinates, byInstruction: foldInstructions[0])
        return String(Set<String>(firstFold.map { "\($0.0),\($0.1)" }).count) 
    }

    func taskOneLogic() -> String { 
        let finalFold = foldInstructions.reduce (initialCoordinates) { fold(coordinates: $0, byInstruction: $1) }
        let sety = Set<String>(finalFold.map { "\($0.0),\($0.1)" })
        let maxX = finalFold.map { $0.0 }.max() ?? -1
        let maxY = finalFold.map { $0.1 }.max() ?? -1
        for y in 0...maxY {
            var line = ""
            for x in 0...maxX {
                line += sety.contains("\(x),\(y)") ? "#" : "."
            }
            print(line)
        }
        return "See the render above" 
    }
}