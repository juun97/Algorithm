struct Location {
    let x: Int
    let y: Int
}

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }

let cityCount = input[0]
let max = input[1]

var chickens: [Location] = []
var houses: [Location] = []

for x in 1...cityCount {
    let cityInput = readLine()!.split(separator: " ").map{ Int(String($0))! }
    
    for y in 1...cityCount {
        let location = Location(x: x, y: y)
        
        switch cityInput[y-1] {
        case 1: houses.append(location)
        case 2: chickens.append(location)
        default: continue
        }
    }
}

var minChickenDistance = Int.max // 가장 작은 치킨 거리 초기값

func getCombinations(_ index: Int, _ selected: [Location]) {
    if selected.count == max { // M개의 치킨집 선택 완료
        var totalDistance = 0
        
        for house in houses {
            var chickenDistance = Int.max
            for location in selected {
                let distance = abs(house.x - location.x) + abs(house.y - location.y)
                chickenDistance = min(chickenDistance, distance)
            }
            totalDistance += chickenDistance
        }
        
        minChickenDistance = min(minChickenDistance, totalDistance)
        return
    }
    
    if index == chickens.count {
        return
    }
    
    var newSelected = selected
    newSelected.append(chickens[index])
    getCombinations(index + 1, newSelected) // 현재 치킨집을 선택하는 경우
    getCombinations(index + 1, selected) // 현재 치킨집을 선택하지 않는 경우
}

getCombinations(0, [Location]())
print(minChickenDistance)
