// 2644 촌수계산

import Foundation

// 전체 사람의 수 n, 촌수 계산할 두 사람의 번호 a b, 부모 자식 간 관계 개수 m, 부모 자식 간 관계 x y 입력받기
if let nInput = readLine(), let N = Int(nInput) {
    if let abInput = readLine() {
        let AB = abInput.split(separator: " ").map { Int($0)! }
        let A = AB[0]
        let B = AB[1]
        
        if let mInput = readLine(), let M = Int(mInput) {
            var graph = [[Int]](repeating: [Int](), count: N + 1)
            
            for _ in 0..<M {
                if let edgeInput = readLine() {
                    let edge = edgeInput.split(separator: " ").map { Int($0)! }
                    let x = edge[0]
                    let y = edge[1]
                    graph[x].append(y)
                    graph[y].append(x)
                }
            }
            
            // visited 초기화
            var visited = [Bool](repeating: false, count: N + 1)
            var flag = false
            
            // 촌수 계산 dfs 구현 -> 노드의 깊이 계산
            func dfs(_ node: Int, _ count: Int) {
                visited[node] = true
                // B를 만나면
                if node == B {
                    flag = true
                    print(count)
                    return
                }
                for x in graph[node] {
                    if !visited[x] {
                        dfs(x, count + 1)
                    }
                }
            }
            
            // A부터 탐색 시작
            dfs(A, 0)
            
            // 촌수가 없으면 -1 출력
            if !flag {
                print(-1)
            }
        }
    }
}