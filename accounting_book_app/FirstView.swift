//
//  FirstView.swift
//  accounting_book_app
//
//  Created by 張丞嘉 on 2022/8/14.
//

import SwiftUI


struct FirstView: View {
    @State private var showAlert = false
    @State var firstOpen = userData.readFile()
    @State var userName = ""
    
    var body: some View {
        if (firstOpen == nil) {
            VStack() {
                HStack(alignment: .center) {
                    Text("Name:")
                        .padding()
                    TextField("Input Your name", text: $userName)
                        .padding()
                }.fixedSize()
                Button("OK") {
                    if (userName == "") {
                        showAlert = true
                    }
                    else {
                        let udata = userData(pid: 0, gidList: [], name: userName)
                        userData.saveFile(userDataFile: udata)
                        firstOpen = userData.readFile()
                    }
                }.alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Error"),
                        message: Text("Please Input Your Name")
                    )
                }
            }
        }
        else {
            //ItemView(myItemData: myItem)
            home()
        }
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
