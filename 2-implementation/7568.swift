// 7568 덩치

import Foundation

// 전체 사람 수 N 입력받기
if let N = Int(readLine() ?? "0") {

    // N명의 몸무게와 키를 입력받아 배열에 저장하기
    var arr: [(weight: Int, height: Int)] = []
    
    for _ in 0..<N {
        if let input = readLine() {
            let components = input.split(separator: " ")
            if components.count == 2,
            let weight = Int(components[0]),
            let height = Int(components[1]) {
                arr.append((weight, height))
            }
        }
    }
    
    // 각 사람마다, 자신보다 덩치 큰 사람이 몇 명인지 세고 또 다른 배열에 저장하기
    var rankArr: [Int] = Array(repeating: 1, count: N)
    
    for i in 0..<N {
        for j in 0..<N {
            if i != j {
                if (arr[i].weight < arr[j].weight) && (arr[i].height < arr[j].height) {
                    rankArr[i] += 1 // 여기가 핵심~!
                }
            }
        }
    }
    
    // 각 사람의 덩치 등수 출력하기
    print(rankArr.map { String($0) }.joined(separator: " "))
}
