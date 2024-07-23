import Foundation

let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
let (a, b) = (n[0], n[1])
if a >= -100000 && b <= 100000 {
    print("a = \(a)")
    print("b = \(b)")
}
