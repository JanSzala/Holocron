//
//  MainMenuViewModelType.swift
//  SWAPI_client
//
//  Created by JanSzala on 29/11/2018.
//  Copyright © 2018 JanSzala. All rights reserved.
//

import Foundation
import UIKit

protocol MainMenuViewModelType: class {
    var onTapped: ((DataType, String) -> ())? { get set }
    var onOptions: (() -> ())? { get set }
    var onFilms: (() -> ())? { get set }
    var onPeople: (() -> ())? { get set }
    var onPlanets: (() -> ())? { get set }
    var onSpecies: (() -> ())? { get set }
    var onShips: (() -> ())? { get set }
    var onVehicles: (() -> ())? { get set }

    var alert: UIAlertController { get }

    func isInternetConnected() -> Bool
}
