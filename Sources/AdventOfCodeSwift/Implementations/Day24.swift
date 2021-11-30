class Day24 : Day {
    let label = "24"
    let input = inputDay24

    func taskZeroLogic() -> String { 
        let input = [
            Int64(2), //  0
            Int64(9), //  1
            Int64(9), //  2
            Int64(9), //  3
            Int64(1), //  4
            Int64(9), //  5
            Int64(9), //  6
            Int64(3), //  7
            Int64(6), //  8
            Int64(9), //  9
            Int64(8), // 10
            Int64(4), // 11
            Int64(6), // 12
            Int64(9)] // 13

        return String(input.map { String($0) }.reduce("", +)) 
    }
    func taskOneLogic() -> String { 
        let input = [
            Int64(1), //  0
            Int64(4), //  1
            Int64(6), //  2
            Int64(9), //  3
            Int64(1), //  4
            Int64(2), //  5
            Int64(7), //  6
            Int64(1), //  7
            Int64(1), //  8
            Int64(4), //  9
            Int64(1), // 10
            Int64(1), // 11
            Int64(1), // 12
            Int64(8)] // 13

        return String(input.map { String($0) }.reduce("", +)) 
    }

    func y(z zIn: Int64, w: Int64, divisor: Int64, xAddition: Int64, yAddition: Int64) -> Int64 {
        var z = zIn
        var x = Int64(0)
        x = x + z
        x = x % 26
        z = z / divisor
        x = x + xAddition
        x = x == w ? 1 : 0
        x = x == 0 ? 1 : 0
        var y = Int64(0)
        y = y + 25
        y = y * x
        y = y + 1
        z = z * y
        y = y * 0
        y = y + w
        y = y + yAddition
        y = y * x
        z = z + y
        return z
    }

    func original(input: [Int64]) -> Int64 {
        var w = Int64(0)
        var x = Int64(0)
        var y = Int64(0)
        var z = Int64(0)
        
        w = input[0]
        x = x * 0
        x = x + z
        x = x % 26
        z = z / 1
        x = x + 15
        x = x == w ? 1 : 0
        x = x == 0 ? 1 : 0
        y = y * 0
        y = y + 25
        y = y * x
        y = y + 1
        z = z * y
        y = y * 0
        y = y + w
        y = y + 9
        y = y * x
        z = z + y

        w = input[1]
        x = x * 0
        x = x + z
        x = x % 26
        z = z / 1
        x = x + 11
        x = x == w ? 1 : 0
        x = x == 0 ? 1 : 0
        y = y * 0
        y = y + 25
        y = y * x
        y = y + 1
        z = z * y
        y = y * 0
        y = y + w
        y = y + 1
        y = y * x
        z = z + y

        w = input[2]
        x = x * 0
        x = x + z
        x = x % 26
        z = z / 1
        x = x + 10
        x = x == w ? 1 : 0
        x = x == 0 ? 1 : 0
        y = y * 0
        y = y + 25
        y = y * x
        y = y + 1
        z = z * y
        y = y * 0
        y = y + w
        y = y + 11
        y = y * x
        z = z + y

        w = input[3]
        x = x * 0
        x = x + z
        x = x % 26
        z = z / 1
        x = x + 12
        x = x == w ? 1 : 0
        x = x == 0 ? 1 : 0
        y = y * 0
        y = y + 25
        y = y * x
        y = y + 1
        z = z * y
        y = y * 0
        y = y + w
        y = y + 3
        y = y * x
        z = z + y

        w = input[4]
        x = x * 0
        x = x + z
        x = x % 26
        z = z / 26
        x = x + -11
        x = x == w ? 1 : 0
        x = x == 0 ? 1 : 0
        y = y * 0
        y = y + 25
        y = y * x
        y = y + 1
        z = z * y
        y = y * 0
        y = y + w
        y = y + 10
        y = y * x
        z = z + y

        w = input[5]
        x = x * 0
        x = x + z
        x = x % 26
        z = z / 1
        x = x + 11
        x = x == w ? 1 : 0
        x = x == 0 ? 1 : 0
        y = y * 0
        y = y + 25
        y = y * x
        y = y + 1
        z = z * y
        y = y * 0
        y = y + w
        y = y + 5
        y = y * x
        z = z + y

        w = input[6]
        x = x * 0
        x = x + z
        x = x % 26
        z = z / 1
        x = x + 14
        x = x == w ? 1 : 0
        x = x == 0 ? 1 : 0
        y = y * 0
        y = y + 25
        y = y * x
        y = y + 1
        z = z * y
        y = y * 0
        y = y + w
        y = y + 0
        y = y * x
        z = z + y

        w = input[7]
        x = x * 0
        x = x + z
        x = x % 26
        z = z / 26
        x = x + -6
        x = x == w ? 1 : 0
        x = x == 0 ? 1 : 0
        y = y * 0
        y = y + 25
        y = y * x
        y = y + 1
        z = z * y
        y = y * 0
        y = y + w
        y = y + 7
        y = y * x
        z = z + y

        w = input[8]
        x = x * 0
        x = x + z
        x = x % 26
        z = z / 1
        x = x + 10
        x = x == w ? 1 : 0
        x = x == 0 ? 1 : 0
        y = y * 0
        y = y + 25
        y = y * x
        y = y + 1
        z = z * y
        y = y * 0
        y = y + w
        y = y + 9
        y = y * x
        z = z + y
        
        w = input[9]
        x = x * 0
        x = x + z
        x = x % 26
        z = z / 26
        x = x + -6
        x = x == w ? 1 : 0
        x = x == 0 ? 1 : 0
        y = y * 0
        y = y + 25
        y = y * x
        y = y + 1
        z = z * y
        y = y * 0
        y = y + w
        y = y + 15
        y = y * x
        z = z + y

        w = input[10]
        x = x * 0
        x = x + z
        x = x % 26
        z = z / 26
        x = x + -6
        x = x == w ? 1 : 0
        x = x == 0 ? 1 : 0
        y = y * 0
        y = y + 25
        y = y * x
        y = y + 1
        z = z * y
        y = y * 0
        y = y + w
        y = y + 4
        y = y * x
        z = z + y

        w = input[11]
        x = x * 0
        x = x + z
        x = x % 26
        z = z / 26
        x = x + -16
        x = x == w ? 1 : 0
        x = x == 0 ? 1 : 0
        y = y * 0
        y = y + 25
        y = y * x
        y = y + 1
        z = z * y
        y = y * 0
        y = y + w
        y = y + 10
        y = y * x
        z = z + y

        w = input[12]
        x = x * 0
        x = x + z
        x = x % 26
        z = z / 26
        x = x + -4
        x = x == w ? 1 : 0
        x = x == 0 ? 1 : 0
        y = y * 0
        y = y + 25
        y = y * x
        y = y + 1
        z = z * y
        y = y * 0
        y = y + w
        y = y + 4
        y = y * x
        z = z + y

        w = input[13]
        x = x * 0
        x = x + z
        x = x % 26
        z = z / 26
        x = x + -2
        x = x == w ? 1 : 0
        x = x == 0 ? 1 : 0
        y = y * 0
        y = y + 25
        y = y * x
        y = y + 1
        z = z * y
        y = y * 0
        y = y + w
        y = y + 9
        y = y * x
        z = z + y

        return z
    }
}