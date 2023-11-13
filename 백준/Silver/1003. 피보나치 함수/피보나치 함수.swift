let n = Int(readLine()!)!

var zero = 0
var one = 0
var dp = Array(repeating: Array(repeating: 0, count: 2), count: 41)

dp[0][0] = 1
dp[1][1] = 1

for i in 2...40 {
    dp[i][0] = dp[i-2][0] + dp[i-1][0]
    dp[i][1] = dp[i-2][1] + dp[i-1][1]
}



for _ in 1...n {
    let num = Int(readLine()!)!
    
    print("\(dp[num][0]) \(dp[num][1])")

}
