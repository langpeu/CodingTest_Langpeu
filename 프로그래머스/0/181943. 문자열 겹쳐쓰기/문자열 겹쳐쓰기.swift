import Foundation

func solution(_ my_string:String, _ overwrite_string:String, _ s:Int) -> String {
    
    let reg = overwrite_string.count
    
    return Array(my_string).enumerated().map{
        $0.offset >= s && $0.offset < s+reg ? "\(Array(overwrite_string)[$0.offset - s])" : "\($0.element)"
    }.joined()
}

