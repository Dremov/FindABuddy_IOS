//
//  FindABuddyTests.swift
//  FindABuddyTests
//
//  Created by Andrii Dremov on 27.11.17.
//  Copyright © 2017 Dremov. All rights reserved.
//

import XCTest
@testable import FindABuddy

class FindABuddyTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    //MARK: Event Class Tests
    // Confirm that the Event initializer returns an Event object when passed valid parameters.
    func testEventInitializationSucceeds() {
        //Zero persons
        let zeroPersons = Event.init(label: "Zero", photo: nil, description: "", expectedPersons: 1)
        XCTAssertNotNil(zeroPersons)
        
    }
    
    // Confirm that the Event initialier returns nil when passed a negative rating or an empty name.
    func testEventInitializationFails() {
        // Negative participants
        let negativeRatingEvent = Event.init(label: "Negative", photo: nil, description: "", expectedPersons: -1)
        XCTAssertNil(negativeRatingEvent)
        
        // Empty String
        let emptyStringEvent = Event.init(label: "", photo: nil, description: "", expectedPersons: 1)
        XCTAssertNil(emptyStringEvent)
    }
}
