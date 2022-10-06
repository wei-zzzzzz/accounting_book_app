//
//  addGroupView.swift
//  accounting_book_app
//
//  Created by 張丞嘉 on 2022/10/1.
//

import SwiftUI

struct addGroupView: View {
    @State var myUserDatas: userData
    
    @Environment(\.dismiss) var dismiss
    @State var NewGroupName = ""
    var body: some View {
        VStack{
            Text("Input New Group Name")
                .padding()
            TextField("Input New Group Name", text: $NewGroupName)
                .padding()
            HStack {
                Button("OK") {
                    let selfPeople = people.init(pid: 0, name: myUserDatas.name, payMoney: 0)
                    
                    let newGroup = group.init(gname: NewGroupName, gid: myUserDatas.gidList.count, people_list: [selfPeople], item_list: [])
                    
                    myUserDatas.gidList.append(newGroup)
                    
                    userData.saveFile(userDataFile: myUserDatas)
                    
                    dismiss()
                }.padding()
                Button("Cancel") {
                    dismiss()
                }.padding()
            }
            
        }.fixedSize()
    }
}

//struct addGroupView_Previews: PreviewProvider {
//    static var previews: some View {
//        addGroupView()
//    }
//}
