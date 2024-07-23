import Foundation

struct UserInfo: Codable {
    var name: String
    var scount = 0
    var gcount = 0
    var zisu = 0
    var nextgift = 0
    var dealInfos: [DealInfo]
    
    mutating func updateDealInfos(dealWith:String, scount: Int, gcount: Int) {
        for (index,dealInfo) in self.dealInfos.enumerated() {
            if dealInfo.dealwith == dealWith {
                if scount != 0 && self.dealInfos[index].scount == -1 {
                    self.dealInfos[index].scount = 0
                }
                
                if gcount != 0 && self.dealInfos[index].gcount == -1 {
                    self.dealInfos[index].gcount = 0
                }
                
                self.dealInfos[index].scount = self.dealInfos[index].scount + scount
                self.dealInfos[index].gcount = self.dealInfos[index].gcount + gcount
            }
        }
    }
}

struct DealInfo: Codable {
    var dealwith: String
    var scount = 0
    var gcount = 0
}

func getZisu(infoList:[UserInfo], name: String) -> Int? {
    for (_, infoList) in infoList.enumerated() {
        if infoList.name == name {
            return infoList.zisu
        }
    }
    return nil
}

func solution(_ friends:[String], _ gifts:[String]) -> Int {
   
    var infoList:[UserInfo] = []
    var dealList:[DealInfo] = []
    for (_, user)in friends.enumerated() {
        dealList.append(DealInfo(dealwith: user, scount: -1, gcount: -1))
    }
    
    for (_, user)in friends.enumerated() {
        infoList.append(UserInfo(name: user, scount: 0, gcount: 0, zisu: 0, nextgift: 0, dealInfos:dealList))
    }
    
    for (index, info)in infoList.enumerated() {
        let toUser = gifts.filter { $0.components(separatedBy: " ")[0] == info.name }
        let fromUser = gifts.filter { $0.components(separatedBy: " ")[1] == info.name }
        
        infoList[index].scount = toUser.count
        infoList[index].gcount = fromUser.count
        infoList[index].zisu = toUser.count - fromUser.count
        
        _ = toUser.map {
            let toUserName = $0.components(separatedBy: " ")[1]
            infoList[index].updateDealInfos(dealWith: toUserName, scount: 1, gcount: 0 )
        }
        
        _ = fromUser.map {
            let fromUserName = $0.components(separatedBy: " ")[0]
            infoList[index].updateDealInfos(dealWith: fromUserName, scount: 0, gcount: 1)
        }
        
    }
    
    for (index, user) in infoList.enumerated() {
        for (_, deal) in user.dealInfos.enumerated() {
            if user.name != deal.dealwith {
                
                if (deal.scount > 0 || deal.gcount > 0) {
                    if deal.scount > deal.gcount {
                        infoList[index].nextgift += 1
                    }
                    
                    if (deal.scount == deal.gcount) {
                        if let dealzisu = getZisu(infoList: infoList, name: deal.dealwith) {
                            if user.zisu > dealzisu {
                                infoList[index].nextgift += 1
                            }
                        }
                    }
                }else if (deal.scount == -1 && deal.gcount == -1) {
                    if let dealzisu = getZisu(infoList: infoList, name: deal.dealwith) {
                        if user.zisu > dealzisu {
                            infoList[index].nextgift += 1
                        }
                    }
                }
            }
        }
    }
    
    return (infoList.map{ $0.nextgift }).max()!
}