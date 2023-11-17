import Foundation

func solution(_ targets:[[Int]]) -> Int {
    let targets = targets.sorted { $0[1] < $1[1] }
    var count = 0
    var end = targets[0][1]
    
    for target in targets {
        if target[0] >= end {
            end = target[1]
            count += 1
        }
    }
    
    return count + 1
}