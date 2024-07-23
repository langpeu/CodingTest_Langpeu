func solution(_ arr:[Int]) -> Int {
    var answer = 0
    var old = arr
    while true {
        var new:[Int] = old.map { i in
            var t = i
            if i >= 50 && i % 2 == 0 {
                t = t / 2
            }else if i < 50 && i % 2 == 1 {
                t = (t * 2) + 1
            }
            return Int(t)
        }
        if old == new {
            break
        }else {
            old = new
            answer += 1
        }
    }
    return answer
}