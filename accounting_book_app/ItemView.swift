//
//  ItemView.swift
//  accounting_book_app
//
//  Created by 張丞嘉 on 2022/8/22.
//

import SwiftUI

struct ItemView: View {
    @State var myGroupData: group
    @State var myItemData: item
//    @State var peoplePay: [Int:Int]
    @State var peoplePay: [Int]
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            HStack {
                Text("Item")
                Text(myItemData.iname)
            }
            Spacer()
            
            VStack{
                List{
                    ForEach (0..<myItemData.peoplePayDict.count, id: \.self) { index in
                        HStack{
                            Text(group.getPeopleName(pid: item.getPeopleId(myItem: myItemData, pos: index), myGroup: myGroupData)!)
                            Text("Pay")
                            TextField("0", value: $peoplePay[index], formatter: NumberFormatter())
                        }
                    }
                }.padding()
//                List{
//                    ForEach(myItemData.peoplePayDict.sorted(by: >), id: \.key) { pid, pay in
//                        HStack{
//                            Text(group.getPeopleName(pid: pid, myGroup: myGroupData)!)
//                            Text("Pay")
//                            TextField("0", value: $peoplePay[pid], formatter: NumberFormatter())
//                        }
//                    }
//                }.padding()
            }
            
            HStack {
                Button("OK") {
                    var index: Int = 0
                    for pay in (peoplePay) {
                        //myItemData.peoplePayDict[item.getPeopleId(myItem: myItemData, pos: index)] = pay
                        item.setPeoplePayDict(myItem: myGroupData.item_list[0], pid: item.getPeopleId(myItem: myItemData, pos: index), pPay: pay)
                        index += 1
                    }
//                    myItemData.peoplePayDict = peoplePay
                    
                    index = 0
                    print("PCount: \(myItemData.peoplePayDict.count)")
                    for _ in (peoplePay) {
                        //print("A\(pay)")
                        print("\(myItemData.peoplePayDict[item.getPeopleId(myItem: myItemData, pos: index)])")
                        index += 1
                    }
                    
                    
                    dismiss()
                }.padding()
                Button("Cancel") {
                    dismiss()
                }.padding()
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
