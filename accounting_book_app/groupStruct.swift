//
//  groupStruct.swift
//  accounting_book_app
//
//  Created by 張丞嘉 on 2022/8/23.
//

import Foundation

class group: ObservableObject {
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
    
    static func IsPeopleInGroup(myGroup: group, pid: Int) -> Bool {
        for id in myGroup.people_list {
            if (id.pid == pid) {
                return true
            }
        }
        return false
    }
    
    static func addPeople(myGroup: inout group, addPeople: people) {
        if (!IsPeopleInGroup(myGroup: myGroup, pid: addPeople.pid)) {
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
        myGroup.item_list.append(addItem)
    }
    
    static func removeItem(myGroup: group, Item: item) {
        let idx = myGroup.item_list.firstIndex(where: {$0.iid == Item.iid})
        myGroup.item_list.remove(at: idx!)
    }
}
