//
//  groupStruct.swift
//  accounting_book_app
//
//  Created by 張丞嘉 on 2022/8/23.
//

import Foundation

class group {
    var gname: String
    var gid: Int
    var people_list: [people]
    var item_list: [item]
    
    init() {
        self.gname = ""
        self.gid = 0
        self.people_list = []
        self.item_list = []
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
    
    static func addItem(myGroup: inout group, addItem: item) {
        myGroup.item_list.append(addItem)
    }
    
    static func getPeopleName(pid: Int, myGroup: group) -> String? {
        for index in (0..<myGroup.people_list.count) {
            if (myGroup.people_list[index].pid == pid) {
                return myGroup.people_list[index].name
            }
        }
        return nil
    }
}
