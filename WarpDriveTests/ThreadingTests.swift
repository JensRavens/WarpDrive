//
//  WarpDriveTests.swift
//  WarpDriveTests
//
//  Created by Jens Ravens on 13/10/15.
//  Copyright © 2015 nerdgeschoss GmbH. All rights reserved.
//

import Foundation
import XCTest
import Interstellar
@testable import WarpDrive

class ThreadingTests: XCTestCase {
    func mainTest(expectation: XCTestExpectation?)(r: Result<String>, completion:(Result<String>->Void)) {
        XCTAssertTrue(NSThread.isMainThread())
        expectation?.fulfill()
    }
    
    func testShouldDispatchToMainQueue() {
        let expectation = expectationWithDescription("thread called")
        let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        dispatch_async(queue) {
            Signal("test")
                .ensure(WarpDrive.Thread.main)
                .ensure(mainTest(expectation))
        }
        waitForExpectationsWithTimeout(0.1, handler: nil)
    }
    
    func testDispatchToSelectedQueue() {
        let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        let expectation = expectationWithDescription("thread called")
        Signal("test")
            .ensure(Thread.queue(queue))
            .subscribe { _ in
            XCTAssertFalse(NSThread.isMainThread())
            expectation.fulfill()
        }
        waitForExpectationsWithTimeout(0.2, handler: nil)
    }
}
