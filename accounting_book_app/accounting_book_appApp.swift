//
//  accounting_book_appApp.swift
//  accounting_book_app
//
//  Created by 張丞嘉 on 2022/9/1.
//

import SwiftUI

@main
struct accounting_book_appApp: App {
    // for test
     var p1: people
     var p2: people
     var p3: people
     var p4: people
     var myItem: item
    var pPay: [Int:Int]
     var myGroup: group
     
     init() {
         self.p1 = people(pid: 1, name: "A", payMoney: 0)
         self.p2 = people(pid: 2, name: "B", payMoney: 0)
         self.p3 = people(pid: 3, name: "C", payMoney: 0)
         self.p4 = people(pid: 4, name: "D", payMoney: 0)
         
         self.myItem = item(iid: 123,
                            iname: "測試",
                            itemMoney: 100,
                            //inItemPeople: [1, 2, 3],
                            peoplePayDict: [1: 10, 2:10, 3:80])
         self.pPay = myItem.peoplePayDict
         self.myGroup = group(gname: "my",
                              gid: 1,
                              people_list: [],
                              item_list: [])
   
     }
    var body: some Scene {
        WindowGroup {
            initPage()
//            ItemView(myGroupData: myGroup, myItemData: myItem, peoplePay: pPay)
        }
    }
}
