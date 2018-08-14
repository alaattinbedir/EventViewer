//
//  AttendeesViewControllerTests.swift
//  EventViewerTests
//
//  Created by Alaattin Bedir on 15.08.2018.
//  Copyright © 2018 Magiclamp Games. All rights reserved.
//

import XCTest
@testable import EventViewer

class AttendeesViewControllerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetAttendeesList() {
        // given
        let attendeesExpectation = expectation(description: "Attendees")
        
        var attendee = [Atendees]()
        
        // when
        let eventId = 71790
        Atendees.getAttendeesList(eventId, success: { (result) in
            attendee = result
            attendeesExpectation.fulfill()
        }, failure: { (error) in
            print(error)
        })
        
        // then
        waitForExpectations(timeout: 5) { _ in
            XCTAssertNotNil(attendee)
        }
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
