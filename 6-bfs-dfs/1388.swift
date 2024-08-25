// 1388 바닥 장식

import Foundation

// 가로 길이 N, 세로 길이 M 입력받기
if let input = readLine()?.split(separator: " ").compactMap({ Int($0) }) {
    let N = input[0]
    let M = input[1]
    
    // N * M 배열에 바닥 장식 모양 입력받기
    var floor = [[Character]]()
    for _ in 0..<N {
        if let line = readLine() {
            floor.append(Array(line))
        }
    }
    
    // visited 배열 초기화
    var visited = Array(repeating: Array(repeating: false, count: M), count: N)
    
    // 가로 방향 탐색
    func checkRow(x: Int, y: Int) {
        var y = y
        while y < M {
            visited[x][y] = true
            if y + 1 < M && floor[x][y + 1] == "-" && !visited[x][y + 1] {
                y += 1
            }
            else {
                break
            }
        }
    }
    
    // 세로 방향 탐색
    func checkCol(x: Int, y: Int) {
        var x = x
        while x < N {
            visited[x][y] = true
            if x + 1 < N && floor[x + 1][y] == "|" && !visited[x + 1][y] {
                x += 1
            }
            else {
                break
            }
        }
    }
    
    // 탐색 진행
    var cnt = 0
    for x in 0..<N {
        for y in 0..<M {
            if !visited[x][y] {
                cnt += 1
                if floor[x][y] == "-" {
                    checkRow(x: x, y: y)
                }
                else if floor[x][y] == "|" {
                    checkCol(x: x, y: y)
                }
            }
        }
    }
    // 판자 개수 출력
    print(cnt)
    
}
