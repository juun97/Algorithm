let n = Int(readLine()!)!
var nums: [[Int]] = []

for _ in 1...n {
    nums.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var cache = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
cache[0][0] = nums[0][0]

for i in 1..<n {
    for j in 0...i {
        if j == 0 {
            cache[i][j] = cache[i - 1][j] + nums[i][j]
            continue
        }
        if j == i {
            cache[i][j] = cache[i - 1][j - 1] + nums[i][j]
            continue
        }
        
        cache[i][j] = max(cache[i - 1][j - 1], cache[i - 1][j]) + nums[i][j]
    }
}

print(cache[n - 1].max()!)