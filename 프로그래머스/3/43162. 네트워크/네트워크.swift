import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var visited = Array(repeating: false, count: n) 
    var result = 0
    
    func dfs(_ depth: Int) {
        if depth == n {
            return
        }
        
        visited[depth] = true
        
        for i in 0..<n {
            if computers[depth][i] == 1 && !visited[i] {
                dfs(i)
            }
        }
    }
    
    for i in 0..<n {
        if !visited[i] {
            dfs(i)
            result += 1
        }
    }
    
    return result
}