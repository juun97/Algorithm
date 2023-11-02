let input = readLine()!.split(separator: " ").map{ Int(String($0))!}
let result = input.reduce(0) { $0 + $1 }

print(result)