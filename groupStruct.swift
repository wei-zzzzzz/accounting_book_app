//
//  groupStruct.swift
//  tt (iOS)
//
//  Created by Willy on 2022/8/26.
//

import Foundation

struct group {
    var gname: String
    var gid: Int
    var people_list: [people]
    var item_list: [item]
    
    static func addPeople(myGroup: inout group, addPeople: people) {
        myGroup.people_list.append(addPeople)
    }
    
    static func addItem(myGroup: inout group, Item: item) {
        myGroup.item_list.append(Item)
    }
    
    static func getPeopleName(pid: Int, myGroup: group) -> String? {
        for index in (0..<myGroup.people_list.count) {
            if (myGroup.people_list[index].pid == pid) {
                return myGroup.people_list[index].name
            }
        }
        return nil
    }
    
    static func removeItem(myGroup: inout group, Item: item) {
        let idx = myGroup.item_list.firstIndex(where: {$0.iid == Item.iid})
        myGroup.item_list.remove(at: idx!)
    }
}


