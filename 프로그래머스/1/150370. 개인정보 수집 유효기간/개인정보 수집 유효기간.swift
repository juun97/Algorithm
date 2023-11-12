import Foundation

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    var result: [Int] = []
    var finish: [Int] = Array(repeating: 0, count: 3)
    
    let todays = today.split(separator: ".").map{ Int(String($0))! }
    var termDic: [String: Int] = [:]
    
    terms.forEach { term in
        let termArray = term.split(separator: " ").map{ String($0) }
        termDic[termArray[0]] = Int(termArray[1])!
    }
    
    for (i, p) in privacies.enumerated() {
        let privacy = p.split(separator: " ").map { String($0) }
        var date = privacy[0].split(separator: ".").map{ Int(String($0))! }
        let term = privacy[1]
        
        let period = termDic[String(term)]!
        
        let year = period / 12
        let month = period % 12
        
        
        if date[1] + month > 12 {
            finish[0] = date[0] + year + 1
            finish[1] = (date[1] + month) - 12
        } else {
            finish[0] = date[0] + year
            finish[1] = date[1] + month
        }
        
        if date[2] == 1 {
            if date[1] == 1 {
                finish[0] -= 1
                finish[1] = 12
                finish[2] = 28
            } else {
                finish[1] -= 1
                finish[2] = 28
            }

        } else {
            finish[2] = date[2]-1
        }
      
        for idx in 0...2 {
            if todays[idx] > finish[idx] {
                result.append(i+1)
                break
            } else if todays[idx] < finish[idx] {
                break
            }
        }
    }
    return result
}