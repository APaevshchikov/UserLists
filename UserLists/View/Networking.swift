//
//  Networking.swift
//  UserLists
//
//  Created by Арсений Паевщиков on 31.05.2020.
//  Copyright © 2020 Arseniy Paevshchikov. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Networking {
    
    static let shared = Networking()
    private init() {}
    
    var lists = [String]()
    let defaults = UserDefaults.standard
    
    func getSessionID(completion: @escaping (String) -> Void) {
        let url = "https://bnet.i-partner.ru/testAPI/"
        let headers: HTTPHeaders = ["token": "q7uV3yZ-Tx-LKgirC9"]
        let parameters = ["a": "new_session"]
        
        AF.request(url,
                   method: .post,
                   parameters: parameters,
                   headers: headers)
            .validate().responseJSON { [weak self] response in
                guard let self = self else { return }
                
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    //get session id
                    let session = json["data"]["session"].string
                    //save session
                    self.defaults.set(session, forKey: "session")
                    print("session was saved")
                    //load session
                    guard let sessionID = self.defaults.string(forKey: "session") else { return }
                    print("session fron User Defaults is", sessionID)
                    completion(sessionID)
                case .failure(let error):
                    print("getSessionID error -----", error)
                }
        }
    }
    
    
    func addEntry(_ message: String) {
        let url = "https://bnet.i-partner.ru/testAPI/"
        let headers: HTTPHeaders = ["token": "q7uV3yZ-Tx-LKgirC9"]
        let parameters = [
            "a": "add_entry",
            "session": self.defaults.string(forKey: "session"),
            "body": message
        ]
        
        AF.request(url,
                   method: .post,
                   parameters: parameters,
                   headers: headers)
            .validate().responseJSON { response in
                
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    print(json)
                case .failure(let error):
                    print("addEntrie error------", error)
                }
        }
    }
    
    
    func getEntries(completion: @escaping ([String]) -> Void) {
        let url = "https://bnet.i-partner.ru/testAPI/"
        let headers: HTTPHeaders = ["token": "q7uV3yZ-Tx-LKgirC9"]
        let parameters = [
            "a": "get_entries",
            "session": self.defaults.string(forKey: "session")
        ]
        
        AF.request(url,
                   method: .post,
                   parameters: parameters,
                   headers: headers)
            .validate().responseJSON { response in
                
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    let entries = json["data"][0].arrayValue.map { $0["body"].stringValue }
                    //                self.lists = entries
                    //                print(self.lists)
                    //                print(self.sessionID)
                    completion(entries)
                case .failure(let error):
                    print("addEntrie error------", error)
                }
        }
    }
}
