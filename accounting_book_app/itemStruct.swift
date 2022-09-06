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
//    var inItemPeople: [Int] //pid
    var peoplePayDict: [Int: Int] //[pid : pay]
    
    init(iid: Int, iname: String, itemMoney: Int, peoplePayDict: [Int:Int]) {
        self.iid = iid
        self.iname = iname
        self.itemMoney = itemMoney
//        self.inItemPeople = []
        self.peoplePayDict = peoplePayDict
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
        
    static func addPeople(myItem: inout item, pid: Int, pPay: Int) {
            myItem.peoplePayDict[pid] = pPay
        }

}
