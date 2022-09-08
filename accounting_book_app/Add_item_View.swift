//
//  Add_item_View.swift
//  count
//
//  Created by RicHard Liao on 2022/9/1.
//

import SwiftUI

struct Add_item_View: View {
    
    
    @State var myGroupData: group
    @State var itemName = ""
    @State var itemPrice = 0
    
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
            }
            
            VStack(){
                
                Text("平分的人：")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .padding(.bottom, 0.0)
                    
                    
                List{
                    ForEach(0 ..< self.myGroupData.people_list.count, id: \.self) { idx in
                        Text(self.myGroupData.people_list[idx].name)
                            .font(.system(size: 20, weight: .light, design: .serif))
                        
                    }
                }.padding()
                
                HStack(alignment: .center, spacing: 32.0){
                    Button("ok"){
                        if (itemName != "") {
                            var newitem : item
                            newitem=item.init(iid: 0, iname: itemName, itemMoney: 0, peoplePayDict: [:])
                            item.additemMoney(myItem: &newitem, money: itemPrice)
                            group.addItem(myGroup: &myGroupData, addItem: newitem)
                            
                            print(myGroupData.item_list[0].iname)
                            print(myGroupData.item_list[0].itemMoney)
                    }
                    Button("Cancel"){
                        
                    }
                }
            }
            
            
            
        }
    }
}

//struct Add_item_View_Previews: PreviewProvider {
//    static var previews: some View {
//        Add_item_View()
//    }
//}
