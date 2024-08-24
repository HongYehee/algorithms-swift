// 1463 1로 만들기

import Foundation

// 정수 N 입력받기
if let N = Int(readLine()!) {
    
    // dp table 초기화
    var dp = Array(repeating: 0, count: N + 1)
    
    // dp 진행
    if N >= 2 {
        for i in 2...N {
            
            // 1) 1을 빼는 연산
            dp[i] = dp[i - 1] + 1
            
            // 2) 2로 나누어 떨어지는 경우
            if i % 2 == 0 {
                dp[i] = min(dp[i], dp[i / 2] + 1)
            }
            
            // 3) 3으로 나누어 떨어지는 경우
            if i % 3 == 0 {
                dp[i] = min(dp[i], dp[i / 3] + 1)
            }
        }
    }
    
    // 최소 연산 횟수 출력
    print(dp[N])
}
