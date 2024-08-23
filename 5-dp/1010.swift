// 1010 다리 놓기

import Foundation

// 테스트 케이스의 개수 T 입력받기
if let T = Int(readLine()!) {
    
    // 각 테스트 케이스마다 서쪽 지점의 개수 N, 동쪽 지점의 개수 M 입력받기
    for _ in 0..<T {
        if let input = readLine()?.split(separator: " ").compactMap({ Int($0) }) {
            let N = input[0]
            let M = input[1]
            
            // (N + 1) * (M + 1) 크기의 dp table 생성하기
            var dp = Array(repeating: Array(repeating: 0, count: M + 1), count: N + 1)
            
            // base case 입력하기 (서쪽에 지점이 1개만 있는 경우)
            for i in 1...M {
                dp[1][i] = i
            }
            
            // dp[i][j]에 iCj 값 저장하기
            if N >= 2 {
                for i in 2...N {
                    for j in 1...M {
                        if (i - 1) <= (j - 1) {
                            for k in (i - 1)...(j - 1) {
                                dp[i][j] += dp[i - 1][k]
                            }
                        }
                    }
                }
            }
            
            // 다리를 놓을 수 있는 경우의 수(dp[N][M]) 출력하기
            print(dp[N][M])
        }
    }
}
