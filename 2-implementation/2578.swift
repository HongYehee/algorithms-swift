// 2578 빙고

import Foundation

// 철수가 빙고판에 쓴 숫자 25개 입력받기
var arr: [[String]] = []
for _ in 0..<5 {
    if let line = readLine() {
        arr.append(line.split(separator: " ").map { String($0) })
    }
}

// 사회자가 부르는 숫자 25개 입력받기
var num: [String] = []
for _ in 0..<5 {
    if let line = readLine() {
        num.append(contentsOf: line.split(separator: " ").map { String($0) })
    }
}

// 빙고판 초기화하기
var checkBoard: [[Bool]] = Array(repeating: Array(repeating: false, count: 5), count: 5)

// 가로/세로/대각선 빙고 수를 검사하는 함수 작성하기
func checkRowBingo() -> Int {
    var cnt = 0
    for i in 0..<5 {
        var isBingo = true
        for j in 0..<5 {
            if !checkBoard[i][j] {
                isBingo = false
                break
            }
        }
        if isBingo {
            cnt += 1
        }
    }
    return cnt
}

func checkColBingo() -> Int {
    var cnt = 0
    for j in 0..<5 {
        var isBingo = true
        for i in 0..<5 {
            if !checkBoard[i][j] {
                isBingo = false
                break
            }
        }
        if isBingo {
            cnt += 1
        }
    }
    return cnt
}

func checkDiagBingo() -> Int {
    var cnt = 0
    
    // '\' 방향 대각선
    var isBingo = true
    for i in 0..<5 {
        if !checkBoard[i][i] {
            isBingo = false
            break
        }
    }
    if isBingo {
        cnt += 1
    }
    
    // '/' 방향 대각선
    isBingo = true
    for i in 0..<5 {
        if !checkBoard[i][4-i] {
            isBingo = false
            break
        }
    }
    if isBingo {
        cnt += 1
    }
    
    return cnt
}

// 사회자가 숫자를 하나씩 부를 때마다, 철수의 빙고판에 표시하고, 빙고 검사하기
for i in 0..<25 {
    let nowNum = num[i]
    for x in 0..<5 {
        for y in 0..<5 {
            if arr[x][y] == nowNum {
                checkBoard[x][y] = true
            }
        }
    }
    
    let cnt = checkRowBingo() + checkColBingo() + checkDiagBingo()
    
    // 철수가 3줄 빙고를 완성하면, 사회자가 몇 번째 수를 불렀을 때인지 출력하기
    if cnt >= 3 {
        print(i + 1)
        break
    }
}
