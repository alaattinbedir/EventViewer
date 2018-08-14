//
//  EventsViewControllerTests.swift
//  EventViewerTests
//
//  Created by Alaattin Bedir on 14.08.2018.
//  Copyright © 2018 Magiclamp Games. All rights reserved.
//

import XCTest
@testable import EventViewer

class EventsViewControllerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetEventList() {
        // given
        let eventsExpectation = expectation(description: "Events")
        
        var event = [Events]()
        
        // when
        Events.getEventList(success: { (result) in
            event = result
            eventsExpectation.fulfill()
        }, failure: { (error) in
            print(error)
        })
        
        // then
        waitForExpectations(timeout: 5) { _ in
            XCTAssertNotNil(event)            
        }
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
