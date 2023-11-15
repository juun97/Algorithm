import Foundation

var result = 0

func solution(_ numbers:[Int], _ target:Int) -> Int {
    
    dfs(0, numbers, target, 0)
    
    return result
}


func dfs(_ depth: Int, _ numbers:[Int], _ target:Int, _ now: Int) {
    if depth == numbers.count {
        if now == target {
            result += 1
        }
        
        return
    }
    
    let num = numbers[depth]
    
    dfs(depth+1, numbers, target, now+num)
    dfs(depth+1, numbers, target, now-num)
}