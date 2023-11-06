var numbers: Set<Int> = Set(1...10000)
var combinationNumbers: Set<Int> = []

func solution(x: Int) {
    
    if x > 10000 {
        return
    }

    let result = calculate(number: x)
    combinationNumbers.insert(result)
    
    solution(x: x+1)
}


func calculate(number: Int) -> Int {
    if number < 10 {
        return 2 * number
    }
    
    var myNumbers: [Int] = []
    
    String(number).forEach { element in
        myNumbers.append(Int(String(element))!)
    }
    
    let sum = myNumbers.reduce(0){ $0 + $1 } + number
    
    return sum
}


solution(x: 1)
let result = Array(numbers.subtracting(combinationNumbers)).sorted()

result.forEach { selfNumber in
    print(selfNumber)
}