// 5635 생일

import Foundation

// 학생의 수 n과 n명의 학생의 정보(이름과 생일) 입력받기
if let input = readLine(), let n = Int(input) {
    var arr: [(Int, Int, Int, String)] = []
    
    for _ in 0..<n {
        if let line = readLine() {
            let birth = line.split(separator: " ")
            if birth.count == 4,
            let year = Int(birth[3]),
            let month = Int(birth[2]),
            let day = Int(birth[1]) {
                let name = String(birth[0])
                // (yyyy, mm, dd, name) 순서로 저장하기
                arr.append((year, month, day, name))
            }
        }
    }
    
    // 배열 오름차순 정렬하기 (yyyy → mm → dd)
    arr.sort { $0 < $1 }
    
    // 나이가 가장 적은 사람, 나이가 가장 많은 사람 출력하기
    if let youngest = arr.last, let oldest = arr.first {
        print(youngest.3)
        print(oldest.3)
    }
}
