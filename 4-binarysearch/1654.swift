// 1654

import Foundation

// 이미 가지고 있는 랜선의 수 K, 필요한 랜선의 수 N 입력받기
if let input = readLine()?.split(separator: " ").compactMap({ Int($0) }) {
    let k = input[0]
    let n = input[1]
    
    // K개의 랜선 길이 입력받기
    var lan = [Int]()
    for _ in 0..<k {
        if let length = Int(readLine()!) {
            lan.append(length)
        }
    }
    
    // 랜선 길이 정렬
    lan.sort()

    // 이분 탐색 범위 : 최소 1부터 최대 랜선 길이
    var start = 1
    var end = lan.max()!

    // 이분 탐색 실행 : start가 end와 같아질 때까지 탐색
    while start <= end {
        let mid = (start + end) / 2
        var lines = 0
        
        // 모든 랜선을 mid로 나눠서 몇 개가 나오는지 계산
        for length in lan {
            lines += (length / mid)
        }
        
        // 잘라서 나온 랜선의 개수가 필요한 개수보다 많거나 같으면
        if lines >= n {
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    
    // 최대 랜선 길이 출력
    print(end)
}
