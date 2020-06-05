//
//  EntriesRemoteStorage.swift
//  UserLists
//
//  Created by Арсений Паевщиков on 03.06.2020.
//  Copyright © 2020 Arseniy Paevshchikov. All rights reserved.
//

import Foundation
import Alamofire

class EntriesRemoteStorage {
    func addEntry(
        session: String,
        message: String,
        completion: @escaping (AFResult<AddEntyResponseDTO>) -> Void
    ) {
        let url = "https://bnet.i-partner.ru/testAPI/"
        let headers: HTTPHeaders = ["token": "q7uV3yZ-Tx-LKgirC9"]
        let parameters = [
            "a": "add_entry",
            "session": session,
            "body": message
        ]
        
        AF.request(url,
                   method: .post,
                   parameters: parameters,
                   headers: headers)
            .validate()
            .responseDecodable(of: AddEntyResponseDTO.self) { response in
                switch response.result {
                case .success:
                    guard let entry = response.value else { return }
                    print(entry)
                    completion(.success(entry))
                case .failure (let error):
                    print(error)
                    completion(.failure(error))
                }
        }
    }
    
    
    func getEntries(session: String, completion: @escaping (AFResult<GetEntriesResponseDTO>) -> Void) {
        let url = "https://bnet.i-partner.ru/testAPI/"
        let headers: HTTPHeaders = ["token": "q7uV3yZ-Tx-LKgirC9"]
        let parameters = [
            "a": "get_entries",
            "session": session
        ]
        
        AF.request(url,
                   method: .post,
                   parameters: parameters,
                   headers: headers)
            .validate()
            .responseDecodable(of: GetEntriesResponseDTO.self) { response in
                switch response.result {
                case .success:
                    guard let entries = response.value else { return }
                    print(entries)
                    completion(.success(entries))
                case .failure (let error):
                    print(error)
                    completion(.failure(error))
                }
        }
    }
}
