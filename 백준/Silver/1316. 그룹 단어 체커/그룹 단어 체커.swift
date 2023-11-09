let n = Int(readLine()!)!
var result = 0

func solution() {
    let words: [Character] = Array(readLine()!)
    var wordSet: Set<Character> = []
    var isResult = true
    
    for i in 0..<words.count {
        if i == 0 {
            wordSet.insert(words[i])
            continue
        }
        
        if !wordSet.contains(words[i]) {
            wordSet.insert(words[i])
            continue
        } else {
            if words[i-1] == words[i] {
                continue
            } else {
                isResult = false
            }
        }
    }
    
    if isResult {
        result += 1
    }
}

for _ in 0..<n { solution() }

print(result)
