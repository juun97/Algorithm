import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    if !words.contains(target) {
        return 0
    }
    
    var visited = Array(repeating: false, count: words.count)
    var result = Int.max
    
    func commonWord(_ first: String, _ second: String, _ num: Int) -> Bool {
        let a = Array(first)
        let b = Array(second)
        var count = 0
        
        
        for i in 0..<a.count {
            if a[i] == b[i] {
                count += 1
            }
        }
        
        return count == num ? true : false
    }
    
    func dfs(_ depth: Int, _ now: String) {
        if depth == words.count {
            if now == target {
                result = min(result, depth)
                return
            } else {
                result = 0
            }
        }
        
        if now == target {
            result = min(result, depth)
            return
        }
        
        if depth != 0 {
            let index = words.firstIndex(of: now)!
            visited[index] = true
        }

        for i in 0..<words.count {
            if commonWord(now, words[i], now.count-1) && !visited[i] {
                dfs(depth+1, words[i])
            }
        }
        
    }
    
    dfs(0, begin)
    
    return result
}



