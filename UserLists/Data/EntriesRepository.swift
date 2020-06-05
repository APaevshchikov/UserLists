//
//  EntriesRepository.swift
//  UserLists
//
//  Created by Арсений Паевщиков on 03.06.2020.
//  Copyright © 2020 Arseniy Paevshchikov. All rights reserved.
//

import Foundation

class EntriesRepository {
    private let remoteStorage: EntriesRemoteStorage
    
    init(remoteStorage: EntriesRemoteStorage) {
        self.remoteStorage = remoteStorage
    }
    
    func addEntry(message: String, session: String, completion: @escaping (Bool) -> Void) {
        self.remoteStorage.addEntry(session: session, message: message) { result in  //CHEK later (message)
            completion(true)
        }
    }
    
    func getEntries(session: String, completion: @escaping ([NewEntryDTO]) -> Void) {
        self.remoteStorage.getEntries(session: session) { result in
            switch result {
            case .success(let success):
                completion(success.all)
                print(success)
            case .failure(let error):
                completion([])
                print(error)
            }
        }
    }
}
