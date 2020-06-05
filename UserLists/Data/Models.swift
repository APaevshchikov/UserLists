//
//  Model.swift
//  UserLists
//
//  Created by Арсений Паевщиков on 31.05.2020.
//  Copyright © 2020 Arseniy Paevshchikov. All rights reserved.
//

import Foundation

struct GetEntriesResponseDTO: Codable {
    let status: Int
    let all: [NewEntryDTO]
    
    enum CodingKeys: String, CodingKey {
        case status
        case all = "data"
    }
}

struct NewEntryDTO: Codable {
    let id: String
    let body: String
    let creationDate: Date
    let modifyDate: Date
    
    enum CodingKeys: String, CodingKey {
        case id
        case body
        case creationDate = "da"
        case modifyDate = "dm"
    }
}

struct AddEntyResponseDTO: Codable {
    let status: Int
    let data: AddEntyDTO
}

struct AddEntyDTO: Codable {
    let id: String
}

struct NewSessionResponseDTO: Codable {
    let status: Int
    let data: NewSessionDTO
}

struct NewSessionDTO: Codable {
    let session: String
}


