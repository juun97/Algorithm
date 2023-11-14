var dp = Array(repeating: Array(repeating: 0, count: 15), count: 15)

let T = Int(readLine()!)!

for k in 0...14 {
    for n in 1...14 {
        if k == 0 {
            dp[k][n] = n
        } else {
            dp[k][n] = dp[k-1][1...n].reduce(0, +)
            
        }
    }
}


for _ in 1...T {
    let k = Int(readLine()!)!
    let n = Int(readLine()!)!
    
    print(dp[k][n])
}