import Foundation

let s1 = readLine()!

if s1.count >= 1 && s1.count <= 20 {
  print(s1.map{ $0.isUppercase ? $0.lowercased() : $0.uppercased() }.joined())    
}


 