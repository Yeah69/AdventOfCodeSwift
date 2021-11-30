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
        func getIntervals(dataGetter: ((Bool, (Int64, Int64), (Int64, Int64), (Int64, Int64))) -> (Int64, Int64)) -> [(Int64, Int64)] {
            let gotData = data.map(dataGetter)

            let min = gotData.map { $0.0 }.min() ?? Int64.min
            let max = gotData.map { $0.1 }.max() ?? Int64.max
        
            var intervals: [(Int64, Int64)] = [(min, max)]

            for datum in gotData {
                var i = intervals.count - 1
                while intervals[i].0 > datum.0 {
                    i -= 1
                }
                if intervals[i].0 < datum.0 {
                    let toSplit = intervals[i]
                    intervals.insert((datum.0, toSplit.1), at: i + 1)
                    intervals.insert((toSplit.0, datum.0 - 1), at: i + 1)
                    intervals.remove(at: i)
                }
                i = 0
                while intervals[i].1 < datum.1 {
                    i += 1
                }
                if intervals[i].1 > datum.1 {
                    let toSplit = intervals[i]
                    intervals.insert((toSplit.0, datum.1), at: i)
                    intervals.insert((datum.1 + 1, toSplit.1), at: i + 1)
                    intervals.remove(at: i + 2)
                }
            }
            return intervals
        }

        let xIntervals = getIntervals { $0.1 }
        let yIntervals = getIntervals { $0.2 }
        let zIntervals = getIntervals { $0.3 }

        var onSections : Set<Key> = Set()

        for (on, xRange, yRange, zRange) in data {
            if let xStart = xIntervals.firstIndex(where: { $0.0 == xRange.0 }), let xEnd = xIntervals.lastIndex(where: { $0.1 == xRange.1 }),
               let yStart = yIntervals.firstIndex(where: { $0.0 == yRange.0 }), let yEnd = yIntervals.lastIndex(where: { $0.1 == yRange.1 }),
               let zStart = zIntervals.firstIndex(where: { $0.0 == zRange.0 }), let zEnd = zIntervals.lastIndex(where: { $0.1 == zRange.1 }) {
                for x in xStart ... xEnd {
                    for y in yStart ... yEnd {
                        for z in zStart ... zEnd {
                            if on {
                                onSections.insert(Key(x, y, z))
                            }
                            else {
                                onSections.remove(Key(x, y, z))
                            }
                        }
                    }
                }
            }
        }

        let ret: [UInt64] = onSections.map { UInt64(xIntervals[$0.x].1 - xIntervals[$0.x].0 + 1) * UInt64(yIntervals[$0.y].1 - yIntervals[$0.y].0 + 1) * UInt64(zIntervals[$0.z].1 - zIntervals[$0.z].0 + 1) }

        return String(ret.reduce(UInt64(0), +))
    }

    struct Key: Hashable {
        var x: Int
        var y: Int 
        var z: Int

        init(_ x: Int, _ y: Int, _ z: Int) {
            self.x = x
            self.y = y
            self.z = z
        }
    }
}