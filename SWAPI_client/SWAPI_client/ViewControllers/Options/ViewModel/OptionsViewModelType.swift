//
//  OptionsViewModelType.swift
//  SWAPI_client
//
//  Created by JanSzala on 09/02/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation
import UIKit

internal protocol OptionsViewModelType: class {
    var controllerTitle: String { get }
    var numberOfRowsInSection: Int { get }
    
    func onDarkModeSwitchTapped()
    func isDarkMode() -> Bool
    func option(for indexPath: IndexPath) -> String
}
