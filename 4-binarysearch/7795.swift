// 7795 먹을 것인가 먹힐 것인가

import Foundation

// 테스트 케이스의 개수 T 입력받기
if let T = Int(readLine()!) {
    // (T만큼 반복) A의 개수 N, B의 개수 M, A의 숫자들 arrA, B의 숫자들 arrB 입력받기
    for _ in 0..<T {
        if let input = readLine()?.split(separator: " ").compactMap({ Int($0) }) {
            let A = input[0]
            let B = input[1]
            
            if var arrA = readLine()?.split(separator: " ").compactMap({ Int($0) }),
               var arrB = readLine()?.split(separator: " ").compactMap({ Int($0) }) {
                
                // arrA와 arrB 정렬하기
                arrA.sort()
                arrB.sort()
                
                // 이분 탐색 구현
                func bisectLeft(_ array: [Int], _ value: Int) -> Int {
                    var low = 0
                    var high = array.count
                    
                    while low < high {
                        let mid = (low + high) / 2
                        if array[mid] < value { low = mid + 1}
                        else { high = mid }
                    }
                    return low
                }
                
                // arrA의 각 요소를 arrB의 각 요소와 비교하여 a > b인 경우 cnt에 1씩 더하기
                var cnt = 0
                
                for a in arrA {
                    let index = bisectLeft(arrB, a)
                    cnt += index
                }
                
                // cnt 출력하기
                print(cnt)
            }
        }
    }
}
