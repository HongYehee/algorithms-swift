// 1920 수 찾기

import Foundation

// N, N개의 정수, M, M개의 수 입력받기
if let N = Int(readLine() ?? ""),
let arrN = readLine()?.split(separator: " ").compactMap({ Int($0) }),
let M = Int(readLine() ?? ""),
let arrM = readLine()?.split(separator: " ").compactMap({ Int($0) }) {
    
    // N 배열 정렬하기
    let sortedArrN = arrN.sorted()
    
    // 이분 탐색 구현하기
    func binarySearch(_ arr: [Int], _ target: Int, _ low: Int, _ high: Int) -> Bool {
        var low = low
        var high = high
        while low <= high {
            let mid = (low + high) / 2
            if arr[mid] > target { high = mid - 1 }
            else if arr[mid] < target { low = mid + 1 }
            else { return true }
        }
        return false
    }
    
    // M 배열에 있는 각각의 수가 N 배열에 존재하는지 이분 탐색 진행하기
    for m in arrM {
        if binarySearch(sortedArrN, m, 0, N - 1) { print(1) }
        else { print(0) }
    }
}
