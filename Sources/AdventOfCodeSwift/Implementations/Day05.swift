class Day05 : Day {
    let label = "05"
    let input = inputDay05

    class HydrothermalVent {
        let start : (Int, Int)
        let end : (Int, Int)

        lazy var lineZero : [(Int, Int)] = {
            if start.0 == end.0 {
                let by = start.1 < end.1 ? 1 : -1
                return stride(from: start.1, through: end.1, by: by).map { (start.0, $0) }
            }
            else if start.1 == end.1 {
                let by = start.0 < end.0 ? 1 : -1
                return stride(from: start.0, through: end.0, by: by).map { ($0, start.1) }
            }
            else {
                return []
            }
        }()

        lazy var lineOne : [(Int, Int)] = {
            let stepX = start.0 < end.0 ? 1 : start.0 > end.0 ? -1 : 0
            let stepY = start.1 < end.1 ? 1 : start.1 > end.1 ? -1 : 0
            let finish = (end.0 + stepX, end.1 + stepY)
    	    var points: [(Int, Int)] = []
            var i = start
            repeat {
                points.append(i)
                i = (i.0 + stepX, i.1 + stepY)
            } while i.0 != finish.0 || i.1 != finish.1
            return points
        }()

        init(start: (Int, Int), end: (Int, Int)) {
            self.start = start
            self.end = end
        }
    }

    lazy var hydrothermalVents: [HydrothermalVent] = {
        input.split(whereSeparator: \.isNewline).compactMap {
            let coordsAsText = String($0).components(separatedBy: " -> ")
            let startAsText = coordsAsText[0].components(separatedBy: ",")
            let endAsText = coordsAsText[1].components(separatedBy: ",")
            if let startX = Int(startAsText[0]), let startY = Int(startAsText[1]), let endX = Int(endAsText[0]), let endY = Int(endAsText[1]) {
                return HydrothermalVent(start: (startX, startY), end: (endX, endY))
            }
            return nil
        }
    }()

    func day05InnerLogic(_ getLine: (HydrothermalVent) -> [(Int, Int)]) -> String {
        let dictionary = Dictionary(grouping: hydrothermalVents.flatMap(getLine), by: { "\($0.0),\($0.1)" })
        return String(dictionary.values.filter { $0.count > 1 }.count)
    }

    func taskZeroLogic() -> String { day05InnerLogic { $0.lineZero } }
    func taskOneLogic() -> String { day05InnerLogic { $0.lineOne } }
}