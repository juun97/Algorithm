let input = readLine()!.split(separator: " ").map{ Int(String($0))! }

let plug = input[0]
let useCount = input[1]

var order: [Int] = readLine()!.split(separator: " ").map{ Int(String($0))! }
var using: Set<Int> = []

var count = 0



while order.count > 0 {
    let machine = order.first!
    
    if using.contains(machine) {
        order.removeFirst()
        continue
    }
    
    if using.count < plug {
        using.insert(order.removeFirst())
        continue
    }
    
    var dict: [Int:Int?] = [:]
    
    for machine in using {
        let index = order.firstIndex(of: machine)
        dict[machine] = index
    }
    
    if dict.contains(where: { $0.value == nil }) {
        for element in dict {
            if element.value == nil {
                using.remove(element.key)
                using.insert(order.removeFirst())
                count += 1
                break
            }
        }
    } else {
        let max = dict.max(by: { $0.value! < $1.value! })
        
        using.remove(max!.key)
        using.insert(order.removeFirst())
        count += 1
    }
    
}

print(count)
