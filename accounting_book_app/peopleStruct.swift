//
//  peopleStruct.swift
//  accounting_book_app
//
//  Created by 張丞嘉 on 2022/8/22.
//
  
import Foundation
 
class people {
    @Published var pid: Int
    @Published var name: String
    @Published var payMoney: Int
    
    init(pid: Int, name: String, payMoney: Int) {
        self.pid = pid
        self.name = name
        self.payMoney = payMoney
    }
}
