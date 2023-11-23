let n = Int(readLine()!)!

let numbers = readLine()!.split(separator: " ").map{ Int(String($0))! }
var dp = Array(repeating: -1001, count: n)

dp[0] = numbers[0]

for i in 1..<n {
    dp[i] = max(dp[i-1]+numbers[i], numbers[i])
    
}

print(dp.max()!)