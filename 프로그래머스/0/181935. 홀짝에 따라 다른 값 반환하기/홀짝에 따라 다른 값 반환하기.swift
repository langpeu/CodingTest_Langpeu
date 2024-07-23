import Foundation

func solution(_ n:Int) -> Int {
    var result = 0
    if n % 2 == 0 {
        (1...n).filter{$0 % 2 == 0}.map{result = result + ($0 * $0)}
    }else {
        (1...n).filter{$0 % 2 != 0}.map{result = result + $0}
    }
    return result
}