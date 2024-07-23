import Foundation

func solution(_ a:Int, _ b:Int) -> Int {
    let ab = "\(a)\(b)"
    let ba = "\(b)\(a)"
    return max(Int(ab)!, Int(ba)!)
}