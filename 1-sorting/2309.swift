// 2309 일곱 난쟁이

import Foundation

// 두 명의 난쟁이를 제외한 배열을 출력하는 함수
func printAns(arr: [Int], a: Int, b: Int) {
    for i in 0..<arr.count {
        if i == a || i == b { continue }
        print(arr[i])
    }
}

// 아홉 난쟁이 키를 배열에 입력받고 합계도 구하기
var arr: [Int] = []
var total = 0

for _ in 0..<9 {
    if let input = readLine(), let height = Int(input) {
        arr.append(height)
        total += height
    }
}

// 배열을 오름차순으로 정렬
arr.sort()

// 9명의 난쟁이 중 2명을 제외한 모든 경우를 탐색
var foundAns = false

for i in 0..<9 {
    if foundAns { break }
    
    for j in (i + 1)..<9 {
        let now = total - arr[i] - arr[j]
        if now == 100 {
            printAns(arr: arr, a: i, b:j)
            foundAns = true
            break
        }
    }
}
