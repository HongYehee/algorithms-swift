// 5585 거스름돈

import Foundation

// 물건의 금액 입력받기
if let input = readLine(), let price = Int(input) {
    
    // 잔돈의 금액 계산하기
    var change = 1000 - price
    
    // 잔돈의 최소 개수 계산하기
    let coins = [500, 100, 50, 10, 5, 1]
    var cnt = 0
    
    for coin in coins {
        cnt += change / coin
        change %= coin
    }
    
    // 잔돈의 최소 개수 출력하기
    print(cnt)
}
