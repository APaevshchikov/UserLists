//
//  SessionResponseDTOConverter.swift
//  UserLists
//
//  Created by Арсений Паевщиков on 03.06.2020.
//  Copyright © 2020 Arseniy Paevshchikov. All rights reserved.
//

import Foundation

class SessionResponseDTOToSessionConverter {
    func convert(from: NewSessionResponseDTO) -> String {
        from.data.session
    }
}
