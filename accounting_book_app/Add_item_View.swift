//
//  Add_item_View.swift
//  count
//
//  Created by RicHard Liao on 2022/9/1.
//

import SwiftUI

struct Add_item_View: View {
    
    
    @State var myGroupData: group
    @State var isIn: [Bool]
    @State var itemName = ""
    @State var itemPrice = 0
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
            VStack(alignment: .center) {
                
                Text("項目名：")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                    .padding(0.0)
                    
                TextField("Input item name", text: $itemName).padding()
                Text("價錢：")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                    .padding(0.0)
                HStack(alignment: .center){
                    TextField("How much", value: $itemPrice, formatter: NumberFormatter())
                }.fixedSize()
                Text("平分的人：")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .padding(.bottom, 0.0)
                    
                    
                List{
                    ForEach(0 ..< myGroupData.people_list.count, id: \.self) { idx in
                        Toggle(myGroupData.people_list[idx].name, isOn: $isIn[idx])
                        .font(.system(size: 20, weight: .light, design: .serif))
                        
                    }
                }.padding()
                
                HStack(alignment: .center, spacing: 32.0){
                    Button("ok"){
                        if (itemName != "") {
                            var newitem : item
                            newitem=item.init(iid: 6, iname: itemName, itemMoney: 0, peoplePayDict: [:])
                            item.additemMoney(myItem: &newitem, money: itemPrice)
                            group.addItem(myGroup: &myGroupData, addItem: newitem)
                            dismiss()
                        }
                    }
                    Button("Cancel"){
                        dismiss()
                    }
                    
            }
                
            
            
//            VStack(){
//
//
//            }
            
            
            
        }
    }
}
