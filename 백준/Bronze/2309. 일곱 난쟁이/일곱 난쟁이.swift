var heights: [Int] = []
var a = 0
var b = 0

for _ in 1...9 {
    heights.append(Int(readLine()!)!)
}


let heightSum = heights.reduce(0, +)

outerRoop: for i in 0...7 {
    for j in (i + 1)...8 {
        a = heights[i]
        b = heights[j]
        if heightSum - a - b == 100 {
            break outerRoop
        }
    }
}

heights.remove(at: heights.firstIndex(of: a)!)
heights.remove(at: heights.firstIndex(of: b)!)
heights.sort()
heights.forEach{ print($0) }