class Day15 : Day {
    let label = "15"
    let input = inputDay15

    lazy var risks: [[Int]] = { input.split(whereSeparator: \.isNewline).map { String($0).compactMap { Int(String($0))} } }()


    func day15Logic(_ currentRisks: [[Int]]) -> String { 
        var minCosts: [String: Int] = [:]
        minCosts["0,0"] = 0
        let first = Node(y: 0, x: 0, costSofar: 0)

        var heap = Heap<Node> { $0.costSofar < $1.costSofar }
        heap.insert(first)
        while !heap.isEmpty {
            guard let current = heap.remove() else { break }
            let y = current.y
            let x = current.x

            let neighbors = [(y - 1, x), (y + 1, x), (y, x - 1), (y, x + 1)]
                .filter { $0.0 >= 0 && $0.0 < currentRisks.count && $0.1 >= 0 && $0.1 < currentRisks[0].count }

            for neighbor in neighbors {
                let neighborCost = currentRisks[neighbor.0][neighbor.1]
                let pathCosts = current.costSofar + neighborCost
                if neighbor.0 == (currentRisks.count - 1) && neighbor.1 == (currentRisks[0].count - 1) {
                    return String(pathCosts)
                }
                let coordText = "\(neighbor.0),\(neighbor.1)"
                if pathCosts < (minCosts[coordText] ?? Int.max) {
                    minCosts[coordText] = pathCosts
                    let next = Node(y: neighbor.0, x: neighbor.1, costSofar: pathCosts)
                    heap.insert(next)
                }
            }
        }

        return "Nope" 
    }
    func taskZeroLogic() -> String { day15Logic(risks) }
    func taskOneLogic() -> String {
        var temp: [[Int]] = []
        for y in 0 ..< (risks.count * 5) {
            let modY = y % risks.count
            let addY = y / risks.count
            let riskRow = risks[modY]
            var tempRow: [Int] = []
            for x in 0 ..< (riskRow.count * 5) {
                let modX = x % riskRow.count
                let addX = x / riskRow.count
                let original = riskRow[modX]
                var value = original + addY + addX
                while value > 9 {
                    value -= 9
                }
                tempRow.append(value)
            }
            temp.append(tempRow)
        }
        return day15Logic(temp)
    }

    struct Node {
        let y: Int
        let x: Int 

        let costSofar: Int

        init(y: Int, x: Int, costSofar: Int) {
            self.y = y
            self.x = x
            self.costSofar = costSofar
        }
    }
}