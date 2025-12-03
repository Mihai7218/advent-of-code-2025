import Foundation

func int_of_array (input : [Int]) -> Int {
    var x = 0
    for i in input {
        x = x * 10 + i
    }
    return x
}

func f (input : [String], count : Int) -> Int {
    var total = 0
    for line in input {
        var digits = Array(repeating: -1, count: count)
        var maxV = -1
        for (idx, digit) in Array(line).enumerated() {
            let val = digit.wholeNumberValue!
            for i in max(0, (count - (line.count - idx))) ..< count {
                if (digits[i] < val) {
                    digits[i] = val
                    for j in (i + 1) ..< count {
                        digits[j] = -1
                    }
                    break
                }
            }
            if (digits[count-1] != -1) {
                if (maxV < int_of_array(input : digits)) {
                    maxV = int_of_array(input : digits)
                }
            }
        }
        total += maxV
    }
    return total

}

func part1(input : [String]) -> Int {
    f(input: input, count: 2)
}

func part2(input : [String]) -> Int {
    f(input: input, count: 12)
}

if let rawInput = try? String(contentsOf: URL(fileURLWithPath: "day3/input")) {
    let input = rawInput.components(separatedBy: "\n")
    print(part1(input: input))
    print(part2(input: input))
}
