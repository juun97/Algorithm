import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var dic: [String: [String]] = [:]
    var keys: [String] = []
    for i in 0..<clothes.count {
        let name = clothes[i][0]
        let type = clothes[i][1]
        
        if dic[type] == nil {
            keys.append(type)
            dic[type] = [name]
        } else {
            dic[type]!.append(name)
        }
    }
    
    if keys.count == 1 {
        return dic[keys.first!]!.count
    } else {
        var numbers: [Int] = []
        
        keys.forEach { key in
            numbers.append(dic[key]!.count+1)
        }
        
       return numbers.reduce(1){ $0 * $1 }-1
    }

}