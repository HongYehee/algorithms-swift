// 2748 피보나치 수 2

import Foundation

// 자연수 n 입력받기
if let input = readLine(), let n = Int(input) {
    
    // dp table을 만들고, dp[0] = 0, dp[1] = 1, dp[2] = 1을 넣기 (dp[0]은 사용 X)
    var dp = [0, 1, 1]
    
    // dp[3]부터 dp[n]까지 계산 (Fn = Fn-1 + Fn-2)
    if n >= 3 {
        for i in 3...n {
            dp.append(dp[i - 2] + dp[i - 1])
        }
    }
    
    // dp[n] 출력
    print(dp[n])
}
