//
//  MVVMExampleTests.swift
//  MVVMExampleTests
//
//  Created by Mohamed El Hanafi on 7/17/19.
//  Copyright © 2019 Mohamed El Hanafi. All rights reserved.
//

import XCTest
@testable import MVVMExample

class MVVMExampleTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUserViewModelNameAndDescription() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let user = User(id: 1, name: "El Hanafi", username: "Mando", email: "elhanafi@email.tn",phone: "22331144",website: "mando.com")
        
        let userViewModel = UserViewModel(user: user)
        
        XCTAssertEqual(user.name, userViewModel.name)
        XCTAssertEqual("email: \(user.email) - website: \(user.website)", userViewModel.descriptionText)
        
    }
    
    func testUserViewModelAccesorryType(){
        let user = User(id: 1, name: "El Hanafi", username: "Mando", email: "elhanafi@email.tn",phone: "22331144",website: "mando.com")
        
        let userViewModel = UserViewModel(user: user)
        
        XCTAssertEqual(UITableViewCell.AccessoryType.none, userViewModel.accessory)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
