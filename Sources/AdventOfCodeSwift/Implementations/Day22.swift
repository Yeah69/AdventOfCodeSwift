class Day22 : Day {
    let label = "22"
    let input = inputDay22

    lazy var data: [(Bool,(Int64, Int64), (Int64, Int64), (Int64, Int64))] = {
        input.split(whereSeparator: \.isNewline)
            .map {
                let str = String($0)
                let on = str.starts(with: "on")
                let dimTexts = str.components(separatedBy: ",")
                let xDimText = String(dimTexts[0]).components(separatedBy: "=")
                let xBorders = String(xDimText[1]).components(separatedBy: "..")
                let x = (Int64(String(xBorders[0])) ?? 0, Int64(String(xBorders[1])) ?? 0)
                let yDimText = String(dimTexts[1]).components(separatedBy: "=")
                let yBorders = String(yDimText[1]).components(separatedBy: "..")
                let y = (Int64(String(yBorders[0])) ?? 0, Int64(String(yBorders[1])) ?? 0)
                let zDimText = String(dimTexts[2]).components(separatedBy: "=")
                let zBorders = String(zDimText[1]).components(separatedBy: "..")
                let z = (Int64(String(zBorders[0])) ?? 0, Int64(String(zBorders[1])) ?? 0)
                return (on, x, y, z) 
            }
    }()

    func taskZeroLogic() -> String { 
        var onPoints : Set<String> = Set()
        let filteredData = data.filter { 
            $0.1.0 >= Int64(-50) && $0.2.0 >= Int64(-50) && $0.3.0 >= Int64(-50)
            && $0.1.1 <= Int64(50) && $0.2.1 <= Int64(50) && $0.3.1 <= Int64(50) }
        for (on, xRange, yRange, zRange) in filteredData {
            for x in xRange.0 ... xRange.1 {
                for y in yRange.0 ... yRange.1 {
                    for z in zRange.0 ... zRange.1 {
                        let key = "\(x),\(y),\(z)"
                        if on {
                            onPoints.insert(key)
                        }
                        else {
                            onPoints.remove(key)
                        }
                    }
                }
            }
        }
        return String(onPoints.count) 
    }
    func taskOneLogic() -> String { 
        func cuts(cutted: ((Int64, Int64), (Int64, Int64), (Int64, Int64)), cutter: ((Int64, Int64), (Int64, Int64), (Int64, Int64))) -> Bool {
            ((cutter.0.0 >= cutted.0.0 && cutter.0.0 <= cutted.0.1) || (cutter.0.1 >= cutted.0.0 && cutter.0.1 <= cutted.0.1))
            && ((cutter.1.0 >= cutted.1.0 && cutter.1.0 <= cutted.1.1) || (cutter.1.1 >= cutted.1.0 && cutter.1.1 <= cutted.1.1))
            && ((cutter.2.0 >= cutted.2.0 && cutter.2.0 <= cutted.2.1) || (cutter.2.1 >= cutted.2.0 && cutter.2.1 <= cutted.2.1))
        }

        func subIntervalls(of: (Int64, Int64), cuttedBy: (Int64, Int64)) -> ((Int64, Int64), (Int64, Int64)) {
            if cuttedBy.0 < of.0 {
                return ((of.0, cuttedBy.1), (cuttedBy.1 + 1, of.1))
            }
            return ((of.0, cuttedBy.0 - 1), (cuttedBy.0, of.1))
        }

        var onCuboids : [((Int64, Int64), (Int64, Int64), (Int64, Int64))] = []
        for (on, xRange, yRange, zRange) in data.prefix(3) {
            if on {
                var queue: Queue<((Int64, Int64), (Int64, Int64), (Int64, Int64))> = Queue()
                queue.enqueue((xRange, yRange, zRange))
                while let currentCuboid = queue.dequeue() {
                    if let firstCut = onCuboids.first(where: { cuts(cutted: $0, cutter: currentCuboid)}) {
                        print("\(currentCuboid) cuts \(firstCut)")
                        if currentCuboid.0.0 >= firstCut.0.0 && currentCuboid.0.1 <= firstCut.0.1
                            && currentCuboid.1.0 >= firstCut.1.0 && currentCuboid.1.1 <= firstCut.1.1
                            && currentCuboid.2.0 >= firstCut.2.0 && currentCuboid.2.1 <= firstCut.2.1 {
                            print("cutter completely contained")
                            continue // currentCuboid is contained completely
                        }
                        let newXIntervalls = subIntervalls(of: currentCuboid.0, cuttedBy: firstCut.0)
                        print("newXIntervalls \(newXIntervalls)")
                        let newYIntervalls = subIntervalls(of: currentCuboid.1, cuttedBy: firstCut.1)
                        print("newYIntervalls \(newYIntervalls)")
                        let newZIntervalls = subIntervalls(of: currentCuboid.2, cuttedBy: firstCut.2)
                        print("newZIntervalls \(newZIntervalls)")
                        queue.enqueue((newXIntervalls.0, newYIntervalls.0, newZIntervalls.0))
                        queue.enqueue((newXIntervalls.0, newYIntervalls.0, newZIntervalls.1))
                        queue.enqueue((newXIntervalls.0, newYIntervalls.1, newZIntervalls.0))
                        queue.enqueue((newXIntervalls.0, newYIntervalls.1, newZIntervalls.1))
                        queue.enqueue((newXIntervalls.1, newYIntervalls.0, newZIntervalls.0))
                        queue.enqueue((newXIntervalls.1, newYIntervalls.0, newZIntervalls.1))
                        queue.enqueue((newXIntervalls.1, newYIntervalls.1, newZIntervalls.0))
                        queue.enqueue((newXIntervalls.1, newYIntervalls.1, newZIntervalls.1))
                    }
                    else {
                        print("appending \(currentCuboid)")
                        onCuboids.append(currentCuboid)
                    }
                }
            }
            else {
                var queue: Queue<((Int64, Int64), (Int64, Int64), (Int64, Int64))> = Queue()
                queue.enqueue((xRange, yRange, zRange))
                while !queue.isEmpty {
                    let currentCuboid = queue.dequeue()!
                    if let firstCut = onCuboids.first(where: { cuts(cutted: currentCuboid, cutter: $0)}) {
                        onCuboids.remove(at: onCuboids.firstIndex(where: { 
                            $0.0.0 == firstCut.0.0 && $0.0.1 == firstCut.0.1
                            && $0.1.0 == firstCut.1.0 && $0.1.1 == firstCut.1.1
                            && $0.2.0 == firstCut.2.0 && $0.2.1 == firstCut.2.1  })!)
                        if firstCut.0.0 >= currentCuboid.0.0 && firstCut.0.1 <= currentCuboid.0.1
                            && firstCut.1.0 >= currentCuboid.1.0 && firstCut.1.1 <= currentCuboid.1.1
                            && firstCut.2.0 >= currentCuboid.2.0 && firstCut.2.1 <= currentCuboid.2.1 {
                            continue // currentCuboid is contained completely
                        }
                        let newXIntervalls = subIntervalls(of: firstCut.0, cuttedBy: currentCuboid.0)
                        let newYIntervalls = subIntervalls(of: firstCut.1, cuttedBy: currentCuboid.1)
                        let newZIntervalls = subIntervalls(of: firstCut.2, cuttedBy: currentCuboid.2)
                        onCuboids.append((newXIntervalls.0, newYIntervalls.0, newZIntervalls.0))
                        onCuboids.append((newXIntervalls.0, newYIntervalls.0, newZIntervalls.1))
                        onCuboids.append((newXIntervalls.0, newYIntervalls.1, newZIntervalls.0))
                        onCuboids.append((newXIntervalls.0, newYIntervalls.1, newZIntervalls.1))
                        onCuboids.append((newXIntervalls.1, newYIntervalls.0, newZIntervalls.0))
                        onCuboids.append((newXIntervalls.1, newYIntervalls.0, newZIntervalls.1))
                        onCuboids.append((newXIntervalls.1, newYIntervalls.1, newZIntervalls.0))
                        onCuboids.append((newXIntervalls.1, newYIntervalls.1, newZIntervalls.1))
                        queue.enqueue(currentCuboid)
                    }
                }
            }
        }
        return String(onCuboids.count) 
    }
}