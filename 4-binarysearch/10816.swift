// 10816 숫자 카드 2

import Foundation

// N, N개의 숫자, M, M개의 숫자 입력받기
let N = Int(readLine()!)!
var arrN = readLine()!.split(separator: " ").map { Int($0)! }
let M = Int(readLine()!)!
var arrM = readLine()!.split(separator: " ").map { Int($0)! }

// N 배열의 각 숫자가 몇 개씩 있는지 세기 (딕셔너리에 저장)
var countDict = [Int: Int]()
for n in arrN {
    countDict[n, default: 0] += 1
}

// M 배열의 각 숫자가 N 배열에 몇 개씩 있는지 출력
for m in arrM {
    let count = countDict[m] ?? 0
    print(count, terminator: " ")
}
