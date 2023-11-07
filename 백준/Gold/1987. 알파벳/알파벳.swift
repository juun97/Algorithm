let input = readLine()!.split(separator: " ").map{ Int($0)! }

let row = input[0]
let col = input[1]
let directions = [(1, 0), (0, 1), (-1, 0), (0, -1)]
var board: [[Int]] = []

for _ in 0..<row {
    let array = Array(readLine()!).map{ Int($0.asciiValue!) - 65 }
    board.append(array)
}

var result = 0

func dfs(r: Int, c: Int, count: Int, path: Int) {
   result = max(result, count)

    for (dr, dc) in directions {

        
        let nextR = r + dr
        let nextC = c + dc
        
        if nextR < 0 || nextC < 0 || nextR >= row || nextC >= col {
            continue
        }
        
        let n = 1 << board[nextR][nextC]
        if path & n == 0 {
            dfs(r: nextR, c: nextC, count: count+1, path: path | n)
        }
        
    }
}

dfs(r: 0, c: 0, count: 1, path: 1 << board[0][0])

print(result)