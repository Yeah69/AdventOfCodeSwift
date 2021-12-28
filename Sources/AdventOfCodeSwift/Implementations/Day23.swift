class Day23 : Day {
    let label = "23"
    let input = inputDay23

    enum AmphipodType {
        case A
        case B
        case C
        case D
    }

    func getInitialZero(tiles: [Tile]) -> [Tile] {
        [tiles[11], tiles[16], tiles[15], tiles[17], tiles[13], tiles[18], tiles[12], tiles[14]]
    }

    func getInitialOne(tiles: [Tile]) -> [Tile] {
        [tiles[11], tiles[22], tiles[21], tiles[24], 
         tiles[19], tiles[23], tiles[17], tiles[20], 
         tiles[15], tiles[26], tiles[16], tiles[25], 
         tiles[14], tiles[18], tiles[12], tiles[13]]
    }

    class Tile  {

        let i: Int
        var up: Tile? = nil
        var down: Tile? = nil
        var left: Tile? = nil
        var right: Tile? = nil

        var isSideRoomOf: AmphipodType? = nil
        var isBeforeSideRoom: Bool = false
        var isNormalHallway: Bool = false

        var paths: [[Tile]] = []

        init(i: Int) {
            self.i = i
            up = nil; down = nil; left = nil; right = nil
            isSideRoomOf = nil; isBeforeSideRoom = false; isNormalHallway = false
        }

        func calculatePaths() {
            var queue: Queue<(Tile, [Tile])> = Queue()
            queue.enqueue((self, []))
            while let (lastTile, lastPath) = queue.dequeue() {
                for nextTile in [lastTile.up, lastTile.down, lastTile.left, lastTile.right].compactMap { $0 }.filter({ curr in return !lastPath.contains(where: { $0 === curr }) }) {
                    let nextPath = lastPath + [nextTile]
                    paths.append(nextPath)
                    queue.enqueue((nextTile, nextPath))
                }

            }
        }
    }

    func taskZeroLogic() -> String { 
        let tiles: [Tile] = [Tile(i: 0), Tile(i: 1), Tile(i: 2), Tile(i: 3), Tile(i: 4), 
            Tile(i: 5), Tile(i: 6), Tile(i: 7), Tile(i: 8), Tile(i: 9),
            Tile(i: 10), Tile(i: 11), Tile(i: 12), Tile(i: 13), Tile(i: 14),
            Tile(i: 15), Tile(i: 16), Tile(i: 17), Tile(i: 18)]

        for i in 0 ..< 10 {
            tiles[i].right = tiles[i + 1]
            tiles[i + 1].left = tiles[i]
        }

        for i in [0, 1, 3, 5, 7, 9, 10] {
            tiles[i].isNormalHallway = true
        }
        
        tiles[11].isSideRoomOf = .A
        tiles[11].up = tiles[2]
        tiles[11].down = tiles[12]
        tiles[12].isSideRoomOf = .A
        tiles[12].up = tiles[11]
        tiles[2].isBeforeSideRoom = true
        tiles[2].down = tiles[11]
        
        tiles[13].isSideRoomOf = .B
        tiles[13].up = tiles[4]
        tiles[13].down = tiles[14]
        tiles[14].isSideRoomOf = .B
        tiles[14].up = tiles[13]
        tiles[4].isBeforeSideRoom = true
        tiles[4].down = tiles[13]
        
        tiles[15].isSideRoomOf = .C
        tiles[15].up = tiles[6]
        tiles[15].down = tiles[16]
        tiles[16].isSideRoomOf = .C
        tiles[16].up = tiles[15]
        tiles[6].isBeforeSideRoom = true
        tiles[6].down = tiles[15]
        
        tiles[17].isSideRoomOf = .D
        tiles[17].up = tiles[8]
        tiles[17].down = tiles[18]
        tiles[18].isSideRoomOf = .D
        tiles[18].up = tiles[17]
        tiles[8].isBeforeSideRoom = true
        tiles[8].down = tiles[17]

        for tile in tiles {
            tile.calculatePaths()
        }

        var heap: Heap<(Int, Int, [Tile])> = Heap { $0.1 < $1.1 }
        heap.insert((0, 0, getInitialZero(tiles: tiles)))

        while let (currentCost, currentScore, currentAssignement) = heap.remove() {
            if currentAssignement[0].isSideRoomOf == .A && currentAssignement[1].isSideRoomOf == .A
            && currentAssignement[2].isSideRoomOf == .B && currentAssignement[3].isSideRoomOf == .B
            && currentAssignement[4].isSideRoomOf == .C && currentAssignement[5].isSideRoomOf == .C
            && currentAssignement[6].isSideRoomOf == .D && currentAssignement[7].isSideRoomOf == .D {
                return String(currentCost)
            }

            stepForZero(index: 0, otherIndex: 1, stepCostFactor: 1,    zeroSideRoom: tiles[11], firstSideRoom: tiles[12], heap: &heap, currentAssignement: currentAssignement, currentCost: currentCost, currentScore: currentScore)
            stepForZero(index: 1, otherIndex: 0, stepCostFactor: 1,    zeroSideRoom: tiles[11], firstSideRoom: tiles[12], heap: &heap, currentAssignement: currentAssignement, currentCost: currentCost, currentScore: currentScore)
            stepForZero(index: 2, otherIndex: 3, stepCostFactor: 10,   zeroSideRoom: tiles[13], firstSideRoom: tiles[14], heap: &heap, currentAssignement: currentAssignement, currentCost: currentCost, currentScore: currentScore)
            stepForZero(index: 3, otherIndex: 2, stepCostFactor: 10,   zeroSideRoom: tiles[13], firstSideRoom: tiles[14], heap: &heap, currentAssignement: currentAssignement, currentCost: currentCost, currentScore: currentScore)
            stepForZero(index: 4, otherIndex: 5, stepCostFactor: 100,  zeroSideRoom: tiles[15], firstSideRoom: tiles[16], heap: &heap, currentAssignement: currentAssignement, currentCost: currentCost, currentScore: currentScore)
            stepForZero(index: 5, otherIndex: 4, stepCostFactor: 100,  zeroSideRoom: tiles[15], firstSideRoom: tiles[16], heap: &heap, currentAssignement: currentAssignement, currentCost: currentCost, currentScore: currentScore)
            stepForZero(index: 6, otherIndex: 7, stepCostFactor: 1000, zeroSideRoom: tiles[17], firstSideRoom: tiles[18], heap: &heap, currentAssignement: currentAssignement, currentCost: currentCost, currentScore: currentScore)
            stepForZero(index: 7, otherIndex: 6, stepCostFactor: 1000, zeroSideRoom: tiles[17], firstSideRoom: tiles[18], heap: &heap, currentAssignement: currentAssignement, currentCost: currentCost, currentScore: currentScore)
        }

        return noSolutionFound
    }

    func stepForZero(
        index: Int,
        otherIndex: Int, 
        stepCostFactor: Int, 
        zeroSideRoom: Tile, 
        firstSideRoom: Tile, 
        heap: inout Heap<(Int, Int, [Tile])>,
        currentAssignement: [Tile],
        currentCost: Int,
        currentScore: Int) {
        let currentPosition = currentAssignement[index]
        if currentPosition === firstSideRoom { return }
        if currentPosition === zeroSideRoom && currentAssignement[otherIndex] === firstSideRoom { return }
        let possibleNextPaths = currentPosition
            .paths
            .filter { $0.allSatisfy { pathNode in return !currentAssignement.contains { $0 === pathNode } } } // no blocking
            .filter { 
                if let last = $0.last {
                    return !last.isBeforeSideRoom
                }
                return false
            } // first condition
            .filter {
                if let last = $0.last {
                    if last.isSideRoomOf == nil { return true }
                    if last.isSideRoomOf != zeroSideRoom.isSideRoomOf { return false }
                    if last === zeroSideRoom || last === firstSideRoom { return true }
                    return false
                }
                return false
            } // second condition
            .filter { 
                if let last = $0.last {
                    return !currentPosition.isNormalHallway || last.isSideRoomOf != nil
                }
                return false
            } // third condition
            .filter { 
                if let last = $0.last {
                    return last.isSideRoomOf == nil || (last === firstSideRoom || last === zeroSideRoom && currentAssignement[otherIndex] === firstSideRoom)
                }
                return false
            } // custom condition

        for nextPath in possibleNextPaths {            
            let idealPath = currentPosition.paths.first { $0.last === firstSideRoom } ?? []
            let nextUnidealCount = nextPath.count - nextPath.filter { i in return idealPath.contains { $0 === i } }.count 

            var newAssignment = currentAssignement
            newAssignment[index] = nextPath.last!
            heap.insert((currentCost + nextPath.count * stepCostFactor, currentScore + nextPath.count * stepCostFactor + nextUnidealCount * stepCostFactor * 1000, newAssignment))
        }
    }

    func taskOneLogic() -> String { 
        let tiles: [Tile] = [Tile(i: 0), Tile(i: 1), Tile(i: 2), Tile(i: 3), Tile(i: 4), 
            Tile(i: 5), Tile(i: 6), Tile(i: 7), Tile(i: 8), Tile(i: 9),
            Tile(i: 10), Tile(i: 11), Tile(i: 12), Tile(i: 13), Tile(i: 14),
            Tile(i: 15), Tile(i: 16), Tile(i: 17), Tile(i: 18), Tile(i: 19), 
            Tile(i: 20), Tile(i: 21), Tile(i: 22), Tile(i: 23), Tile(i: 24), 
            Tile(i: 25), Tile(i: 26)]

        for i in 0 ..< 10 {
            tiles[i].right = tiles[i + 1]
            tiles[i + 1].left = tiles[i]
        }

        for i in [0, 1, 3, 5, 7, 9, 10] {
            tiles[i].isNormalHallway = true
        }
        
        tiles[2].isBeforeSideRoom = true
        tiles[2].down = tiles[11]
        tiles[11].isSideRoomOf = .A
        tiles[11].up = tiles[2]
        tiles[11].down = tiles[12]
        tiles[12].isSideRoomOf = .A
        tiles[12].up = tiles[11]
        tiles[12].down = tiles[13]
        tiles[13].isSideRoomOf = .A
        tiles[13].up = tiles[12]
        tiles[13].down = tiles[14]
        tiles[14].isSideRoomOf = .A
        tiles[14].up = tiles[13]
        
        tiles[4].isBeforeSideRoom = true
        tiles[4].down = tiles[15]
        tiles[15].isSideRoomOf = .B
        tiles[15].up = tiles[4]
        tiles[15].down = tiles[16]
        tiles[16].isSideRoomOf = .B
        tiles[16].up = tiles[15]
        tiles[16].down = tiles[17]
        tiles[17].isSideRoomOf = .B
        tiles[17].up = tiles[16]
        tiles[17].down = tiles[18]
        tiles[18].isSideRoomOf = .B
        tiles[18].up = tiles[17]
        
        tiles[6].isBeforeSideRoom = true
        tiles[6].down = tiles[19]
        tiles[19].isSideRoomOf = .C
        tiles[19].up = tiles[6]
        tiles[19].down = tiles[20]
        tiles[20].isSideRoomOf = .C
        tiles[20].up = tiles[19]
        tiles[20].down = tiles[21]
        tiles[21].isSideRoomOf = .C
        tiles[21].up = tiles[20]
        tiles[21].down = tiles[22]
        tiles[22].isSideRoomOf = .C
        tiles[22].up = tiles[21]
        
        tiles[8].isBeforeSideRoom = true
        tiles[8].down = tiles[23]
        tiles[23].isSideRoomOf = .D
        tiles[23].up = tiles[8]
        tiles[23].down = tiles[24]
        tiles[24].isSideRoomOf = .D
        tiles[24].up = tiles[23]
        tiles[24].down = tiles[25]
        tiles[25].isSideRoomOf = .D
        tiles[25].up = tiles[24]
        tiles[25].down = tiles[26]
        tiles[26].isSideRoomOf = .D
        tiles[26].up = tiles[25]

        for tile in tiles {
            tile.calculatePaths()
        }

        var heap: Heap<(Int, Int, [Tile])> = Heap { $0.1 < $1.1 }
        heap.insert((0, 0, getInitialOne(tiles: tiles)))

        while let (currentCost, currentScore, currentAssignement) = heap.remove() {
            if currentAssignement[0].isSideRoomOf  == .A && currentAssignement[1].isSideRoomOf  == .A && currentAssignement[2].isSideRoomOf  == .A && currentAssignement[3].isSideRoomOf  == .A
            && currentAssignement[4].isSideRoomOf  == .B && currentAssignement[5].isSideRoomOf  == .B && currentAssignement[6].isSideRoomOf  == .B && currentAssignement[7].isSideRoomOf  == .B
            && currentAssignement[8].isSideRoomOf  == .C && currentAssignement[9].isSideRoomOf  == .C && currentAssignement[10].isSideRoomOf == .C && currentAssignement[11].isSideRoomOf == .C
            && currentAssignement[12].isSideRoomOf == .D && currentAssignement[13].isSideRoomOf == .D && currentAssignement[14].isSideRoomOf == .D && currentAssignement[15].isSideRoomOf == .D {
                return String(currentCost)
            }

            stepForOne(index: 0,  otherIndices: [1,   2,  3], stepCostFactor:    1, sideRooms: [tiles[11], tiles[12], tiles[13], tiles[14]], heap: &heap, currentAssignement: currentAssignement, currentCost: currentCost, currentScore: currentScore)
            stepForOne(index: 1,  otherIndices: [0,   2,  3], stepCostFactor:    1, sideRooms: [tiles[11], tiles[12], tiles[13], tiles[14]], heap: &heap, currentAssignement: currentAssignement, currentCost: currentCost, currentScore: currentScore)
            stepForOne(index: 2,  otherIndices: [0,   1,  3], stepCostFactor:    1, sideRooms: [tiles[11], tiles[12], tiles[13], tiles[14]], heap: &heap, currentAssignement: currentAssignement, currentCost: currentCost, currentScore: currentScore)
            stepForOne(index: 3,  otherIndices: [0,   1,  2], stepCostFactor:    1, sideRooms: [tiles[11], tiles[12], tiles[13], tiles[14]], heap: &heap, currentAssignement: currentAssignement, currentCost: currentCost, currentScore: currentScore)
            stepForOne(index: 4,  otherIndices: [5,   6,  7], stepCostFactor:   10, sideRooms: [tiles[15], tiles[16], tiles[17], tiles[18]], heap: &heap, currentAssignement: currentAssignement, currentCost: currentCost, currentScore: currentScore)
            stepForOne(index: 5,  otherIndices: [4,   6,  7], stepCostFactor:   10, sideRooms: [tiles[15], tiles[16], tiles[17], tiles[18]], heap: &heap, currentAssignement: currentAssignement, currentCost: currentCost, currentScore: currentScore)
            stepForOne(index: 6,  otherIndices: [4,   5,  7], stepCostFactor:   10, sideRooms: [tiles[15], tiles[16], tiles[17], tiles[18]], heap: &heap, currentAssignement: currentAssignement, currentCost: currentCost, currentScore: currentScore)
            stepForOne(index: 7,  otherIndices: [4,   5,  6], stepCostFactor:   10, sideRooms: [tiles[15], tiles[16], tiles[17], tiles[18]], heap: &heap, currentAssignement: currentAssignement, currentCost: currentCost, currentScore: currentScore)
            stepForOne(index: 8,  otherIndices: [9,  10, 11], stepCostFactor:  100, sideRooms: [tiles[19], tiles[20], tiles[21], tiles[22]], heap: &heap, currentAssignement: currentAssignement, currentCost: currentCost, currentScore: currentScore)
            stepForOne(index: 9,  otherIndices: [8,  10, 11], stepCostFactor:  100, sideRooms: [tiles[19], tiles[20], tiles[21], tiles[22]], heap: &heap, currentAssignement: currentAssignement, currentCost: currentCost, currentScore: currentScore)
            stepForOne(index: 10, otherIndices: [8,   9, 11], stepCostFactor:  100, sideRooms: [tiles[19], tiles[20], tiles[21], tiles[22]], heap: &heap, currentAssignement: currentAssignement, currentCost: currentCost, currentScore: currentScore)
            stepForOne(index: 11, otherIndices: [8,   9, 10], stepCostFactor:  100, sideRooms: [tiles[19], tiles[20], tiles[21], tiles[22]], heap: &heap, currentAssignement: currentAssignement, currentCost: currentCost, currentScore: currentScore)
            stepForOne(index: 12, otherIndices: [13, 14, 15], stepCostFactor: 1000, sideRooms: [tiles[23], tiles[24], tiles[25], tiles[26]], heap: &heap, currentAssignement: currentAssignement, currentCost: currentCost, currentScore: currentScore)
            stepForOne(index: 13, otherIndices: [12, 14, 15], stepCostFactor: 1000, sideRooms: [tiles[23], tiles[24], tiles[25], tiles[26]], heap: &heap, currentAssignement: currentAssignement, currentCost: currentCost, currentScore: currentScore)
            stepForOne(index: 14, otherIndices: [12, 13, 15], stepCostFactor: 1000, sideRooms: [tiles[23], tiles[24], tiles[25], tiles[26]], heap: &heap, currentAssignement: currentAssignement, currentCost: currentCost, currentScore: currentScore)
            stepForOne(index: 15, otherIndices: [12, 13, 14], stepCostFactor: 1000, sideRooms: [tiles[23], tiles[24], tiles[25], tiles[26]], heap: &heap, currentAssignement: currentAssignement, currentCost: currentCost, currentScore: currentScore)
        }

        return noSolutionFound
    }

    func stepForOne(
        index: Int,
        otherIndices: [Int], 
        stepCostFactor: Int, 
        sideRooms: [Tile], 
        heap: inout Heap<(Int, Int, [Tile])>,
        currentAssignement: [Tile],
        currentCost: Int,
        currentScore: Int) {
        let currentPosition = currentAssignement[index]
        if currentPosition === sideRooms[3] { return }
        if currentPosition === sideRooms[2] && otherIndices.map({ currentAssignement[$0] }).contains(where:{ $0 === sideRooms[3] }) { return }
        if currentPosition === sideRooms[1] && otherIndices.map({ currentAssignement[$0] }).contains(where:{ $0 === sideRooms[3] }) && otherIndices.map({ currentAssignement[$0] }).contains(where:{ $0 === sideRooms[2] }) { return }
        if currentPosition === sideRooms[0] && otherIndices.map({ currentAssignement[$0] }).contains(where:{ $0 === sideRooms[3] }) && otherIndices.map({ currentAssignement[$0] }).contains(where:{ $0 === sideRooms[2] }) && otherIndices.map({ currentAssignement[$0] }).contains(where:{ $0 === sideRooms[1] }) { return }
        let possibleNextPaths = currentPosition
            .paths
            .filter { $0.allSatisfy { pathNode in return !currentAssignement.contains { $0 === pathNode } } } // no blocking
            .filter { 
                if let last = $0.last {
                    return !last.isBeforeSideRoom
                }
                return false
            } // first condition
            .filter {
                if let last = $0.last {
                    if last.isSideRoomOf == nil { return true }
                    if last.isSideRoomOf != sideRooms[0].isSideRoomOf { return false }
                    if sideRooms.contains(where:{ $0 === last }) { return true }
                    return false
                }
                return false
            } // second condition
            .filter { 
                if let last = $0.last {
                    return !currentPosition.isNormalHallway || last.isSideRoomOf != nil
                }
                return false
            } // third condition
            .filter { 
                if let last = $0.last {
                    return last.isSideRoomOf == nil 
                    || (last === sideRooms[3] 
                        || last === sideRooms[2] && otherIndices.map { currentAssignement[$0] }.contains(where:{ $0 === sideRooms[3] })
                        || last === sideRooms[1] && otherIndices.map { currentAssignement[$0] }.contains(where:{ $0 === sideRooms[3] }) && otherIndices.map { currentAssignement[$0] }.contains(where:{ $0 === sideRooms[2] })
                        || last === sideRooms[0] && otherIndices.map { currentAssignement[$0] }.contains(where:{ $0 === sideRooms[3] }) && otherIndices.map { currentAssignement[$0] }.contains(where:{ $0 === sideRooms[2] }) && otherIndices.map { currentAssignement[$0] }.contains(where:{ $0 === sideRooms[1] }))
                }
                return false
            } // custom condition

        let finishes = possibleNextPaths.filter { path in return sideRooms.contains { path.last === $0 } }

        for nextPath in (finishes.isEmpty ? possibleNextPaths : finishes) {
            let idealPath = currentPosition.paths.first { $0.last === sideRooms[3] } ?? []
            let nextUnidealCount = nextPath.count - nextPath.filter { i in return idealPath.contains { $0 === i } }.count 

            var newAssignment = currentAssignement
            newAssignment[index] = nextPath.last!
            heap.insert((currentCost + nextPath.count * stepCostFactor, currentScore + nextPath.count * stepCostFactor + nextUnidealCount * stepCostFactor * 100000, newAssignment))
        }
    }
}