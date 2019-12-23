//
//  NSObject+ColorChanging.swift
//  SWAPI_client
//
//  Created by JanSzala on 25/02/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation
import UIKit

extension NSObject {
    func darkModeColor(reversedColors: Bool = false) -> UIColor {
        if reversedColors {
            return UserDefaults.standard.bool(forKey: "isDarkModeOn") ? .white : .black
        } else {
            return UserDefaults.standard.bool(forKey: "isDarkModeOn") ? .black : .white
        }
    }
}
