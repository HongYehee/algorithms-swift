//  10815 숫자 카드

import Foundation

let n = Int(readLine()!)!
let set = Set(readLine()!.split(separator: " ").map { Int($0)! })

let m = Int(readLine()!)!
let cards = readLine()!.split(separator: " ").map { Int($0)! }

for card in cards {
    print(set.contains(card) ? 1 : 0, terminator: " ")
}
