import Foundation

func solution(_ clothes:[[String]]) -> Int {
     /**
     - 의상의 종류를 키(key)로 하고, 해당 종류의 의상 개수를 값(value)으로 하는 딕셔너리를 만듭니다.
     - 이를 통해 각 의상 종류별로 몇 개의 의상이 있는지 파악합니다.
     **/
    
    var clothesDic = [String: Int]()
    
    for cloth in clothes {
        let type = cloth[1]
        clothesDic[type, default: 0] += 1
    }
    
    /**
     곱의법칙 적용
     - 각 의상 종류마다 해당 의상을 입는 경우의 수와 입지 않는 경우의 수를 합하여 (count + 1)을 계산합니다.
     - 예를 들어, 특정 종류의 의상이 2개 있으면, 그 종류에서 선택할 수 있는 경우의 수는
       2개(각각의 의상을 입는 경우) + 1개(아무것도 입지 않는 경우)로 총 3개가 됩니다.
     - 모든 의상 종류에 대해 이러한 경우의 수를 곱합니다.
     
     경우의수 AND 일때 곱의법칙 강의 https://youtu.be/z4QYXmZw5t0?t=872
    **/
    var comb = 1
    for cnt in clothesDic.values {
        comb *= (cnt + 1)
    }
    
    /**
     아무것도 입지 않는 경우 제외
     - 모든 경우의 수를 곱한 결과에서 아무것도 입지 않는 경우의 수 1을 빼줍니다.
     **/
    return comb - 1
}

/** 
 - flow log
 [["yellow_hat", "headgear"],
  ["blue_sunglasses", "eyewear"],
  ["green_turban", "headgear"]]
 ["eyewear": 1, "headgear": 2]
 comb(1) = 1 * (1 + 1)
 comb => (2)
 comb(2) = 2 * (2 + 1)
 comb => (6)
 comb => 6 - 1
 5
**/