// 1260 DFS와 BFS

import Foundation

// 정점의 개수 N, 간선의 개수 M, 시작 정점 번호 V 입력받기
if let firstLine = readLine()?.split(separator: " ").compactMap({ Int($0) }) {
    let N = firstLine[0]
    let M = firstLine[1]
    let V = firstLine[2]
    
    // 그래프 입력받기
    var graph = Array(repeating: [Int](), count: N + 1)
    
    for _ in 0..<M {
        if let line = readLine()?.split(separator: " ").compactMap({ Int($0) }) {
            let a = line[0]
            let b = line[1]
            graph[a].append(b)
            graph[b].append(a)
        }
    }
    
    // visited 초기화
    var dfsVisited = Array(repeating: false, count: N + 1)
    var bfsVisited = Array(repeating: false, count: N + 1)
    
    // DFS 구현
    func dfs(_ node: Int) {
        print(node, terminator: " ")
        dfsVisited[node] = true
        for neighbor in graph[node] {
            if !dfsVisited[neighbor] {
                dfs(neighbor)
            }
        }
    }
    
    // BFS 구현
    func bfs(_ node: Int) {
        var queue = [Int]()
        queue.append(node)
        bfsVisited[node] = true
        while !queue.isEmpty {
            let now = queue.removeFirst()
            print(now, terminator: " ")
            for neighbor in graph[now] {
                if !bfsVisited[neighbor] {
                    bfsVisited[neighbor] = true
                    queue.append(neighbor)
                }
            }
        }
    }
    
    // 방문한 정점들을 오름차순으로 정렬
    for i in 1...N {
        graph[i].sort()
    }
    
    // DFS와 BFS 수행 후 결과 출력
    dfs(V)
    print()
    bfs(V)
}
