//
//  ContentView.swift
//  Shared
//
//  Created by Willy on 2022/7/25.
//

import SwiftUI

    
struct Home: View {
    @State private var showAdd = false
//    @State var p: [people] = [people(pid: 0, name: "willy", payMoney: 100), people(pid: 1, name: "arthur", payMoney: 200), people(pid: 2, name: "richard", payMoney: 300), people(pid: 3, name: "zzzz", payMoney: 0)]
//    @State var i1: item = item(iid: 0, iname: "play", itemMoney: 500, inItemPeople: [], inItemPeoplePay: [])
//    @State var i2: item = item(iid: 1, iname: "house", itemMoney: 600, inItemPeople: [], inItemPeoplePay: [])
//    @State var i3: item = item(iid: 2, iname: "taxi", itemMoney: 400, inItemPeople: [], inItemPeoplePay: [])
//    @State var GroupList: [Group] = [Group(gname: "group1", gid: 0, people_list: [p[0], p[2]], item_list: [i1,i2])]
    @State var GroupList: [group]
        
    
//    let GroupList: Group
//    print(GroupList.member)
//    var GroupList: [Group] = group
    var body: some View {
        
        NavigationView{
            ZStack{
                VStack {
                    Button(action: {showAdd = true}){
                        Text("+")
                            .font(.system(size: 30, weight: .heavy))
                            
                    }
                    .statusBar(hidden: true)
                    .frame(width: 300, height: 30, alignment: .topLeading)
                    Spacer()
                    Spacer()
                    List{
                        ForEach(0 ..< GroupList.count, id: \.self) { idx in
                            HStack{
                                Spacer()
                                NavigationLink(
                                    destination: groupView(Group: GroupList[idx]),
                                    label: {Text(GroupList[idx].gname)}
                                )
                            }
                        }
                        .onDelete(perform: deleteGroup)
                        .onMove(perform: moveGroup)
                    }
                    .navigationTitle("Groups")
                    .navigationBarItems(trailing: EditButton())

                }
                addGroup(isShowing: $showAdd)
            }
        }
        
    }
    func deleteGroup(at offsets: IndexSet) {
        GroupList.remove(atOffsets: offsets)
    }
    func moveGroup(from source: IndexSet, to destination: Int) {
        GroupList.move(fromOffsets: source, toOffset: destination)
    }
}
//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        Home()
//    }
//}
