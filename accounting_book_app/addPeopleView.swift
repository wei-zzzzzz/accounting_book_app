//
//  addPeopleView.swift
//  accounting_book_app
//
//  Created by 張丞嘉 on 2022/10/3.
//

import SwiftUI

struct addPeopleView: View {
    @State var myGroup: group
    
    @Environment(\.dismiss) var dismiss
    @State var NewPeopleName = ""
    var body: some View {
        VStack{
            Text("Input People Name")
                .padding()
            TextField("Input People Name", text: $NewPeopleName)
                .padding()
            HStack {
                Button("OK") {
                    let newPeople = people.init(pid: myGroup.people_list.count, name: NewPeopleName, payMoney: 0)
                    
                    group.addPeople(myGroup: myGroup, addPeople: newPeople)
                    dismiss()
                }.padding()
                Button("Cancel") {
                    dismiss()
                }.padding()
            }
            
        }.fixedSize()
    }
}

//struct addPeopleView_Previews: PreviewProvider {
//    static var previews: some View {
//        addPeopleView()
//    }
//}
