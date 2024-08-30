// 17204 죽음의 게임

import Foundation

// 참석자 수 N, 보성이의 번호 K 입력받기
if let input = readLine()?.split(separator: " ").compactMap({ Int($0) }), input.count == 2 {
    let N = input[0]
    let K = input[1]
    
    var arr = [Int]()
    
    // N개의 지목 번호 입력받기
    for _ in 0..<N {
        if let number = Int(readLine()!) {
            arr.append(number)
        }
    }
    
    // visited 배열 초기화
    var visited = Array(repeating: false, count: N)
    
    // 탐색 시작
    var now = 0 // 지목하는 사람 : 0부터
    visited[now] = true
    var ans = 0 // 지목 횟수 : 0부터 M까지
    
    while true {
        let nextNode = arr[now] // 지목 당한 사람
        ans += 1 // 지목 횟수 증가
        
        // 보성이 걸리면
        if nextNode == K {
            print(ans)
            break
        }
        // 이미 탐색한 노드를 다시 만나면 사이클이 존재하므로 break
        else if visited[nextNode] {
            print(-1)
            break
        }
        // 모두 해당하지 않으면 지목당한 사람이 지목하는 사람이 됨
        else {
            visited[nextNode] = true
            now = nextNode
        }
    }
}
