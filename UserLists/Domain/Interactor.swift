//
//  Interactor.swift
//  UserLists
//
//  Created by Арсений Паевщиков on 04.06.2020.
//  Copyright © 2020 Arseniy Paevshchikov. All rights reserved.
//

import Foundation
//Business logic

class Interactor {
    private let entriesRepository: EntriesRepository
    private let sessionRepository: SessionRepository
    
    init(entriesRepository: EntriesRepository,
         sessionRepository: SessionRepository) {
        self.entriesRepository = entriesRepository
        self.sessionRepository = sessionRepository
    }
    
    func addNewPost(message: String, callBack: @escaping (Bool) -> Void) {
        //        var completion: (String) -> Void = { session in
        //            self.entriesRepository.addEntry(message: message, session: session, completion: callBack)
        //        }
        //        self.sessionRepository.getSession(completion: completion)
        
        self.sessionRepository.getSession { session in
            self.entriesRepository.addEntry(message: message,
                                            session: session,
                                            completion: callBack)
        }
    }
    
    func getEntriesList(callBack: @escaping ([NewEntryDTO]) -> Void) {
        self.sessionRepository.getSession { session in
            self.entriesRepository.getEntries(session: session,
                                              completion: callBack)
        }
    }
    
    func getss() {
        
    }
}
