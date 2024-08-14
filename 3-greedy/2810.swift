// 2810 컵 홀더

import Foundation

// 좌석의 수 N, 좌석 정보 입력받기
if let N = Int(readLine() ?? ""), let seats = readLine() {
    
    // 컵홀더에 컵을 놓을 수 있는 사람의 수 계산하기
    let numCoupleSeat = seats.components(separatedBy: "LL").count - 1
    
    // 커플석이 1개 이하인 경우, 모든 사람이 컵홀더 사용 가능
    if numCoupleSeat <= 1 {
        print(N)
    }
    // 커플석이 2개일 때부터는 커플석이 1개 늘어날 때마다 1명씩 컵홀더 사용 불가
    else {
        print(N - numCoupleSeat + 1)
    }
}
