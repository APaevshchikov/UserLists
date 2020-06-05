//
//  SessionRepository.swift
//  UserLists
//
//  Created by Арсений Паевщиков on 03.06.2020.
//  Copyright © 2020 Arseniy Paevshchikov. All rights reserved.
//

import Foundation

class SessionRepository {
    private let remoteStorage: SessionRemoteStorage
    private let converter: SessionResponseDTOToSessionConverter
    
    lazy var session: String? = nil
    
    init(remoteStorage: SessionRemoteStorage,
         converter: SessionResponseDTOToSessionConverter
    ) {
        self.remoteStorage = remoteStorage
        self.converter = converter
    }
    
    func getSession(completion: @escaping (String) -> Void) {
        if self.session == nil {
            remoteStorage.newSessionResponseDTORequest { [weak self] value in
                guard let self = self else { return }
                switch value {
                case .success(let success):
                    self.session = self.converter.convert(from: success)
                    completion(self.converter.convert(from: success))
                    print(success)
                case .failure(let error):
                    completion("Error message: \(error)")
                }
            }
        } else {
            completion(self.session!)
        }
    }
}

