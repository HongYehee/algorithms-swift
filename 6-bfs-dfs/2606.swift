// 2606 바이러스

import Foundation

// 컴퓨터의 수, 컴퓨터 쌍의 수 입력받기
if let V = Int(readLine()!), let E = Int(readLine()!) {
    
    // graph와 visited 초기화
    var graph = Array(repeating: [Int](), count: V + 1)
    var visited = Array(repeating: false, count: V + 1)
    
    // 그래프 입력받기
    for _ in 0..<E {
        if let input = readLine()?.split(separator: " ").compactMap({ Int($0) }) {
            let a = input[0]
            let b = input[1]
            graph[a].append(b)
            graph[b].append(a)
        }
    }
    
    // 1번 컴퓨터와 연결된 컴퓨터의 수를 저장할 cnt 변수
    var cnt = 0
    
    // 연결된 컴퓨터들을 모두 탐색하는 DFS 구현
    func dfs(now: Int) {
        visited[now] = true
        cnt += 1
        for i in graph[now] {
            if !visited[i] {
                dfs(now: i)
            }
        }
    }
    
    // 1번 컴퓨터부터 DFS 진행하기
    dfs(now: 1)

    // 1번 컴퓨터와 연결된 컴퓨터의 수 출력하기
    print(cnt - 1)
}
