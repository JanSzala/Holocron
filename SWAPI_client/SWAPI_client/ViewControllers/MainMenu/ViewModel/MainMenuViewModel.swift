//
//  MainMenuViewModel.swift
//  SWAPI_client
//
//  Created by JanSzala on 29/11/2018.
//  Copyright © 2018 JanSzala. All rights reserved.
//

import Foundation
import UIKit

internal class MainMenuViewModel: MainMenuViewModelType {
    var onTapped: ((DataType, String) -> ())?
    var onOptions: (() -> ())?
    var onFilms: (() -> ())?
    var onPeople: (() -> ())?
    var onPlanets: (() -> ())?
    var onSpecies: (() -> ())?
    var onShips: (() -> ())?
    var onVehicles: (() -> ())?
    
    var alert: UIAlertController {
        let alert = UIAlertController(title: NSLocalizedString("No internet connection", comment: ""),
                                      message: NSLocalizedString("No internet message", comment: ""),
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        return alert
    }
    
    func isInternetConnected() -> Bool {
        return InternetReachability().isConnectedToNetwork()
    }
}
