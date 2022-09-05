//
//  home.swift
//  tt (iOS)
//
//  Created by Willy on 2022/8/11.
//

import SwiftUI

struct groupView: View {
//    var ItemList: [String]=["food","play","train"]
    @State var Group: group
    @State var showAddMember = false
    @State var showMember_flag = false
    @State var modify_flag = false
    @State private var delete_flag = false
    var body: some View{
        ZStack{
            VStack{
                HStack{
                    Spacer()
                    Button(
                        action: {showAddMember = true},
                        label: {
                            HStack{Text("add member");Image(systemName: "person.badge.plus")}
                        }
                    )
                    .padding()
                }
                
                Spacer()
                Text(self.Group.gname)
                Spacer()
                
                ForEach(0 ..< self.Group.item_list.count, id: \.self) { idx in
                    HStack{
                        Spacer()
                        Text(self.Group.item_list[idx].iname)
                            .padding(10)
                        Text("\(self.Group.item_list[idx].itemMoney)")
                        if modify_flag{
                            Button(
                                action: {delete_flag = true},
                                label:{Image(systemName: "trash")}
                            )
                            .alert(isPresented: $delete_flag) {
                                Alert(
                                    title: Text("Are you sure want to delete the item : \(self.Group.item_list[idx].iname)"),
                                    primaryButton: .default(
                                        Text("No"),
                                        action: {delete_flag = false}
                                    ),
                                    secondaryButton: .destructive(
                                        Text("Delete"),
                                        action: {group.removeItem(myGroup: &self.Group, Item: self.Group.item_list[idx])}
                                    )
                                )
                            }
                        }
                        Spacer()
                        }
                    .font(.caption)
                    .background(Color.red)
                    }
                Spacer()
                HStack{
                    Spacer()
                    Button("add item"){}
                    Spacer()
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
                        Text("\(self.Group.gid)")
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
//        .ignoresSafeArea()
        .animation(.easeInOut)
        
    }
    var showMember: some View{
        ZStack{
            Color.blue
                .frame(width: UIScreen.main.bounds.width*0.6, height: UIScreen.main.bounds.height*0.3)
                .frame(maxWidth: .infinity)
            VStack{
                HStack{
                    ForEach(0 ..< self.Group.people_list.count, id: \.self) { idx in
                        Text(self.Group.people_list[idx].name)
                            .font(.system(size: 20, weight: .light, design: .serif))
                    }
                }
                
            }
        }
        .transition(.move(edge: .bottom))
    }
}
//
//struct groupView_Previews: PreviewProvider {
//    static var previews: some View {
//        groupView(group: Group)
//    }
//}
