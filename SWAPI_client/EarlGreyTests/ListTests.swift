//
//  ListTests.swift
//  EarlGreyTests
//
//  Created by GLaDOS on 23/09/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import EarlGrey
import XCTest
@testable import Holocron

class ListTests: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
//        EarlGrey.selectElement(with: grey_text("People")).perform(grey_tap())
    }

    func test_1_tapFirstCell() {
        EarlGrey.selectElement(with: grey_accessibilityID("People")).perform(grey_tap())
        EarlGrey.selectElement(with: grey_accessibilityID("mainTableViewCell0")).atIndex(0).perform(grey_tap())
        EarlGrey.selectElement(with: grey_accessibilityID("detailsVCNavigationBar")).assert(grey_sufficientlyVisible())
    }
}
