let input = Int(readLine()!)!
var score = [0]
var dp = Array(repeating: 0, count: input+1)


for _ in 0..<input {
    let n = Int(readLine()!)!
    score.append(n)
}



for i in 1...input {
    if i == 1 {
        dp[1] = score[1]
    } else if i == 2 {
        dp[2] = score[1] + score[2]
    } else if i == 3 {
        dp[3] = max(score[2]+score[3], score[1]+score[3])
    } else {
        dp[i] = max((score[i] + score[i-1] + dp[i-3] ), (dp[i-2] + score[i]))
    }
}

print(dp[input])