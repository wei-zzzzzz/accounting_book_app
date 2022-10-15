//
//  itemStruct.swift
//  accounting_book_app
//
//  Created by 張丞嘉 on 2022/8/22.
//

import Foundation

class item: ObservableObject, Codable {
    @Published var iid: Int
    @Published var iname: String
    @Published var itemMoney: Int
    @Published var peoplePayDict: [Int:Int] //[pid : pay]
    
    init(iid: Int, iname: String, itemMoney: Int, peoplePayDict: [Int:Int]) {
        self.iid = iid
        self.iname = iname
        self.itemMoney = itemMoney
        self.peoplePayDict = peoplePayDict
    }
    
    enum CodingKeys: CodingKey {
        case iid
        case iname
        case itemMoney
        case peoplePayDict
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        iid = try container.decode(Int.self, forKey: .iid)
        iname = try container.decode(String.self, forKey: .iname)
        itemMoney = try container.decode(Int.self, forKey: .itemMoney)
        peoplePayDict = try container.decode([Int:Int].self, forKey: .peoplePayDict)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(iid, forKey: .iid)
        try container.encode(iname, forKey: .iname)
        try container.encode(itemMoney, forKey: .itemMoney)
        try container.encode(peoplePayDict, forKey: .peoplePayDict)
    }
    
    static func creatItemId(myGroup: group) -> Int {
        var new_iid: Int = 0
        var count: Int = 0
        var isGetId: Bool = false
        
        while (!isGetId) {
            count = 0
            new_iid = Int.random(in: 0..<10000)
            for item in myGroup.item_list {
                if (item.iid != new_iid) {
                    count += 1
                }
            }
            
            if (count == myGroup.item_list.count) {
                isGetId = true
            }
        }
        
        return new_iid
    }
    
    static func IsPeopleInItem(myItem: item, pid: Int) -> Bool {
        for id in myItem.peoplePayDict.keys {
            if (id == pid) {
                return true
            }
        }
        return false
    }
    
    static func getEachPeoplePay(myItem: item) -> [Int] {
        var peoplePay: [Int] = []
        for (value) in myItem.peoplePayDict.values {
            peoplePay.append(value)
        }
        return peoplePay
    }
    
    static func getPeopleId(myItem: item, pos: Int) -> Int {
        var count: Int = 0
        var retId: Int = 0
        for id in myItem.peoplePayDict.keys {
            if (count == pos) {
                retId = id
                break
            }
            count += 1
        }
        return retId
    }
    
    static func setPeoplePayDict(myItem: item, pid: Int, pPay: Int) {
        myItem.peoplePayDict[pid] = pPay
    }
}
