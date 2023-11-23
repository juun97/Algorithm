let N = Int(String(readLine()!))!
var people: [(w: Int, h: Int)] = []
var result: [String] = []

for _ in 1...N {
    let info = readLine()!.split(separator: " ").map{ Int(String($0))! }
    people.append((info[0], info[1]))
}

for person1 in people {
    var rank = 1
    
    for person2 in people {
        if person1.w < person2.w && person1.h < person2.h {
            rank += 1
        }
    }
    
    result.append(String(rank))
}

print(result.joined(separator: " "))
