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

class WaitingTests: XCTestCase {
    func asyncOperation<T>(delay: Double)(t: T, completion: Result<T>->Void) {
        let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        Signal(t).delay(delay, queue: queue).subscribe(completion)
    }
    
    func fail<T>(t: T) throws -> T {
        throw NSError(domain: "Error", code: 400, userInfo: nil)
    }
    
    
    func testWaitingForSuccess() {
        let greeting = try! Signal("hello")
            .flatMap(self.asyncOperation(0.2))
            .wait()
        XCTAssertEqual(greeting, "hello")
    }
    
    func testWaitingForFail() {
        do {
            try Signal("hello")
                .flatMap(self.asyncOperation(0.2))
                .flatMap(fail)
                .wait()
            XCTFail("This place should never be reached due to an error.")
        } catch {
            
        }
    }
}
