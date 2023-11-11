import Foundation

func solution(_ citations:[Int]) -> Int {
    var result = 0
    
    for h in 0...citations.count {
        let useCount = citations.filter{ $0 >= h }.count
        
        if useCount >= h {
            result = max(h, result)
        }
        
    }
    
    return result
}