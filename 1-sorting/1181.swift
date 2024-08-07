// 1181 단어 정렬

import Foundation

// 단어의 개수 N과 N개의 단어들 입력받기
var s = Set<String>()

if let input = readLine(), let N = Int(input) {
    for _ in 0..<N {
        if let str = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines) {
            // 단어 중복 제거를 위해 set에 추가하기
            s.insert(str)
        }
    }
}

// set의 원소들을 (길이, 단어) 형태로 배열에 저장하기
var arr: [(Int, String)] = []

for item in s {
    arr.append((item.count, item))
}

// 길이 오름차순, 길이가 같으면 사전 순으로 정렬하기
arr.sort { $0.0 == $1.0 ? $0.1 < $1.1 : $0.0 < $1.0 }

// 한 줄에 하나씩 단어 출력하기
for item in arr {
    print(item.1)
}
