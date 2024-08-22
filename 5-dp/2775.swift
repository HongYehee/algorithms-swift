// 2775 부녀회장이 될테야

import Foundation

// 테스트 케이스의 수 T 입력받기
if let T = Int(readLine()!) {
    
    // 각 테스트 케이스마다 k(층), n(호) 입력받기
    for _ in 0..<T {
        if let k = Int(readLine()!), let n = Int(readLine()!) {
            
            // 0층 1호부터 n호까지 사람 수 입력하기
            var dp = Array(1...n)
            
            // DP 진행 : 1층 1호부터 k층 n호까지 사람 수 계산하기
            for _ in 0..<k {
                for i in 1..<n {
                    dp[i] += dp[i - 1]
                }
            }
        
            // k층 n호 사람 수 출력 (리스트에서 가장 마지막 원소)
            print(dp[n - 1])
        }
    }
}
