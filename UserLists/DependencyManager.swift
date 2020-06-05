//
//  DependencyManager.swift
//  UserLists
//
//  Created by Арсений Паевщиков on 04.06.2020.
//  Copyright © 2020 Arseniy Paevshchikov. All rights reserved.
//

import Foundation

class DependencyManager {
    static let shared = DependencyManager()
    
    private let interactor: Interactor
    private let sessionRepository: SessionRepository
    private let entriesRepository: EntriesRepository
    
    private init() {
        self.sessionRepository = SessionRepository(
            remoteStorage: SessionRemoteStorage(),
            converter: SessionResponseDTOToSessionConverter()
        )
        self.entriesRepository = EntriesRepository(
            remoteStorage: EntriesRemoteStorage()
        )
        self.interactor = Interactor(
            entriesRepository: entriesRepository,
            sessionRepository: sessionRepository
        )
    }
    
    func getInteractor() -> Interactor{
        return interactor
    }
    
}
