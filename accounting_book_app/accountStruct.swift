//
//  accountStruct.swift
//  accounting_book_app
//
//  Created by 張丞嘉 on 2022/10/4.
//

import Foundation

class account {
    var payPid: Int
    var receive: [Int:Int] // receivePid : payMoney
    
    init(payPid: Int, receive: [Int:Int]) {
        self.payPid = payPid
        self.receive = receive
    }
}
