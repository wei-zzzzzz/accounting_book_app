//
//  countApp.swift
//  count
//
//  Created by RicHard Liao on 2022/8/16.
//

import SwiftUI

@main
struct countApp: App {
         var p1: people
         var p2: people
         var p3: people
         var p4: people
         var myItem: item
         var pPay: [Int]
        //var pPay: [Int:Int]
         var myGroup: group
         
         init() {
             self.p1 = people(pid: 1, name: "A", payMoney: 0)
             self.p2 = people(pid: 2, name: "B", payMoney: 0)
             self.p3 = people(pid: 3, name: "C", payMoney: 0)
             self.p4 = people(pid: 4, name: "D", payMoney: 0)
             
             self.myItem = item(iid: 123,
                                iname: "測試",
                                itemMoney: 100,
                                peoplePayDict: [1: 10, 2:10, 3:80])
             self.pPay = item.getEachPeoplePay(myItem: self.myItem)
             //self.pPay = myItem.peoplePayDict
             self.myGroup = group(gname: "my",
                                  gid: 1,
                                  people_list: [],
                                  item_list: [])
         }
    var body: some Scene {
        WindowGroup {
            Add_item_View(myGroupData: myGroup)
        }
    }
}
