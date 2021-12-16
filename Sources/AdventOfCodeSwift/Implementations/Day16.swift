extension String {
    func leftPadding(toLength: Int, withPad character: Character) -> String {
        let newLength = self.count
        if newLength < toLength {
            return String(repeatElement(character, count: toLength - newLength)) + self
        } else {
            let from = self.index(self.startIndex, offsetBy: newLength - toLength)
            return String(self[from...])
        }
    }
}

protocol Packet {
    var version: Int { get }
    var type: Int { get }

    func sumOfVersions() -> Int
    func result() -> Int
}

class Day16 : Day {
    let label = "16"
    let input = inputDay16

    lazy var binaryText: String = { input
        .map { String(Int(String($0), radix: 16) ?? 0, radix: 2) }
        .map { $0.leftPadding(toLength: 4, withPad: "0") }
        .reduce("", +)
    }()

    class Literate : Packet {
        let version: Int
        let type: Int = 4
        let value: Int
        
        init(version: Int, value: Int) {
            self.version = version
            self.value = value
        }

        func sumOfVersions() -> Int { version }

        func result() -> Int { value }
    }

    class Operator : Packet {
        let version: Int
        let type: Int
        let children: [Packet]
        
        init(version: Int, type: Int, children: [Packet]) {
            self.version = version
            self.type = type
            self.children = children
        }

        func sumOfVersions() -> Int { children.reduce(0) { $0 + $1.sumOfVersions() } + version }

        func result() -> Int { 
            switch type {
                case 0: return children.map { $0.result() }.reduce(0, +)
                case 1: return children.map { $0.result() }.reduce(1, *)
                case 2: return children.map { $0.result() }.min() ?? 0
                case 3: return children.map { $0.result() }.max() ?? 0
                case 5: return children[0].result() > children[1].result() ? 1 : 0
                case 6: return children[0].result() < children[1].result() ? 1 : 0
                case 7: return children[0].result() == children[1].result() ? 1 : 0
                default: return 0
            }
        }
    }

    lazy var outermostPacket: Packet = { 
        func parse(binaryPacket: String) -> (Packet, Int) {
            var pointer = 0
            var start = binaryPacket.index(binaryPacket.startIndex, offsetBy: pointer)
            var end = binaryPacket.index(binaryPacket.startIndex, offsetBy: pointer + 3)
            let version = Int(String(binaryPacket[start ..< end]), radix: 2) ?? 0
            pointer += 3 

            start = binaryPacket.index(binaryPacket.startIndex, offsetBy: pointer)
            end = binaryPacket.index(binaryPacket.startIndex, offsetBy: pointer + 3)
            let type = Int(String(binaryPacket[start ..< end]), radix: 2) ?? 0
            pointer += 3 

            if type == 4 {
                var valueText = ""
                var wasLast = false
                while !wasLast {
                    start = binaryPacket.index(binaryPacket.startIndex, offsetBy: pointer)
                    let intermediate = binaryPacket.index(binaryPacket.startIndex, offsetBy: pointer + 1)
                    end = binaryPacket.index(binaryPacket.startIndex, offsetBy: pointer + 5)
                    wasLast = String(binaryPacket[start ..< intermediate]) == "0"
                    valueText += String(binaryPacket[intermediate ..< end])
                    pointer += 5 
                }
                return (Literate(version: version, value: Int(valueText, radix: 2) ?? 0), pointer)
            }
            else {
                start = binaryPacket.index(binaryPacket.startIndex, offsetBy: pointer)
                end = binaryPacket.index(binaryPacket.startIndex, offsetBy: pointer + 1)
                let indicator = String(binaryPacket[start ..< end])
                pointer += 1
                if (indicator == "1") {
                    start = binaryPacket.index(binaryPacket.startIndex, offsetBy: pointer)
                    end = binaryPacket.index(binaryPacket.startIndex, offsetBy: pointer + 11)
                    let length = Int(String(binaryPacket[start ..< end]), radix: 2) ?? 0
                    pointer += 11

                    var children: [Packet] = []
                    for _ in 0 ..< length {
                        start = binaryPacket.index(binaryPacket.startIndex, offsetBy: pointer)
                        let (currChild, tempPointer) = parse(binaryPacket: String(binaryPacket[start...]))
                        children.append(currChild)
                        pointer += tempPointer
                    }
                    return (Operator(version: version, type: type, children: children), pointer)
                }
                else {
                    start = binaryPacket.index(binaryPacket.startIndex, offsetBy: pointer)
                    end = binaryPacket.index(binaryPacket.startIndex, offsetBy: pointer + 15)
                    let length = Int(String(binaryPacket[start ..< end]), radix: 2) ?? 0
                    pointer += 15

                    var currLength = length
                    var currPointer = pointer
                    var children: [Packet] = []
                    pointer += length
                    while currLength > 0 {
                        start = binaryPacket.index(binaryPacket.startIndex, offsetBy: currPointer)
                        end = binaryPacket.index(binaryPacket.startIndex, offsetBy: pointer)
                        let (currChild, tempPointer) = parse(binaryPacket: String(binaryPacket[start ..< end]))
                        children.append(currChild)
                        currLength -= tempPointer
                        currPointer += tempPointer
                    }
                    return (Operator(version: version, type: type, children: children), pointer)
                }
            }      
        }
        let (rootPacket, _) = parse(binaryPacket: binaryText)
        return rootPacket
    }()

    func taskZeroLogic() -> String { return String(outermostPacket.sumOfVersions()) }
    func taskOneLogic() -> String { return String(outermostPacket.result()) }
}