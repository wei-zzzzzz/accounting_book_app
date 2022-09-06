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
    @State var peoplePay: [Int]
    
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
                            Text(group.getPeopleName(pid: myItemData.inItemPeople[index], myGroup: myGroupData)!)
                            Text("Pay")
                            TextField("0", value: $peoplePay[index], formatter: NumberFormatter())
                        }
                    }
                }.padding()
            }
            
            HStack {
                Button("OK") {
                    var index: Int = 0
                    for pay in (peoplePay) {
                        myItemData.peoplePayDict[myItemData.inItemPeople[index]] = pay
                        index += 1
                    }

//                    index = 0
//                    print("PCount: \(myItemData.peoplePayDict.count)")
//                    for _ in (peoplePay) {
//                        //print("A\(pay)")
//                        print("\(myItemData.peoplePayDict[myItemData.inItemPeople[index]])")
//                        index += 1
//                    }
                    
                }.padding()
                Button("Cancel") {

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
