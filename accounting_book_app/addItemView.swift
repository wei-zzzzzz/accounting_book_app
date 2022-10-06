//
//  addItemView.swift
//  accounting_book_app
//
//  Created by 張丞嘉 on 2022/9/29.
//

import SwiftUI

struct addItemView: View {
    @State var myGroupData: group
    @State var isSelectPeople: [Bool]
    
    @State var itemName = ""
    @State var totalPay = 0

    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            Text("New Item Name").padding()
            TextField("Input Item Name", text: $itemName).padding()
            
            Text("Total Pay").padding()
            TextField("0", value: $totalPay, formatter: NumberFormatter()).padding()
            
            Text("Select People").padding()
            
            List {
                ForEach(0..<myGroupData.people_list.count, id: \.self) { idx in
                    Toggle(myGroupData.people_list[idx].name, isOn: $isSelectPeople[idx])
                }
            }.padding()

            HStack {
                Button("OK") {
                    let newItem = item.init(iid: myGroupData.item_list.count, iname: itemName, itemMoney: totalPay, peoplePayDict: [:])
                    var addPid = 0
                    var idx = 0
                    
                    for SelectVal in isSelectPeople {
                        if (SelectVal) {
                            addPid = myGroupData.people_list[idx].pid
                            item.setPeoplePayDict(myItem: newItem, pid: addPid, pPay: 0)
                        }
                        idx += 1
                    }
                    group.addItem(myGroup: myGroupData, addItem: newItem)
                    dismiss()
                }
                .padding()
                
                Button("Cancel") {
                    dismiss()
                }.padding()
            }.fixedSize()
        }
    }
}

//struct addItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        addItemView()
//    }
//}
