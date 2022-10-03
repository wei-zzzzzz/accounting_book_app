//
//  home.swift
//  tt (iOS)
//
//  Created by Willy on 2022/8/11.
//

import SwiftUI

struct cellButtonView: View {
    @State var idx: Int
    @State var Groups: group

    @State private var showingSheet = false
    var body: some View{
        Button(
            action: {
                showingSheet.toggle()
            },
            label: {
                Text(Groups.item_list[idx].iname).padding(10)
            }
        ).sheet(isPresented: $showingSheet) {
            ItemView(
                myGroupData:    Groups,
                myItemData:     Groups.item_list[idx],
                peoplePay:      item.getEachPeoplePay(myItem: Groups.item_list[idx])
            )
        }
    }
}

struct groupView: View {
    @ObservedObject var Group: group
    @State var showAddMember = false
    @State var showMember_flag = false
    @State var modify_flag = false
    @State private var delete_flag = false
    
    @State private var showingSheet = false
    @State private var showAddPeople = false
    var body: some View{
        ZStack{
            VStack{
                HStack{
                    Spacer()
                    Button(
                        action: {
                            showAddPeople.toggle()
                        },
                        label: {
                            HStack{
                                Text("add member");
                                Image(systemName: "person.badge.plus")
                            }
                        }
                    )
                    .padding()
                    .sheet(isPresented: $showAddPeople) {
                        addPeopleView(myGroup: Group)
                    }
                }
                
                Spacer()
                Text(Group.gname)
                Spacer()
                List{
                    ForEach(0 ..< Group.item_list.count, id: \.self) { idx in
                        HStack{
                            Spacer()
                            cellButtonView(idx: idx, Groups: Group)
                            if modify_flag{
                                Button(
                                    action: {delete_flag = true},
                                    label:{Image(systemName: "trash")}
                                )
                                .alert(isPresented: $delete_flag) {
                                    Alert(
                                        title: Text("Are you sure want to delete the item : \(Group.item_list[idx].iname)"),
                                        primaryButton: .default(
                                            Text("No"),
                                            action: {delete_flag = false}
                                        ),
                                        secondaryButton: .destructive(
                                            Text("Delete"),
                                            action: {
                                                group.removeItem(myGroup: Group, Item: Group.item_list[idx])
                                                
                                            }
                                        )
                                    )
                                }
                            }
                            Spacer()
                        }
                        .font(.caption)
                        .background(Color.red)
                    }
                }
                Spacer()
                HStack{
                    Spacer()
                    Button("add item"){
                        showingSheet.toggle()
                    }
                    .sheet(isPresented: $showingSheet) {
                        let isSelectAry = [Bool](repeating: false, count: Group.people_list.count)
                        addItemView(myGroupData: Group, isSelectPeople: isSelectAry)
                    }
                    
                    if modify_flag{
                        Button("done"){modify_flag = false}
                    }
                    else{
                        Button("modify"){modify_flag = true}
                    }
                    
                    Spacer()
                } .foregroundColor(Color.yellow)
                Spacer()
                Button(
                    action: {showMember_flag = true},
                    label: {
                        HStack{
                            Text("member")
                            Image(systemName: "person.3")
                        }
                    }
                )
                Spacer()
            }
            if showAddMember{
                Color.black
                .opacity(0.3)
                .onTapGesture{
                    showAddMember = false
                    }
                .ignoresSafeArea()
                ZStack {
                    Color.blue.frame(height: 250)
                    .frame(maxWidth: .infinity)
                    VStack{
                        Text("This group ID:")
                        Text("\(Group.gid)")
                    }
                    
                }
            }
            if showMember_flag{
                Color.black
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture{
                        showMember_flag = false
                    }
                showMember
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        //.animation(.easeInOut)
    }
    var showMember: some View{
        ZStack{
            Color.blue
                .frame(width: UIScreen.main.bounds.width*0.6, height: UIScreen.main.bounds.height*0.3)
                .frame(maxWidth: .infinity)
            VStack{
                HStack{
                    ForEach(0 ..< Group.people_list.count, id: \.self) { idx in
                        Text(Group.people_list[idx].name)
                            .font(.system(size: 20, weight: .light, design: .serif))
                    }
                }
                
            }
        }
        .transition(.move(edge: .bottom))
    }
    
    func isModify(flag: inout Bool) {
        flag = false
    }
}
//
//struct groupView_Previews: PreviewProvider {
//    static var previews: some View {
//        groupView(group: Group)
//    }
//}
