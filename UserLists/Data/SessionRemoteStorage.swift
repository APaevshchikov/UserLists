//
//  SessionRemoteStorage.swift
//  UserLists
//
//  Created by Арсений Паевщиков on 02.06.2020.
//  Copyright © 2020 Arseniy Paevshchikov. All rights reserved.
//

import Foundation
import Alamofire

class SessionRemoteStorage {
    func newSessionResponseDTORequest(completion: @escaping (AFResult<NewSessionResponseDTO>) -> Void) {
        let url = "https://bnet.i-partner.ru/testAPI/"
        let headers: HTTPHeaders = ["token": "q7uV3yZ-Tx-LKgirC9"]
        let parameters = ["a": "new_session"]
        
        AF.request(url,
                   method: .post,
                   parameters: parameters,
                   headers: headers)
            .validate()
            .responseDecodable(of: NewSessionResponseDTO.self) { response in
                switch response.result {
                case .success:
                    guard let newSessionResponseDTO = response.value else { return }
                    print("NewSessionResponseDTO is", newSessionResponseDTO)
                    completion(.success(newSessionResponseDTO))
                case .failure (let error):
                    completion(.failure(error))
                    print("NewSessionResponseDTO error", error)
                }
        }
    }
}



