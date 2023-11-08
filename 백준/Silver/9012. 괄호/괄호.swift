let input = Int(readLine()!)!

var PS: [[Character]] = Array(repeating: [Character](), count: input)
var result: [String] = Array(repeating: "NO", count: input)

for i in 0..<input {
    let ps: [Character] = Array(readLine()!)
    PS[i] = ps
}

for i in 0..<input {
    var stack = [Character]()
    
    for character in PS[i] {
        if character == "(" {
            stack.append(character)
        } else {
            if stack.popLast() == nil {
                stack.append(character)
                break
            }
        }
        
        
    }
    
    if stack.isEmpty {
        result[i] = "YES"
    }
 
}

result.forEach { string in
    print(string)
}
