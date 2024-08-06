// 10814 나이순 정렬

import Foundation

// 회원 수 N과, N명의 나이와 이름 입력받기
if let input = readLine(), let N = Int(input) {
    var arr: [(Int, String)] = []
    
    for _ in 0..<N {
        if let line = readLine() {
            let parts = line.split(separator: " ")
            if parts.count == 2, let age = Int(parts[0]) {
                let name = String(parts[1])
                arr.append((age, name))
            }
        }
    }
    
    // 나이를 기준으로 오름차순 정렬
    arr.sort { $0.0 < $1.0 }
    
    // 한 줄에 한 명씩 나이와 이름 출력
    for i in arr {
        print(i.0, i.1)
    }
    
}
