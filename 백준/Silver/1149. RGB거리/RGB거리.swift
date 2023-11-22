let input = Int(readLine()!)!
var colors : [[Int]] = [[]]
var dp = Array(repeating: Array(repeating: 0, count: 3), count: input+1)

for _ in 0..<input {
    let RGB = readLine()!.split(separator: " ").map{ Int(String($0))! }
    colors.append(RGB)
}


for i in 1...input {
    for j in 0...2 {
        let first = (j+1) % 3
        let second = (j+2) % 3
        
        dp[i][j] = min(dp[i-1][first], dp[i-1][second]) + colors[i][j]
    }
}

print(min(dp[input][0],dp[input][1],dp[input][2]))