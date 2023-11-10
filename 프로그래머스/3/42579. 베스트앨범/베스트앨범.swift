import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    
    var genreIndex: [String: [Int]] = [:]
    
    for (i, g) in genres.enumerated() {
        if genreIndex[g] == nil {
            genreIndex[g] = [i]
        } else {
            genreIndex[g]!.append(i)
        }
    }
    
    var genresSum = [(String, Int)]()
    
    for genre in Set(genres) {
        var sum = 0
        genreIndex[genre]!.forEach { i in
            sum += plays[i]
        }
        genresSum.append((genre, sum))
    }
    
    var order = genresSum.sorted{ $0.1 > $1.1 }.map{ $0.0 }
    var result: [Int] = []
    
    for genre in order {
        var indexs = genreIndex[genre]!.sorted { plays[$0] > plays[$1] }
        
        if indexs.count > 2 {
            result.append(indexs[0])
            result.append(indexs[1])
        } else {
            indexs.forEach { index in
                result.append(index)
            }
        }
    }
    
    return result
}

