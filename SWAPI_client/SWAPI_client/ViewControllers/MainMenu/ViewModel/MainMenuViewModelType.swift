//
//  MainMenuViewModelType.swift
//  SWAPI_client
//
//  Created by JanSzala on 29/11/2018.
//  Copyright © 2018 JanSzala. All rights reserved.
//

import Foundation
import UIKit

internal protocol MainMenuViewModelType: class {
    var onTapped: ((DataType, String) -> ())? { get set }
    var onOptions: (() -> ())? { get set }

    var alert: UIAlertController { get }

    func isInternetConnected() -> Bool
}
