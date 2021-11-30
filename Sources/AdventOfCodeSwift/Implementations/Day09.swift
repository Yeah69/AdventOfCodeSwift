public struct Queue<T> {

  fileprivate var list: [T] = []

  public var isEmpty: Bool {
    return list.isEmpty
  }
  
  public mutating func enqueue(_ element: T) {
    list.append(element)
  }

  public mutating func dequeue() -> T? {
    guard !list.isEmpty, let element = list.first else { return nil }

    list.removeFirst()

    return element
  }

  public func peek() -> T? {
    return list.first
  }
}

class Day09 : Day {
    let label = "09"
    let input = inputDay09

    lazy var heights: [Int: [Int: Int]] = {
        var yDict: [Int: [Int: Int]] = [Int: [Int: Int]]()
        var y = 0
        for row in input.split(whereSeparator: \.isNewline).map({ String($0) }){
            var xDict: [Int: Int] = [Int: Int]()
            var x = 0
            for digitText in row {
                if let digit = Int(String(digitText)) {
                    xDict[x] = digit
                }
                x += 1
            }
            yDict[y] = xDict
            y += 1
        }
        return yDict
    }()

    func getNeighborCoordinates(ofY y: Int, andX x: Int) -> [(Int, Int)] { [(y - 1, x), (y + 1, x), (y, x - 1), (y, x + 1)] }

    lazy var lowPoints: [(Int, Int)] = {
        heights
            .flatMap { (y, xDict) in 
                return xDict.compactMap { (x, digit) in return (y, x, digit) }
            }
            .filter { 
                let (y, x, digit) = $0
                return getNeighborCoordinates(ofY: y, andX: x)
                    .compactMap {
                        let (y, x) = $0
                        return heights[y]?[x]
                    }
                    .allSatisfy { $0 > digit }
            }
            .map { ($0.0, $0.1) }
    }()

    func taskZeroLogic() -> String { 
        let solution = lowPoints
            .compactMap { heights[$0.0]?[$0.1] }
            .map { $0 + 1 }
            .reduce(0, +)
        return String(solution) 
    }
    func taskOneLogic() -> String { 
        func determineBasinSize(for lowPoint: (Int, Int)) -> Int {
            var queue = Queue<(Int, Int)>()
            queue.enqueue(lowPoint)
            var pointSet = Set<String>()
            while !queue.isEmpty {
                if let currentPosition = queue.dequeue() {
                    let setKey = "\(currentPosition.0),\(currentPosition.1)"
                    if !pointSet.contains(setKey) {
                        pointSet.insert(setKey)
                        if let positionDigit = heights[currentPosition.0]?[currentPosition.1] {
                            let nexts = getNeighborCoordinates(ofY: currentPosition.0, andX: currentPosition.1)
                                .filter { if let temp = heights[$0.0]?[$0.1] { return temp >= positionDigit && temp < 9 } else { return false } }
                            for next in nexts {
                                queue.enqueue(next)
                            }
                        }
                    }
                }
            }
            return pointSet.count
        }

        return String(lowPoints.map(determineBasinSize).sorted().suffix(3).reduce(1, *))
    }
}