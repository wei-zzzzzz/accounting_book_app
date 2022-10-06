//
//  createFile.swift
//  accounting_book_app
//
//  Created by 張丞嘉 on 2022/8/13.
//

//import Foundation
//
//struct userData: Codable {
//    var pid: Int
//    var name: String
//    var gidList: [Int]
//
//
//    static let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//
//    static func saveFile(userDataFile: userData) {
//        let propertyEncoder = PropertyListEncoder()
//        if let data = try? propertyEncoder.encode(userDataFile) {
//            let url = userData.dir.appendingPathComponent("userData")
//            do {
//                try data.write(to: url)
//                print(url.path)
//            }
//            catch{
//                print("\(error)")
//            }
//        }
//        else {
//            print("saveFile error")
//        }
//    }
//
//    static func readFile() -> userData? {
//        let propertyDecoder = PropertyListDecoder()
//        let url = userData.dir.appendingPathComponent("userData")
//        if let data = try? Data(contentsOf: url), let udata = try?
//            propertyDecoder.decode(userData.self, from: data) {
//            return udata
//        }else {
//            return nil
//        }
//    }
//
//
//}
