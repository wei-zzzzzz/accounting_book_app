//
//  ContentView.swift
//  Shared
//
//  Created by Willy on 2022/7/25.
//
// topTrailing
import SwiftUI

    
struct Home: View {
    @ObservedObject var myUserDatas: userData
    
    @State private var showAddGroup = false
    var body: some View {
        NavigationView{
            ZStack{
                VStack {
                    Button(
                        action: {
                            showAddGroup.toggle()
                        }
                    ){
                        Text("+")
                            .font(.system(size: 30, weight: .heavy))
                        
                    }
                    .statusBar(hidden: true)
                    .frame(width: 300, height: 30, alignment: .topLeading)
                    .sheet(isPresented: $showAddGroup) {
                        addGroupView(myUserDatas: myUserDatas)
                    }
                    Spacer()
                    Spacer()
                    
                    let GroupList: [group] = myUserDatas.gidList
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
                    }
                }
                //addGroup(isShowing: $showAdd)
            }
        }
    }
}
//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        Home()
//    }
//}
