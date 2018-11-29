//
//  OptionsViewModel.swift
//  SWAPI_client
//
//  Created by JanSzala on 09/02/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation
import UIKit

internal class OptionsViewModel: OptionsViewModelType {
    var controllerTitle: String = NSLocalizedString("Options", comment: "")
    var optionsTitlesArray = ["Dark mode"]
    
    var numberOfRowsInSection: Int {
        return optionsTitlesArray.count
    }
    
    func onDarkModeSwitchTapped() {
        UserDefaults.standard.bool(forKey: "isDarkModeOn") == true ? UserDefaults.standard.set(false, forKey: "isDarkModeOn") : UserDefaults.standard.set(true, forKey: "isDarkModeOn")
    }
    
    func isDarkMode() -> Bool {
        return UserDefaults.standard.bool(forKey: "isDarkModeOn")
    }
    
    func option(for indexPath: IndexPath) -> String {
        return optionsTitlesArray[indexPath.row]
    }
}
