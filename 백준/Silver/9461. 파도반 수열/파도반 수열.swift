let n = Int(readLine()!)!
var testCase: [Int] = []
var dp = Array(repeating: 0, count: 100)

for _ in 1...n {
    testCase.append(Int(readLine()!)!)
}

for i in 0..<100 {
    if [0,1,2].contains(i) {
        dp[i] = 1
    } else if [3,4].contains(i) {
        dp[i] = 2
    } else {
        dp[i] = dp[i-1] + dp[i-5]
    }
}

testCase.forEach { num in
    print(dp[num-1])
}