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
    var onTapped: ((dataType, String) -> ())? { get set }
    var onOptions: (() -> ())? { get set }
    
    var spacingBetweenButtons: CGFloat { get }
    var additionalSpace: CGFloat { get }
    var animationDuration: TimeInterval { get }
    var placingAnimationDuration: TimeInterval { get }
    var animationDelay: TimeInterval { get }
    var alert: UIAlertController { get }
    
    func buttonTitle(for index: Int) -> String
    func dataType(for index: Int) -> dataType
    func addViewToArray(_ view: mainMenuSquareView)
    func isInternetConnected() -> Bool
    func applyCurrentModeToViews(color: UIColor, reversedColor: UIColor)
}
