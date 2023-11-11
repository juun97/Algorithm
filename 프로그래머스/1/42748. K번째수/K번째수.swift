import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var result: [Int] = []
    
    for c in commands {
        let i = c[0]-1
        let j = c[1]-1
        let k = c[2]-1
        
        let r = array[i...j].sorted()
        result.append(r[k])
        
    }
    
    return result
}