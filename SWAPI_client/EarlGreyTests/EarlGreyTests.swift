//
//  EarlGreyTests.swift
//  EarlGreyTests
//
//  Created by GLaDOS on 29/05/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import EarlGrey
import XCTest
@testable import Holocron

class EarlGreyTests: XCTestCase {

    override func setUp() {
        
    }

    override func tearDown() {
        
    }

    func testExample() {
        EarlGrey.selectElement(with: grey_text("People")).perform(grey_tap())
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
