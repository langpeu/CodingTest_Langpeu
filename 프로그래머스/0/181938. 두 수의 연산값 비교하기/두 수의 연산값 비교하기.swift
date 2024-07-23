import Foundation

func solution(_ a:Int, _ b:Int) -> Int {
    let ab = Int("\(a)\(b)")!
    let dab = 2*a*b
    return ab > dab ? ab : dab
}