import Foundation

func solution(_ str1:String, _ str2:String) -> String {
    return zip(Array(str1),Array(str2)).map{String($0)+String($1)}.joined()
}