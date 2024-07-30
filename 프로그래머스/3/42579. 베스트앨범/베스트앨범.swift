import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var genrePlayCount: [String: Int] = [:]
    var genreSongs: [String: [(index: Int, playCount: Int)]] = [:]
    
    for (index, genre) in genres.enumerated() {
        genrePlayCount[genre, default: 0] += plays[index]
        genreSongs[genre, default: []].append((index, plays[index]))
    }
    
    let sortedGenres = genrePlayCount.sorted { $0.value > $1.value }.map { $0.key }
    
    var result: [Int] = []
    for genre in sortedGenres {
        let sortedSongs = genreSongs[genre]!.sorted {
            if $0.playCount == $1.playCount {
                return $0.index < $1.index
            } else {
                return $0.playCount > $1.playCount
            }
        }
        
        for i in 0..<min(2, sortedSongs.count) {
            result.append(sortedSongs[i].index)
        }
    }
    
    return result
}