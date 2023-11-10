import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var result: [Int] = []
    var nowProgresses = progresses
    var now = 0
    
    while progresses.count > now {
        for i in now..<nowProgresses.count {
            if nowProgresses[i] == 100 { continue }
            
            if nowProgresses[i] + speeds[i] >= 100 {
                nowProgresses[i] = 100
                continue
            }
            
            nowProgresses[i] += speeds[i]
            
        }
        
        var count = 0
        
        while nowProgresses[now] == 100 {
            count += 1
            
            if now+1 == progresses.count {
                now += 1
                break
            }
            
            now += 1
        }
        
        if count != 0 {
            result.append(count)
        }
    }
    
    return result
}
