let input = Int(readLine()!)!
var count = 0

for i in 1...input {
    if i < 100 {
        count += 1
        continue
    }
    
    let components = Array(String(i)).map{ Int(String($0))! }
    if components[2]-components[1] == components[1]-components[0] {
        count += 1
    }
}


print(count)