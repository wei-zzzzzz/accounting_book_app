//
//  groupFullView.swift
//  accounting_book_app
//
//  Created by 張丞嘉 on 2022/10/15.
//

import SwiftUI


struct cellButtonView: View {
    @ObservedObject var Item: item
    @ObservedObject var Groups: group

    @State private var showingSheet = false
    var body: some View{
        Button(
            action: {
                showingSheet.toggle()
            },
            label: {
                Text(Item.iname).padding()
            }
        ).sheet(isPresented: $showingSheet) {
            ItemView(
                myGroupData:    Groups,
                myItemData:     Item,
                peoplePay:      item.getEachPeoplePay(myItem: Item)
            )
        }
    }
}

struct groupFullView: View {
    @ObservedObject var myUserDatas: userData
    @ObservedObject var Group: group
    
    var body: some View {
        VStack {
            List {
                ForEach(Group.item_list, id: \.iid) { item in
                    cellButtonView(Item: item, Groups: Group)
                }
                .onDelete(perform: deleteItem)
                //.onMove(perform: moveItem)
            }
            .toolbar { EditButton() }
            .listStyle(GroupedListStyle())
            .navigationTitle(Text(Group.gname))
            
            
            groupBottomView(Group: Group).frame(alignment: .bottom)
        }
    }
    
    func deleteItem(at offsets: IndexSet) {
        //Group.item_list.remove(atOffsets: offsets)
        group.removeItem(myGroup: Group, Item: Group.item_list[offsets.first!])
    }
//    func moveItem(from source: IndexSet, to destination: Int) {
//        Group.item_list.move(fromOffsets: source, toOffset: destination)
//    }
}

//struct groupFullView_Previews: PreviewProvider {
//    static var previews: some View {
//        groupFullView()
//    }
//}
