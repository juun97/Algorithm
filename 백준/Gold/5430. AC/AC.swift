let n = Int(readLine()!)!

for _ in 0..<n {
    let str = readLine()!
    let num = Int(readLine()!)!
    var array = readLine()!.dropFirst().dropLast().split(separator: ",").map{String($0)}
    var head = 0
    var check = false
    var tail = array.count
    
    for i in str {
        if i == "R" {
            if check {
                check = false
            } else {
                check = true
            }
        }
        if i == "D" {
            if check {
                tail -= 1
            }
            else {
                head += 1
            }
        }
        if head > tail {
            break
        }
    }
    if head > tail {
        print("error")
    }
    else {
        if check {
            print("[\(array[head..<tail].reversed().joined(separator: ","))]")
        } else {
            print("[\(array[head..<tail].joined(separator: ","))]")
        }
    }
}
