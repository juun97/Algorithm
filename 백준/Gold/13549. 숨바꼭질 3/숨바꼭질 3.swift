let input = readLine()!.split(separator: " ").map { Int(String($0))! }

var n = input[0]
let k = input[1]
var queue: [(x:Int,y:Int)] = []
var visited = Array(repeating: false, count: 100001)

func bfs() {
    queue.append((x: n, y: 0))
    
    while !queue.isEmpty {
        let now = queue.removeFirst()
        
        if now.x == k {
            print(now.y)
            break
        }
        
        if now.x * 2 < 100001 && !visited[now.x*2] {
            visited[now.x*2] = true
            queue.append((now.0*2, now.y))
        }
        
        if now.x - 1 >= 0 && !visited[now.x-1] {
            visited[now.x-1] = true
            queue.append((now.x-1, now.y+1))
        }
        
        if now.x + 1 < 100001 && !visited[now.x+1] {
            visited[now.x+1] = true
            queue.append((now.0+1, now.y+1))
        }

    }
}

bfs()