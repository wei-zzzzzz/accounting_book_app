//
//  ContentView.swift
//  Shared
//
//  Created by Willy on 2022/7/25.
//

import SwiftUI

    
struct Home: View {
    @State private var showAdd = false
    @State var GroupList: [group]

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
                    }
                }
                addGroup(isShowing: $showAdd)
            }
        }
    }
}
//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        Home()
//    }
//}
