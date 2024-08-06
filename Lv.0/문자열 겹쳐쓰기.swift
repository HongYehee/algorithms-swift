// 문자열 겹쳐쓰기

import Foundation

func solution(_ my_string: String, _ overwrite_string: String, _ s: Int) -> String {
    
    var leftStr = my_string.prefix(s)
    var midStr = overwrite_string
    var rightStr = my_string.suffix(my_string.count - overwrite_string.count - s)
    
    return leftStr + midStr + rightStr
}