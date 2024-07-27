import Foundation

func parseLog(_ log: String) -> (start: Date, end: Date) {
    let comp = log.split(separator: " ")
    let dateStr = String(comp[0])
    let timeStr = String(comp[1])
    let durationStr = String(comp[2])
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
    dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
    
    let endTime = dateFormatter.date(from: "\(dateStr) \(timeStr)")!
    let duration = Double(durationStr.dropLast())! // s 제거
    let startTime = endTime.addingTimeInterval(-duration + 0.001)
    
    return (start: startTime, end: endTime)
}

func solution(_ lines:[String]) -> Int {
    let intervals = lines.map { parseLog($0) }
    var maxRequests = 0
    
    for interval in intervals {
        let checkStart = interval.end
        let checkEnd = interval.end.addingTimeInterval(1) - 0.001
        
        var count = 0
        for inter in intervals {
            if inter.start <= checkEnd && inter.end >= checkStart {
                count += 1
            }
        }
        maxRequests = max(maxRequests, count)
    }
    
    print(intervals)
    return maxRequests
}