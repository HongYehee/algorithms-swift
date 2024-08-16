// 2828 사과 담기 게임

import Foundation

// 스크린의 칸 개수 N, 바구니의 칸 개수 M, 떨어지는 사과의 개수 J 입력받기
if let input = readLine()?.split(separator: " ").compactMap({ Int($0)} ),
input.count == 2 {
    let N = input[0]
    let M = input[1]
    if let J = Int(readLine() ?? "") {
        
        // 바구니의 최초 위치 설정
        var left = 1
        var right = M
        var dist = 0
        
        // J개의 사과가 떨어지는 위치 입력받고, 바구니가 움직인 거리 계산하기
        for _ in 0..<J {
            if let now = Int(readLine() ?? "") {
                
                // 가만히 있어도 사과를 받을 수 있는 경우
                if left <= now && now <= right {
                    continue
                }
                
                // 왼쪽으로 이동해야 사과를 받을 수 있는 경우
                else if now > right {
                    let move = now - right
                    dist += move
                    left += move
                    right += move
                }
                
                // 오른쪽으로 이동해야 사과를 받을 수 있는 경우
                else if now < left {
                    let move = left - now
                    dist += move
                    left -= move
                    right -= move
                }
            }
        }
        
        // 총 이동 거리 출력
        print(dist)
    }
}
