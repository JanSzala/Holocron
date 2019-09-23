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

    func test_mainMenuPeopleButton() {
        EarlGrey.selectElement(with: grey_text("People")).perform(grey_tap())
    }
    
    func test_mainMenuPlanetsButton() {
        EarlGrey.selectElement(with: grey_text("Planets")).perform(grey_tap())
    }
    
    func test_mainMenuSpeciesButton() {
        EarlGrey.selectElement(with: grey_text("Species")).perform(grey_tap())
    }
    
    func test_mainMenuShipsButton() {
        EarlGrey.selectElement(with: grey_text("Ships")).perform(grey_tap())
    }
    
    func test_mainMenuVehiclesButton() {
        EarlGrey.selectElement(with: grey_text("Vehicles")).perform(grey_tap())
    }
    
    func test_mainMenuFilmsButton() {
        EarlGrey.selectElement(with: grey_text("Films")).perform(grey_tap())
    }
}
