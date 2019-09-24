//
//  MainMenuTests.swift
//  EarlGreyTests
//
//  Created by GLaDOS on 23/09/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import EarlGrey
import XCTest
@testable import Holocron

class MainMenuTests: XCTestCase {
    override func tearDown() {
        EarlGrey.selectElement(with: grey_text("Back")).perform(grey_tap())
    }

    func test_1_mainMenuPeopleButton() {
        EarlGrey.selectElement(with: grey_accessibilityID("People")).perform(grey_tap())
        EarlGrey.selectElement(with: grey_accessibilityID("listVCNavigationBar")).assert(grey_sufficientlyVisible())
    }
    
    func test_2_mainMenuPlanetsButton() {
        EarlGrey.selectElement(with: grey_accessibilityID("Planets")).perform(grey_tap())
        EarlGrey.selectElement(with: grey_accessibilityID("listVCNavigationBar")).assert(grey_sufficientlyVisible())
    }
    
    func test_3_mainMenuSpeciesButton() {
        EarlGrey.selectElement(with: grey_accessibilityID("Species")).perform(grey_tap())
        EarlGrey.selectElement(with: grey_accessibilityID("listVCNavigationBar")).assert(grey_sufficientlyVisible())
    }
    
    func test_4_mainMenuShipsButton() {
        EarlGrey.selectElement(with: grey_accessibilityID("Ships")).perform(grey_tap())
        EarlGrey.selectElement(with: grey_accessibilityID("listVCNavigationBar")).assert(grey_sufficientlyVisible())
    }
    
    func test_5_mainMenuVehiclesButton() {
        EarlGrey.selectElement(with: grey_accessibilityID("Vehicles")).perform(grey_tap())
        EarlGrey.selectElement(with: grey_accessibilityID("listVCNavigationBar")).assert(grey_sufficientlyVisible())
    }
    
    func test_6_mainMenuFilmsButton() {
        EarlGrey.selectElement(with: grey_accessibilityID("Films")).perform(grey_tap())
        EarlGrey.selectElement(with: grey_accessibilityID("listVCNavigationBar")).assert(grey_sufficientlyVisible())
    }
    
    func test_7_mainMenuOptionsButton() {
        EarlGrey.selectElement(with: grey_accessibilityID("Options")).perform(grey_tap())
        EarlGrey.selectElement(with: grey_accessibilityID("optionsVCNavigationBar")).assert(grey_sufficientlyVisible())
    }
}
