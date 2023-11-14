import Foundation

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (maxBag, maxWeight) = (input[0], input[1])


var dp = Array(repeating: Array(repeating: 0, count: input[1]+1), count: input[0]+1)

var bags = Array(repeating:(weight:0, cost:0), count: input[0]+1)

for i in 1...input[0] {
    let bag = readLine()!.split(separator: " ").map{ Int(String($0))! }
    bags[i] = (bag[0], bag[1])
}


for i in 1...maxBag {
    for j in 1...maxWeight {
        
        // 첫 번째 물건 일 때
        if i == 1 {
            // 현재 고려하는 무게가 현재 무게 보다 크면 그냥 그 무게가 최대값
            if j >= bags[i].weight {
                dp[i][j] = bags[i].cost
                
            }
            // 두 번째 물건 부터
        } else {
            if j < bags[i].weight {
                dp[i][j] = dp[i-1][j]
                // 현재 고려하는 무게가 현재 무게 보다 크면
                // max(현재 물건 가치 + (지금 고려하는 무게 - 현재 물건 무게)에서의 가치, 현재 까지 지금 무게에서의 최대값)
            } else {
                dp[i][j] = max(dp[i-1][j], bags[i].cost + dp[i-1][j-bags[i].weight])
            }
        }
    }
}


print(dp[maxBag][maxWeight])