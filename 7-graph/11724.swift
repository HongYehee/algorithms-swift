// 11724 연결 요소의 개수

import Foundation

// 재귀 함수 최대 호출 깊이
let recursionLimit = 1000000

// 정점의 개수 N, 간선의 개수 M, M개의 (u, v) 입력받기
if let input = readLine() {
    let NM = input.split(separator: " ").map { Int($0)! }
    let N = NM[0]
    let M = NM[1]
    
    // graph 초기화
    var graph = [[Int]](repeating: [Int](), count: N + 1)
    
    // 정점 입력받기
    for _ in 0..<M {
        if let edgeInput = readLine() {
            let edge = edgeInput.split(separator: " ").map { Int($0)! }
            let a = edge[0]
            let b = edge[1]
            graph[a].append(b)
            graph[b].append(a)
        }
    }
    
    // visited 초기화
    var visited = [Bool](repeating: false, count: N + 1)
    
    // dfs 구현
    func dfs(_ node: Int) {
        visited[node] = true
        for i in graph[node] {
            if !visited[i] {
                dfs(i)
            }
        }
    }
    
    // 탐색 시작 : 연결 요소 개수 구하기
    var cnt = 0
    for i in 1...N {
        if !visited[i] {
            cnt += 1
            dfs(i)
        }
    }
    
    // 연결 요소 개수 출력
    print(cnt)
}