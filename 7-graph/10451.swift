// 10451 순열 사이클

import Foundation

// dfs 구현
func dfs(_ node: Int, _ arr: [Int], _ visited: inout [Bool]) {
    visited[node] = true // 노드 방문 처리
    let nextNode = arr[node] // 다음 노드 정보 가져오기
    if !visited[nextNode] { // 다음 노드가 미방문이라면 재귀
        dfs(nextNode, arr, &visited)
    }
}

// 테스트 케이스의 개수 T 입력받기
if let T = Int(readLine()!) {
    
    // 각 테스트 케이스마다 : 순열의 크기 N, 순열 입력받기
    for _ in 0..<T {
        if let N = Int(readLine()!) {
            let arrInput = readLine()!.split(separator: " ").compactMap { Int($0) }
            
            // 배열 인덱스 1부터 사용하기 위해 0 추가
            let arr = [0] + arrInput
            
            // visited 배열 초기화
            var visited = Array(repeating: false, count: N + 1)
            
            // cnt 변수 초기화
            var cnt = 0
            
            // 정점 1~N을 탐색하며 사이클의 개수 세기
            for i in 1...N {
                if !visited[i] { // 미방문 노드이면
                    cnt += 1 // 사이클 개수 추가
                    dfs(i, arr, &visited) // dfs 실행
                }
            }
            
            // 사이클의 개수 출력
            print(cnt)
        }
    }
}
