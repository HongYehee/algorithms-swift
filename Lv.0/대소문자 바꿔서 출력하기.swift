// 대소문자 바꿔서 출력하기

import Foundation

let s1 = readLine()!

for i in s1 {
    guard 1...20 ~= s1.count else { break }
    
    if i.isLowercase {
        print(i.uppercased(), terminator: "")
    }
    else {
        print(i.lowercased(), terminator: "")
    }
}
