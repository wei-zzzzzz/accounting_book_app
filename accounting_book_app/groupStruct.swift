//
//  groupStruct.swift
//  accounting_book_app
//
//  Created by 張丞嘉 on 2022/8/23.
//

import Foundation

class group: ObservableObject, Codable {
    @Published var gname: String
    @Published var gid: Int
    @Published var people_list: [people]
    @Published var item_list: [item]
    
    init(gname: String, gid: Int, people_list: [people], item_list: [item]) {
        self.gname = gname
        self.gid = gid
        self.people_list = people_list
        self.item_list = item_list
    }

    enum CodingKeys: CodingKey {
        case gname
        case gid
        case people_list
        case item_list
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        gname = try container.decode(String.self, forKey: .gname)
        gid = try container.decode(Int.self, forKey: .gid)
        people_list = try container.decode([people].self, forKey: .people_list)
        item_list = try container.decode([item].self, forKey: .item_list)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(gname, forKey: .gname)
        try container.encode(gid, forKey: .gid)
        try container.encode(people_list, forKey: .people_list)
        try container.encode(item_list, forKey: .item_list)
    }
    
    static func IsPeopleInGroup(myGroup: group, pid: Int) -> Bool {
        for id in myGroup.people_list {
            if (id.pid == pid) {
                return true
            }
        }
        return false
    }
    
    static func addPeople(myGroup: group, addPeople: people) {
        if (!IsPeopleInGroup(myGroup: myGroup, pid: addPeople.pid)) {
            let myUserData: userData = userData.readFile()!
            
            for idx in (0..<myUserData.gidList.count) {
                if (myUserData.gidList[idx].gid == myGroup.gid) {
                    myUserData.gidList[idx].people_list.append(addPeople)
                    userData.saveFile(userDataFile: myUserData)
                    //print("save item data")
                    break;
                }
            }
            myGroup.people_list.append(addPeople)
        }
    }
    static func getPeopleName(pid: Int, myGroup: group) -> String? {
        for index in (0..<myGroup.people_list.count) {
            if (myGroup.people_list[index].pid == pid) {
                return myGroup.people_list[index].name
            }
        }
        return nil
    }
    
    static func addItem(myGroup: group, addItem: item) {
        let myUserData: userData = userData.readFile()!
        
        for idx in (0..<myUserData.gidList.count) {
            if (myUserData.gidList[idx].gid == myGroup.gid) {
                myUserData.gidList[idx].item_list.append(addItem)
                userData.saveFile(userDataFile: myUserData)
                print("save item data")
                break;
            }
        }
        
        myGroup.item_list.append(addItem)
    }
    
    static func removeItem(myGroup: group, Item: item) {
        let myUserData: userData = userData.readFile()!
        
        //let idx = myGroup.item_list.firstIndex(where: {$0.iid == Item.iid})
        let idx: Int = 0
        
        for idx in (0..<myUserData.gidList.count) {
            if (myUserData.gidList[idx].gid == myGroup.gid) {
                myUserData.gidList[idx].item_list.remove(at: idx)
                userData.saveFile(userDataFile: myUserData)
                print("save item data")
                break;
            }
        }
        
        myGroup.item_list.remove(at: idx)
    }
    
    static func closeItem(myItem: item) -> [Int:Int] {
        // this function return a dict [pid:Money]
        // pid need to pay some money to someone if Money is negative
        // pid receive some money from someone if Money is positive
        
        var retPayDict: [Int:Int] = [:]
        var payMoneyPerPeople: Int = myItem.itemMoney / myItem.peoplePayDict.count
        var remain: Int = 0
        
        for (key, value) in myItem.peoplePayDict {
            remain = value - payMoneyPerPeople
            retPayDict[key] = remain
        }
        
        return retPayDict
    }
    
//    // test
//    let account0 = account.init(payPid: 0, receive: [1:100, 2:50])
//    let account1 = account.init(payPid: 1, receive: [0:100, 3:50])
//    retAccount.append(account0)
//    retAccount.append(account1)
//    //
    
    static func closeAccount(myGroup: group) -> [account] {
        var retAccount: [account] = []
        var eachPeoplePayReceive: [Int:Int] = [:]
        
        // init eachPeoplePayReceive
        for people in myGroup.people_list {
            eachPeoplePayReceive[people.pid] = 0
        }

        for currItem in myGroup.item_list {
            var eachItemDict: [Int:Int] = group.closeItem(myItem: currItem)
            
            for (key, value) in eachItemDict {
                eachPeoplePayReceive[key]! += value
            }
        }
        
        eachPeoplePayReceive.sorted(by: <)
        
        print(eachPeoplePayReceive)
        
        
        return retAccount
    }
}
