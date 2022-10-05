//
//  ItemView.swift
//  accounting_book_app
//
//  Created by 張丞嘉 on 2022/8/22.
//

import SwiftUI

//protocol GetData : class {
//    func  receiveData(myItemData: item)
//}

struct ItemView: View {
    @State var myGroupData: group
    @State var myItemData: item
    @State var peoplePay: [Int:Int]
    @State private var save_flag = false
    
    @Environment(\.dismiss) var dismiss
//    @State var peoplePay = item.getEachPeoplePay(myItem: self.myItemData)
    
    var body: some View {
        VStack {
            HStack {
                Text("Item")
                Text(myItemData.iname)
            }
            Spacer()

            VStack{
                List{
                    ForEach(myItemData.peoplePayDict.sorted(by: >), id: \.key) { pid, pay in
                        HStack{
                            Text(group.getPeopleName(pid: pid, myGroup: myGroupData)!)
                            Text("Pay")
                            TextField("0", value: $peoplePay[pid], format: .number, prompt: Text("0"))
                                .keyboardType(.numberPad)
                        }
                    }
                }.padding()
            }

            HStack {
                Button("Save") {
                    print(peoplePay)
                    print(myItemData.peoplePayDict)
                    myItemData.peoplePayDict = peoplePay
                    print(myItemData.peoplePayDict)
                    dismiss()
//                    save_flag = true
                    
//                    self.presentationMode.wrappedValue.dismiss()
                }.padding()
//                .alert(isPresented: $save_flag) {
//                    Alert(
//                        title: Text("saved")
//                    )
//                }

            }
            Spacer()
        }
    }
    
    
}

//struct ItemView_Previews: PreviewProvider {
////    let p1: people = people(pid: 1, name: "A", payMoney: 0)
////    @State var p2: people = people(pid: 2, name: "B", payMoney: 0)
////    @State var p3: people = people(pid: 3, name: "C", payMoney: 0)
//
//    static var myItem: item = item(iid: 123,
//                                   iname: "設",
//                                   itemMoney: 100,
//                                   inItemPeople: [1, 2, 3],
//                                   peoplePayDict: [1: 10, 2:10, 3:80])
//
//    static var myGroup: group = group(gname: "my",
//                               gid: 1,
//                               people_list: [people(pid: 1, name: "A", payMoney: 0),
//                                             people(pid: 2, name: "B", payMoney: 0),
//                                             people(pid: 3, name: "C", payMoney: 0)],
//                               item_list: [item(iid: 123,
//                                                iname: "設",
//                                                itemMoney: 100,
//                                                inItemPeople: [1, 2, 3],
//                                                peoplePayDict: [1: 10, 2:10, 3:80])])
//
//
//
//
//
//
//
//    static var previews: some View {
//
//        ItemView(myGroupData: myGroup, myItemData: myItem)
//    }
//}
