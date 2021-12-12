class Day12 : Day {
    let label = "12"
    let input = inputDay12

    class PathNode {
        let name: String
        let isBig: Bool
        let isStart: Bool
        let isEnd: Bool
        var neighbors: [PathNode] = []
        var isVisited = false
        var visitsCount = 0

        init(name: String) {
            self.name = name
            self.isBig = name.allSatisfy { $0.isUppercase }
            self.isStart = name == "start"
            self.isEnd = name == "end"
        }

        func visit(path: [PathNode], countOfDoubles: Int) {
            var newPath: [PathNode] = path.map{$0}
            newPath.append(self)
            if isStart && path.isEmpty {
                for neighbor in neighbors {
                    neighbor.visit(path: newPath, countOfDoubles: countOfDoubles)
                }
                return
            }
            if isStart {
                return
            }
            if isEnd {
                visitsCount += 1;
                return
            }
            for neighbor in neighbors {
                let sorted = newPath.filter{ !$0.isBig }.map{ $0.name }.sorted()
                let doubles = stride(from: 0, to: sorted.count - 1, by: 1).filter { sorted[$0] == sorted[$0 + 1] }.count
                if doubles <= countOfDoubles {
                    neighbor.visit(path: newPath, countOfDoubles: countOfDoubles)
                }
            }
        }
    }

    func getNodes() -> [PathNode] {
        let connections: [(String, String)] = input
            .split(whereSeparator: \.isNewline)
            .map {
                let components = String($0).components(separatedBy: "-")
                return (components[0], components[1])
            }
        let nodeList: [PathNode] = Set(connections.flatMap { [$0.0, $0.1] }).map(PathNode.init)
        let nodeDictionary = Dictionary(uniqueKeysWithValues: nodeList.map { ($0.name, $0) })
        for connection in connections {
            if let zero = nodeDictionary[connection.0], let one = nodeDictionary[connection.1] {
                zero.neighbors.append(one)
                one.neighbors.append(zero)
            }
        }
        return nodeList
    }

    func day12Logic(countOfDoubles: Int) -> String {
        let nodes = getNodes()
        let startNode: PathNode? = nodes.first { $0.isStart }
        let endNode: PathNode? = nodes.first { $0.isEnd }
        if let start = startNode, let end = endNode {
            start.visit(path: [], countOfDoubles: countOfDoubles)
            return String(end.visitsCount) 
        }
        return noSolutionFound
    }

    func taskZeroLogic() -> String { day12Logic(countOfDoubles: 0) }
    func taskOneLogic() -> String { day12Logic(countOfDoubles: 1) }
}