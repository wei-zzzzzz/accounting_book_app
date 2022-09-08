//
//  FirstView.swift
//  accounting_book_app
//
//  Created by 張丞嘉 on 2022/8/14.
//

import SwiftUI


struct FirstView: View {
    @State private var showAlert = false
    @State var firstOpen = userData.readFile()
    @State var userName = ""
    
    var body: some View {
        if (firstOpen == nil) {
            VStack() {
                HStack(alignment: .center) {
                    Text("Name:")
                        .padding()
                    TextField("Input Your name", text: $userName)
                        .padding()
                }.fixedSize()
                Button("OK") {
                    if (userName == "") {
                        showAlert = true
                    }
                    else {
                        let udata = userData(pid: 0, name: userName, gidList: [])
                        userData.saveFile(userDataFile: udata)
                        firstOpen = userData.readFile()
                    }
                }.alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Error"),
                        message: Text("Please Input Your Name")
                    )
                }
            }
        }
        else {
            //ItemView(myItemData: myItem)
            Home(GroupList: [
                group(gname: "group1", gid: 0, people_list: [people(pid: 0, name: "willy", payMoney: 100), people(pid: 1, name: "arthur", payMoney: 200), people(pid: 3, name: "richard", payMoney: 300)], item_list: [item(iid: 0, iname: "play", itemMoney: 500, peoplePayDict: [:]), item(iid: 2, iname: "taxi", itemMoney: 400, peoplePayDict: [:])]),
                group(gname: "group2", gid: 0, people_list: [people(pid: 0, name: "willy", payMoney: 100), people(pid: 1, name: "richard", payMoney: 100), people(pid: 0, name: "zzz", payMoney: 0)], item_list: [item(iid: 1, iname: "play", itemMoney: 500, peoplePayDict: [:]), item(iid: 3 ,iname: "house", itemMoney: 600, peoplePayDict: [:])])
                ])
        }
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
