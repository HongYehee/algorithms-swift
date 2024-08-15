// 14916 거스름돈

import Foundation

// 거슬러줘야 하는 금액 n 입력받기
if let input = readLine(), let n = Int(input) {
    
    // 일단, 2원과 5원의 조합으로 n원을 거슬러 줄 수 있는지 체크하기
    
    // 5원 동전으로 거슬러 줄 수 있는 동전 수 구하기
    var numFive = n / 5
    
    // 그리고 남은 금액을 2원으로 거슬러주기
    var canChange = false
    
    while numFive >= 0 {
        let remain = n - (5 * numFive)
        
        // 거슬러 줄 수 있는 경우, 최소 동전의 개수를 계산하여 출력하기
        if remain % 2 == 0 {
            let numTwo = remain / 2
            canChange = true
            print(numFive + numTwo)
            break
        }
        
        // 남은 금액을 2원으로 거슬러줄 수 없는 경우, 5원의 개수 하나 줄이고 다시 계산
        numFive -= 1
    }
    
    // 거슬러줄 수 없는 경우, -1 출력하기
    if !canChange {
        print(-1)
    }
}
