//
//  itemStruct.swift
//  tt (iOS)
//
//  Created by Willy on 2022/8/26.
//

import Foundation

struct item {
    var iid: Int
    var iname: String
    var itemMoney: Int
    var peoplePayDict: [Int: Int] //[pid : pay]
    
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

