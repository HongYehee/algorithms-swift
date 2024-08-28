// 1012 유기농 배추

import Foundation

// 방향 벡터
let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

// bfs 구현
func bfs(_ x: Int, _ y: Int, _ M: Int, _ N: Int, _ board: inout [[Int]]) {
    var queue = [(x, y)]
    board[x][y] = 0 // 방문할 노드 0으로 설정
    
    while !queue.isEmpty {
        let (currentX, currentY) = queue.removeFirst()
        for i in 0..<4 {
            let nx = currentX + dx[i]
            let ny = currentY + dy[i]
            
            // 밭을 벗어나는지 확인
            if nx < 0 || nx >= M || ny < 0 || ny >= N {
                continue
            }
            
            // 미방문 노드인 경우 방문 처리
            if board[nx][ny] == 1 {
                board[nx][ny] = 0
                queue.append((nx, ny))
            }
        }
    }
}

// 테스트 케이스의 수 T 입력받기
if let T = Int(readLine()!) {
    
    // 각 테스트 케이스의 배추밭의 가로 길이 M, 세로 길이 N, 배추 개수 K 입력받기
    for _ in 0..<T {
        if let line = readLine()?.split(separator: " ").compactMap({ Int($0) }) {
            let M = line[0]
            let N = line[1]
            let K = line[2]
            
            // 배추밭 이중 배열 선언 후 0으로 초기화
            var field = Array(repeating: Array(repeating: 0, count: N), count: M)
            
            // K개의 배추 위치 정보 입력받아 1로 표시하기
            for _ in 0..<K {
                if let positions = readLine()?.split(separator: " ").compactMap({ Int($0) }) {
                    let x = positions[0]
                    let y = positions[1]
                    field[x][y] = 1
                }
            }
            
            // 배추밭[0][0]부터 배추밭[M-1][N-1]까지 돌면서 : 배추인 경우 ⇒ 지렁이 한 마리 추가 후 bfs 실행
            var worms = 0
            for x in 0..<M {
                for y in 0..<N {
                    if field[x][y] == 1 {
                        worms += 1
                        bfs(x, y, M, N, &field)
                    }
                }
            }
            
            // 총 지렁이의 수 출력
            print(worms)
        }
    }
}
