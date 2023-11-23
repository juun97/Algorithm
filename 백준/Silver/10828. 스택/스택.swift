let count = Int(String(readLine()!))!
var stack: [String] = []


for _ in 1...count {
    let command = readLine()!.split(separator: " ").map{ String($0)}
    
    switch command[0] {
    case "top":
        print(stack.last ?? -1)
    case "pop":
        if !stack.isEmpty { print(stack.removeLast())}
        else { print("-1") }
    case "size":
        print(stack.count)
    case "empty":
        print(stack.isEmpty ? 1 : 0)
    default:
        stack.append(command[1])
    }
}