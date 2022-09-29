//
//  addGroup.swift
//  tt (iOS)
//
//  Created by Willy on 2022/8/15.
//

import SwiftUI

struct addGroup: View {
    @Binding var isShowing: Bool
    var body: some View {
        ZStack(alignment: .bottom){
            if isShowing{
                Color.black
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture{
                isShowing = false
                    }
                showAdd
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        //.animation(.easeInOut)
    }
    var showAdd: some View{
        VStack{
            ZStack{
                VStack{
                    Text("Enter new group name")
                    Text("hey")
                }
                
            }
            
        }
        .background(Color.blue)
        .frame(height: UIScreen.main.bounds.height*0.7)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .transition(.move(edge: .bottom))
    }
    

}
//struct addGroup_Previews: PreviewProvider {
//    static var previews: some View {
//        addGroup(isShowing: .constant(true))
//    }
//}


