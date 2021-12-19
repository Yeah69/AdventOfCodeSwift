func vecAdd(_ left: (Int, Int, Int), _ right: (Int, Int, Int)) -> (Int, Int, Int) {
    (left.0 + right.0, left.1 + right.1, left.2 + right.2)
}

func vecInversion(_ vec: (Int, Int, Int)) -> (Int, Int, Int) {
    (-vec.0, -vec.1, -vec.2)
}

func vec(from: (Int, Int, Int), to: (Int, Int, Int)) -> (Int, Int, Int) {
    (to.0 - from.0, to.1 - from.1, to.2 - from.2)
}

func manDist(_ from: (Int, Int, Int), _ to: (Int, Int, Int)) -> Int {
    abs(from.0 - to.0) + abs(from.1 - to.1) + abs(from.2 - to.2)
}

class Day19 : Day {
    let label = "19"
    let input = inputDay19


    class Scanner {
        let scannerPositions: [(Int, Int, Int)]
        let beaconsDict: [String: (Int, Int, Int)]
        let distances: [String: [String: Int]]

        init(beacons: [(Int, Int, Int)], scanners: [(Int, Int, Int)]) {
            scannerPositions = scanners
            var tempBeacons : [String: (Int, Int, Int)] = [:]
            for beacon in beacons {
                tempBeacons["\(beacon.0),\(beacon.1),\(beacon.2)"] = beacon
            }
            beaconsDict = tempBeacons

            var temp: [String: [String: Int]] = [:]
            for (i, beacon) in beaconsDict {
                var currentDistances: [String: Int] = [:]
                for (j, otherBeacon) in beaconsDict {
                    if i == j { continue }
                    let distance = abs(beacon.0 - otherBeacon.0) + abs(beacon.1 - otherBeacon.1) + abs(beacon.2 - otherBeacon.2)
                    currentDistances[j] = distance
                }
                temp[i] = currentDistances
            }
            distances = temp
        }

        func distanceMatch(other: Scanner) -> [(String, String)]? {
            var matchingBeacons: [(String, String)] = []
            for (myBeaconId, myBeaconDistances) in distances {
                for (otherBeaconId, otherBeaconDistances) in other.distances {
                    let matchingDistances = myBeaconDistances
                        .values
                        .map { otherBeaconDistances.values.contains($0) }
                        .filter { $0 }
                        .count
                    if matchingDistances >= 11 {
                        matchingBeacons.append((myBeaconId, otherBeaconId))
                    }
                }
            }
            if matchingBeacons.count >= 12 {
                return matchingBeacons
            }
            return nil
        }

        func match(other: Scanner) -> Scanner? {
            func getTransformation(left: (Int, Int, Int), right: (Int, Int, Int)) -> ((Int, Int, Int)) -> (Int, Int, Int) {
                func getZeroItem(_ tuple: (Int, Int, Int)) -> Int { tuple.0 }
                func getFirstItem(_ tuple: (Int, Int, Int)) -> Int { tuple.1 }
                func getSecondItem(_ tuple: (Int, Int, Int)) -> Int { tuple.2 }
                func getInversion(_ i: Int) -> Int { -i }

                let getXPosition = abs(left.0) == abs(right.0)
                    ? getZeroItem
                    : abs(left.1) == abs(right.0)
                        ? getFirstItem
                        : getSecondItem
                let getX = getXPosition(left) == right.0 ? getXPosition : { getInversion(getXPosition($0)) }

                let getYPosition = abs(left.0) == abs(right.1)
                    ? getZeroItem
                    : abs(left.1) == abs(right.1)
                        ? getFirstItem
                        : getSecondItem
                let getY = getYPosition(left) == right.1 ? getYPosition : { getInversion(getYPosition($0)) }

                let getZPosition = abs(left.0) == abs(right.2)
                    ? getZeroItem
                    : abs(left.1) == abs(right.2)
                        ? getFirstItem
                        : getSecondItem
                let getZ = getZPosition(left) == right.2 ? getZPosition : { getInversion(getZPosition($0)) }

                return { (getX($0), getY($0), getZ($0)) }
            }

            if let distanceMatched = distanceMatch(other: other) {
                for j in 0 ..< distanceMatched.count {
                    let firstPair = distanceMatched[j]
                    for i in 0 ..< distanceMatched.count {
                        if i == j { continue }
                        let secondPair = distanceMatched[i]
                        let myVec = vec(from: beaconsDict[firstPair.0]!, to: beaconsDict[secondPair.0]!)
                        let otherVec = vec(from: other.beaconsDict[firstPair.1]!, to: other.beaconsDict[secondPair.1]!)
                        let transformation = getTransformation(left: otherVec, right: myVec)
                        let otherOrigin = vecAdd(beaconsDict[firstPair.0]!, transformation(vecInversion(other.beaconsDict[firstPair.1]!)))
                        let otherOriginText = "\(otherOrigin.0),\(otherOrigin.1),\(otherOrigin.2)"
                        let count = distanceMatched
                            .map { vecAdd(beaconsDict[$0.0]!, transformation(vecInversion(other.beaconsDict[$0.1]!))) }
                            .filter { "\($0.0),\($0.1),\($0.2)" == otherOriginText }
                            .count
                        if count >= 12 {
                            return Scanner(beacons: beaconsDict.values + other.beaconsDict.values.map { vecAdd(otherOrigin, transformation($0)) }, scanners: scannerPositions + [otherOrigin])
                        }
                    }
                }
            }
            return nil
        }
    }

    lazy var initialScanners: [Scanner] = {
        var lines = input.split(whereSeparator: \.isNewline)
        var currentScanner: [(Int, Int, Int)] = []
        var ret: [Scanner] = []
        for line in lines.suffix(lines.count - 1) {
            let strLine = String(line)
            let comps = strLine.components(separatedBy: ",")
            if comps.count == 3 {
                currentScanner.append((Int(comps[0]) ?? 0, Int(comps[1]) ?? 0, Int(comps[2]) ?? 0))
            }
            else {
                ret.append(Scanner(beacons: currentScanner, scanners: [(0, 0, 0)]))
                currentScanner = []
            }
        }
        ret.append(Scanner(beacons: currentScanner, scanners: [(0, 0, 0)]))
        return ret
    }()

    lazy var unifiedScanner: Scanner = {
        var scanners = initialScanners.map { $0 }

        var unified = scanners[0]
        scanners.remove(at: 0)
        
        var temp = scanners.count
        repeat {
            temp = scanners.count
            for i in 0 ..< scanners.count {
                let oneScanner = scanners[i]
                if let newScanner = unified.match(other: oneScanner) {
                    unified = newScanner
                    scanners.remove(at: i)
                    break
                }
            }
        } while scanners.count > 0
        return unified
    }()


    func taskZeroLogic() -> String { String(unifiedScanner.beaconsDict.values.count) }
    func taskOneLogic() -> String { 
        let max = stride(from: 0, to: unifiedScanner.scannerPositions.count, by: 1)
            .flatMap { left in return stride(from: 0, to: unifiedScanner.scannerPositions.count, by: 1).map { (left, $0) } }
            .map { manDist(unifiedScanner.scannerPositions[$0.0], unifiedScanner.scannerPositions[$0.1]) }
            .max() ?? 0
        return String(max) 
    }
}