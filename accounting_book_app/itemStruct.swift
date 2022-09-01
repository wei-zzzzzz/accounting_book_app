//
//  itemStruct.swift
//  accounting_book_app
//
//  Created by 張丞嘉 on 2022/8/22.
//

import Foundation

class item {
    var iid: Int
    var iname: String
    var itemMoney: Int
    var inItemPeople: [Int] //pid
    var peoplePayDict: [Int: Int] //[pid : pay]
    
    init() {
        self.iid = 0
        self.iname = ""
        self.itemMoney = 0
        self.inItemPeople = []
        self.peoplePayDict = [:]
    }
    
    static func IsPeopleInItem(myItem: item, pid: Int) -> Bool {
        for id in myItem.inItemPeople {
            if (id == pid) {
                return true
            }
        }
        return false
    }
    
    static func getEachPeoplePay(myItem: item) -> [Int] {
        var peoplePay: [Int] = []
        for index in (0..<myItem.peoplePayDict.count) {
            peoplePay.append(myItem.peoplePayDict[myItem.inItemPeople[index]]!)
        }
        return peoplePay
    }
    
    static func addPeople(myItem: inout item, addPeople: people, pPay: Int) {
        if (!IsPeopleInItem(myItem: myItem, pid: addPeople.pid)) {
            myItem.inItemPeople.append(addPeople.pid)
            myItem.peoplePayDict[addPeople.pid] = pPay
        }
    }
}
