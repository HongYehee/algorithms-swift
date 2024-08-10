// 25305 커트라인

import Foundation

// 학생 수 N, 상을 받는 학생 수 K 입력받기
if let firstLine = readLine() {
    let parts = firstLine.split(separator: " ")
    if let N = Int(parts[0]), let K = Int(parts[1]) {
        
        // 각 학생의 점수를 입력받아 배열에 저장하기
        if let scoresLine = readLine() {
            let arr = scoresLine.split(separator: " ").compactMap { Int($0) }
            
            // 배열을 내림차순으로 정렬
            let sortedArr = arr.sorted(by: >)
            
            // k번째 점수 출력하기
            if K > 0 && K <= sortedArr.count {
                print(sortedArr[K - 1])
            }
        }
    }
}
