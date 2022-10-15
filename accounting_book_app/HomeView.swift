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
                
            
                
                List{
                    ForEach(0 ..< myUserDatas.gidList.count, id: \.self) { idx in
                        HStack{
                            Spacer()
                            NavigationLink(
                                destination: groupView(myUserDatas: myUserDatas, Group: myUserDatas.gidList[idx]),
                                //destination: groupFullView(myUserDatas: myUserDatas, Group: myUserDatas.gidList[idx]),
                                label: {Text(myUserDatas.gidList[idx].gname)}
                            )
                        }
                    }
                    .onDelete(perform: deleteGroup)
                    .onMove(perform: moveGroup)
                }
                .toolbar { EditButton() }
                .navigationTitle(Text("Groups"))
                //.navigationBarItems(trailing: EditButton())
                
            }
        }
    }
    
    func deleteGroup(at offsets: IndexSet) {
        myUserDatas.gidList.remove(atOffsets: offsets)
        userData.saveFile(userDataFile: myUserDatas)
    }
    func moveGroup(from source: IndexSet, to destination: Int) {
        myUserDatas.gidList.move(fromOffsets: source, toOffset: destination)
        userData.saveFile(userDataFile: myUserDatas)
    }
}
//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        Home()
//    }
//}
