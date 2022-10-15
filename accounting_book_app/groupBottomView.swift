//
//  groupBottomView.swift
//  accounting_book_app
//
//  Created by 張丞嘉 on 2022/10/15.
//

import SwiftUI



struct showMemberView: View {
    @State var Groups: group

    @Environment(\.dismiss) var dismiss
    var body: some View{
        VStack{
            List {
                ForEach(0 ..< Groups.people_list.count, id: \.self) { idx in
                    Text(Groups.people_list[idx].name)
                        .font(.system(size: 20, weight: .light, design: .serif))
                }
            }.padding()
            
            Button("OK") {
                dismiss()
            }
        }
    }
}

struct groupBottomView: View {
    @ObservedObject var Group: group
    
    @State private var showingAddItem = false
    @State private var showAddPeople = false
    @State private var showMember = false
    @State private var closeAccount = false
    
    var body: some View {
        VStack {
            HStack {
                Button("Add Item"){
                    // for test
                    //printItem(Group: Group)
                    showingAddItem.toggle()
                }
                .padding()
                .sheet(isPresented: $showingAddItem) {
                    let isSelectAry = [Bool](repeating: false, count: Group.people_list.count)
                    addItemView(myGroupData: Group, isSelectPeople: isSelectAry)
                }
                
                Button(
                    action: {
                        showAddPeople.toggle()
                    },
                    label: {
                        Text("Add Member")
                        Image(systemName: "person.badge.plus")
                    }
                )
                .padding()
                .sheet(isPresented: $showAddPeople) {
                    addPeopleView(myGroup: Group)
                }
            }
            
            HStack{
                Button(
                    action: {
                        showMember.toggle()
                    },
                    label: {
                        HStack{
                            Text("member")
                            Image(systemName: "person.3")
                        }
                    }
                )
                .padding()
                .sheet(isPresented: $showMember) {
                    showMemberView(Groups: Group)
                }
                
                Button(
                    action: {
                        closeAccount.toggle()
                    },
                    label: {
                        Text("Close Account")
                    }
                )
                .padding()
                .sheet(isPresented: $closeAccount){
                    closeAccountView(Groups: Group, accounts: group.closeAccount(myGroup: Group))
                }
            }
        }
    }
    
    // for test
    func printItem(Group: group) {
        for item in Group.item_list {
            print(item.iid)
            print(item.iname)
        }
        
        print("\n")
    }
}

//struct groupBottomView_Previews: PreviewProvider {
//    static var previews: some View {
//        groupBottomView()
//    }
//}
