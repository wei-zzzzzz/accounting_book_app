//
//  initPage.swift
//  tt (iOS)
//
//  Created by Willy on 2022/8/23.
//

import SwiftUI

struct initPage: View {
    @State private var username = ""
    @State private var firstOpen = userData.readFile()

    var body: some View {
        if firstOpen == nil{
            VStack(){
                Text("Welcome !!")
                    .font(.largeTitle)
                    .padding()
                Text("please enter your name")
                HStack{
                    Spacer()
                    TextField("請輸入你的名字", text: $username, prompt: Text("你的名字"))
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 200)
                    Spacer()
                }
                Button("ok"){
                    if username != ""{
                        userData.saveFile(userDataFile: userData(pid: 0, name: username, gidList: []))
                        firstOpen = userData.readFile()
                    }
                }
            }
        }
        else{
            Home(GroupList: [
                group(gname: "group1", gid: 0, people_list: [people(pid: 0, name: "willy", payMoney: 100), people(pid: 1, name: "arthur", payMoney: 200), people(pid: 3, name: "richard", payMoney: 300)], item_list: [item(iid: 0, iname: "play", itemMoney: 500, peoplePayDict: [:]), item(iid: 2, iname: "taxi", itemMoney: 400, peoplePayDict: [:])]),
                group(gname: "group2", gid: 0, people_list: [people(pid: 0, name: "willy", payMoney: 100), people(pid: 1, name: "richard", payMoney: 100), people(pid: 0, name: "zzz", payMoney: 0)], item_list: [item(iid: 1, iname: "play", itemMoney: 500, peoplePayDict: [:]), item(iid: 3 ,iname: "house", itemMoney: 600, peoplePayDict: [:])])
                ])
        }
    }
}

//struct initPage_Previews: PreviewProvider {
//    static var previews: some View {
//        initPage()
//    }
//}
