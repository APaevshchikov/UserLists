//
//  UserListsTests.swift
//  UserListsTests
//
//  Created by Арсений Паевщиков on 02.06.2020.
//  Copyright © 2020 Arseniy Paevshchikov. All rights reserved.
//

import XCTest
import Foundation

@testable import UserLists

struct NewSessionResponseDTO: Codable, Equatable {
    let status: Int
    let data: SessionDTO
}

struct SessionDTO: Codable, Equatable {
    let session: String
}


class UserListsTests: XCTestCase {
    
    //не видно структуры
    //сделать ремоут сторадж, кот будет возвращать NewSessionResponseDTO
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let data = """
        {
            "status":1,
            "data":{
                "session":"tThEPaP7uvGWje176p"
                }
        }
        """.data(using: .utf8)
        
        let actual = try JSONDecoder().decode(NewSessionResponseDTO.self, from: data!)
        
        let expected = NewSessionResponseDTO(status: 1, data: SessionDTO(session: "tThEPaP7uvGWje176p"))
        
        //        XCTAssertEqual(actual, expected
        XCTAssertEqual(actual, expected, "Actual doesn`t much expected")
    }
    
    func testPerformanceExample() throws {
        let dm = DependencyManager.shared
        
        dm.getInteractor()
        
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    
    
    
}
