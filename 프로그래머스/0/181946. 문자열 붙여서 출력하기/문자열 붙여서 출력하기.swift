import Foundation

let inp = readLine()!.components(separatedBy: [" "]).map { $0 }
let (s1, s2) = (inp[0], inp[1])

if s1.count >= 1 && s1.count <= 10 {
  if s2.count >= 1 && s2.count <= 10 {
      print(s1+s2)
  }    
}