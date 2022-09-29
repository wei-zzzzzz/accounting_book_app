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
            var p1 = people.init(pid: 0, name: "willy", payMoney: 0)
            var p2 = people.init(pid: 1, name: "arthur", payMoney: 0)
            var p3 = people.init(pid: 2, name: "richard", payMoney: 0)
            
            var i2 = item.init(iid: 0, iname: "play", itemMoney: 300, peoplePayDict: [0:100, 1:10, 2:30])
            var i1 = item.init(iid: 1, iname: "play11", itemMoney: 300, peoplePayDict: [2:100, 1:10])
            var i3 = item.init(iid: 2, iname: "play121", itemMoney: 300, peoplePayDict: [1:100])
            
            var g1 = group.init(gname: "group1", gid: 0, people_list: [p1, p2, p3], item_list: [i1, i2])
            var g2 = group.init(gname: "group2", gid: 1, people_list: [p1, p2], item_list: [i3])
            
            Home(GroupList: [g1, g2])
        }
    }
}

//struct FirstView_Previews: PreviewProvider {
//    static var previews: some View {
//        FirstView()
//    }
//}
