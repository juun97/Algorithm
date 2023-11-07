let input = readLine()!.split(separator: " ").map{ Int(String($0))! }

let L = input[0]
let C = input[1]
let gathers = Set(["a", "e", "i", "o", "u"].map{ Character($0)})

var alphabets: [String] = readLine()!.split(separator: " ").map{ String($0) }.sorted()
var passwords: Set<String> = []

func btk(depth: Int, password: String) {
    if password.count == L {
        let passwordSet = convertToSet(password: password)
        let gatherCount = passwordSet.intersection(gathers).count
        let consonantCount = passwordSet.subtracting(gathers).count
        
        if gatherCount >= 1 && consonantCount >= 2 {
            passwords.insert(password)
        }

        return
    }
    
    if depth == C {
        return
    }
    
    let newPassword = password + alphabets[depth]
    btk(depth: depth+1, password: newPassword)
    btk(depth: depth+1, password: password)
    
}

func convertToSet(password: String) -> Set<Character> {
    var mySet: Set<Character> = []
    password.forEach { element in
        mySet.insert(element)
    }
    
    return mySet
}

btk(depth: 0, password: "")
passwords.sorted().forEach { password in
    print(password)
}