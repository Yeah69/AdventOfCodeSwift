public struct Stack<T> {

  fileprivate var list: [T] = []

  public var isEmpty: Bool {
    return list.isEmpty
  }
  
  public mutating func push(_ element: T) {
    list.append(element)
  }

  public mutating func pop() -> T? {
    guard !list.isEmpty, let element = list.last else { return nil }

    list.removeLast()

    return element
  }

  public func peek() -> T? {
    return list.last
  }
}

class Day10 : Day {
    let label = "10"
    let input = inputDay10

    enum SyntaxErrorScore {
        case none
        case corrupt(Int)
        case incomplete(Int)
    }
    
    lazy var lines = { input.split(whereSeparator: \.isNewline).map { String($0) } }()
    lazy var scores: [SyntaxErrorScore] = {
        func calculateScoreFor(line: String) -> SyntaxErrorScore {
            var stack = Stack<String>()
            for c in line {
                if c == "(" || c == "[" || c == "{" || c == "<" {
                    stack.push(String(c))
                }
                else if c == ")" {
                    let temp = stack.pop()
                    if temp != "(" {
                        return .corrupt(3)
                    }
                }
                else if c == "]" {
                    let temp = stack.pop()
                    if temp != "[" {
                        return .corrupt(57)
                    }
                }
                else if c == "}" {
                    let temp = stack.pop()
                    if temp != "{" {
                        return .corrupt(1197)
                    }
                }
                else if c == ">" {
                    let temp = stack.pop()
                    if temp != "<" {
                        return .corrupt(25137)
                    }
                }
            }
            if stack.isEmpty { return .none }
            var score = 0
            while !stack.isEmpty {
                score *= 5
                let temp = stack.pop()
                if temp == "(" { score += 1 }
                else if temp == "[" { score += 2 }
                else if temp == "{" { score += 3 }
                else if temp == "<" { score += 4 }
            }
            return .incomplete(score)
        }
        return lines.map(calculateScoreFor)
    }()

    func taskZeroLogic() -> String { 
        String(scores
            .map { switch $0 {
                case let .corrupt(score): return score
                default: return 0
            }}
            .reduce(0, +))
    }
    func taskOneLogic() -> String { 
        let temp: [Int] = scores
            .map { switch $0 {
                case let .incomplete(score): return score
                default: return 0
            }}
            .filter { $0 > 0 }
            .sorted()
        return String(temp[temp.count / 2])
    }
}