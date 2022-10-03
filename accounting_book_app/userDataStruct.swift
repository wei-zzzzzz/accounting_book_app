//
//  userDataStruct.swift
//  accounting_book_app
//
//  Created by 張丞嘉 on 2022/10/1.
//

import Foundation

class userData: ObservableObject, Codable {
    var pid: Int
    var name: String
    @Published var gidList: [group]
    
    init(pid: Int, name: String, gidList: [group]) {
        self.pid = pid
        self.name = name
        self.gidList = gidList
    }
    
    enum CodingKeys: CodingKey {
        case pid
        case name
        case gidList
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        pid = try container.decode(Int.self, forKey: .pid)
        name = try container.decode(String.self, forKey: .name)
        gidList = try container.decode([group].self, forKey: .gidList)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(pid, forKey: .pid)
        try container.encode(name, forKey: .name)
        try container.encode(gidList, forKey: .gidList)
    }

    static let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!

    static func saveFile(userDataFile: userData) {
        //let propertyEncoder = PropertyListEncoder()
        let propertyEncoder: JSONEncoder = JSONEncoder()
        
        if let data = try? propertyEncoder.encode(userDataFile) {
            let url = userData.dir.appendingPathComponent("userData.json")
            do {
                try data.write(to: url)
                print(url.path)
            }
            catch{
                print("\(error)")
            }
        }
        else {
            print("saveFile error")
        }
    }

    static func readFile() -> userData? {
        //let propertyDecoder = PropertyListDecoder()
        let propertyDecoder: JSONDecoder = JSONDecoder()
    
        let url = userData.dir.appendingPathComponent("userData.json")
        
        //print(url); //for test
        
        if let data = try? Data(contentsOf: url), let udata = try?
            propertyDecoder.decode(userData.self, from: data) {
            return udata
        }else {
            return nil
        }
    }
}
