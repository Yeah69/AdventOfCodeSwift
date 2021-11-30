protocol ISnailFishNumber {
    func magnitude() -> Int
    func flatten(depth: Int) -> [(SnailFishValue, Int)]
    func getParent() -> SnailFishPair?
    func setParent(_ value: SnailFishPair)
}

class SnailFishPair : ISnailFishNumber {
    var parent: SnailFishPair?
    var left: ISnailFishNumber
    var right: ISnailFishNumber

    init(left: ISnailFishNumber, right: ISnailFishNumber) {
        self.left = left
        self.right = right
    }

    func magnitude() -> Int { 3 * left.magnitude() + 2 * right.magnitude() }
    func flatten(depth: Int) -> [(SnailFishValue, Int)] { left.flatten(depth: depth + 1) + right.flatten(depth: depth + 1) }
    func getParent() -> SnailFishPair? { parent }
    func setParent(_ value: SnailFishPair) { parent = value }
}

class SnailFishValue : ISnailFishNumber {
    var parent: SnailFishPair?
    var value: Int

    init(value: Int) {
        self.value = value
    }

    func magnitude() -> Int { value }
    func flatten(depth: Int) -> [(SnailFishValue, Int)] { [(self, depth)] }
    func getParent() -> SnailFishPair? { parent }
    func setParent(_ value: SnailFishPair) { parent = value }
}

class Day18 : Day {
    let label = "18"
    let input = inputDay18

    func getInitialNumbers() -> [ISnailFishNumber] {
        func getNumberFrom(line: String) -> ISnailFishNumber {
            var index = line.index(line.startIndex, offsetBy: 0)
            if line[index] == "[" {
                func run(until: Character) -> String {
                    let start = pointer
                    index = line.index(line.startIndex, offsetBy: pointer)
                    while bracketCount != 0 || line[index] != until {
                        if line[index] == "[" {
                            bracketCount += 1
                        }
                        else if line[index] == "]" {
                            bracketCount -= 1
                        }
                        pointer += 1
                        index = line.index(line.startIndex, offsetBy: pointer)
                    }
                    let startIndex = line.index(line.startIndex, offsetBy: start)
                    let endIndex = line.index(line.startIndex, offsetBy: pointer)
                    return String(line[startIndex ..< endIndex])
                }
                var pointer = 1
                var bracketCount = 0
                let leftText = run(until: ",")
                pointer += 1
                let rightText = run(until: "]")
                let left = getNumberFrom(line: leftText)
                let right = getNumberFrom(line: rightText)
                let ret = SnailFishPair(left: left, right: right)
    	    	left.setParent(ret)
                right.setParent(ret)
                return ret
            }
            return SnailFishValue(value: Int(line) ?? 0)
        }

        return input.split(whereSeparator: \.isNewline)
            .map { String($0) }
            .map(getNumberFrom)
    }

    func add(left: ISnailFishNumber, right: ISnailFishNumber) -> ISnailFishNumber {
        var result = left
        let temp = SnailFishPair(left: result, right: right)
        result.setParent(temp)
        right.setParent(temp)
        result = temp
        var workDone = false
        repeat {
            workDone = false
            let flat = result.flatten(depth: 0)
            for i in 0 ..< flat.count {
                let (value, depth) = flat[i]
                if depth >= 5 {
                    if i > 0 {
                        flat[i - 1].0.value += value.value
                    }
                    if i + 2 < flat.count {
                        flat[i + 2].0.value += flat[i + 1].0.value
                    }
                    if let ourParent = value.getParent() {
                        if let parentParent = ourParent.getParent() {
                            let emptyValue = SnailFishValue(value: 0)
                            if parentParent.left is SnailFishPair && parentParent.left as! SnailFishPair === ourParent {
                                parentParent.left = emptyValue
                                emptyValue.setParent(parentParent)
                            }
                            else if parentParent.right is SnailFishPair && parentParent.right as! SnailFishPair === ourParent {
                                parentParent.right = emptyValue
                                emptyValue.setParent(parentParent)
                            }
                        }
                    }
                    workDone = true
                    break
                }
            }
            if !workDone {
                let flat = result.flatten(depth: 0)
                for i in 0 ..< flat.count {
                    let (value, _) = flat[i]
                    if value.value >= 10 {
                        let newLeft = value.value / 2 
                        let newRight = newLeft + (value.value % 2)
                        let left = SnailFishValue(value: newLeft)
                        let right = SnailFishValue(value: newRight)
                        let newPair = SnailFishPair(left: left, right: right)
                        left.setParent(newPair)
                        right.setParent(newPair)
                        if let myParent = value.getParent() {
                            if myParent.left is SnailFishValue && myParent.left as! SnailFishValue === value {
                                newPair.setParent(myParent)
                                myParent.left = newPair
                            }
                            else if myParent.right is SnailFishValue && myParent.right as! SnailFishValue === value {
                                newPair.setParent(myParent)
                                myParent.right = newPair
                            }
                        }
                        workDone = true
                        break
                    }
                }
            }
        } while workDone
        return result
    }

    func taskZeroLogic() -> String {
        let arr = getInitialNumbers()
        var result = arr[0]

        for number in arr.suffix(arr.count - 1) {
            result = add(left: result, right: number)
        }

        return String(result.magnitude()) 
    }
    func taskOneLogic() -> String  {
        let arr = getInitialNumbers()

        let indices: [(Int, Int)] = stride(from: 0, to: arr.count, by: 1)
            .flatMap { i in return stride(from: 0, to: arr.count, by: 1).filter { $0 != i }.map { (i, $0) } }

        var max = 0

        for index in indices {
            let temp = getInitialNumbers()
            let tempMag = add(left: temp[index.0], right: temp[index.1]).magnitude()
            if tempMag > max {
                max = tempMag
            }
        }

        return String(max) 
    }
}