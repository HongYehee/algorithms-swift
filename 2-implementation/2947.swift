// 2947 나무 조각

import Foundation

// 초기 나무조각 순서 입력받기
if let input = readLine() {
    var arr = input.split(separator: " ").compactMap { Int($0) }
    
    // 버블 정렬 시행
    while true {
        for i in 0..<4 {
            // swap 될 때마다 나무조각 출력
            if arr[i] > arr[i + 1] {
                arr.swapAt(i, i + 1)
                print(arr.map { String($0) }.joined(separator: " "))
            }
        }
        
        // 최종적으로 1 2 3 4 5가 되었는지 확인
        if arr == [1, 2, 3, 4, 5] {
            break
        }
    }
}
