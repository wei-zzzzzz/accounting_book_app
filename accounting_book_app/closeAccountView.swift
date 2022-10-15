//
//  closeAccountView.swift
//  accounting_book_app
//
//  Created by 張丞嘉 on 2022/10/15.
//

import SwiftUI

struct closeAccountView: View {
    @State var Groups: group
    @State var accounts: [account]

    @Environment(\.dismiss) var dismiss
    var body: some View{
        VStack {
            List{
                ForEach(0..<accounts.count, id: \.self) { idx in
                    ForEach(accounts[idx].receive.sorted(by: >), id: \.key) { key, value in
                        HStack {
                            Text(
                                group.getPeopleName(pid: accounts[idx].payPid, myGroup: Groups)!
                            )
                            Text("pay")
                            Text(String(value))
                            Text("to")
                            Text(
                                group.getPeopleName(pid: key, myGroup: Groups)!
                            )
                        }
                    }
                }
            }
            
            HStack {
                Button("OK") {
                    // mark group has closed code
                    
                    dismiss()
                }.padding()
                Button("Cancel") {
                    dismiss()
                }.padding()
            }
        }
    }
}

//struct closeAccountView_Previews: PreviewProvider {
//    static var previews: some View {
//        closeAccountView()
//    }
//}
