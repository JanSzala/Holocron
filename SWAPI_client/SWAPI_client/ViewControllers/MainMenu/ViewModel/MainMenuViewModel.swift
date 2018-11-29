//
//  MainMenuViewModel.swift
//  SWAPI_client
//
//  Created by JanSzala on 29/11/2018.
//  Copyright © 2018 JanSzala. All rights reserved.
//

import Foundation
import UIKit

public enum dataType {
    case People
    case Films
    case Species
    case Starships
    case Vehicles
    case Planets
}

internal enum ViewPlacing {
    case leftMiddle
    case leftTop
    case rightTop
    case rightMiddle
    case rightDown
    case leftDown
}

internal class MainMenuViewModel: MainMenuViewModelType {
    var onTapped: ((dataType, String) -> ())?
    var onOptions: (() -> ())?
    
    var views = [mainMenuSquareView]()
    
    var buttonTitlesArray: [(String, dataType)] = [(NSLocalizedString("Films", comment: ""), .Films),
                                                 (NSLocalizedString("People", comment: ""), .People),
                                                 (NSLocalizedString("Planets", comment: ""), .Planets),
                                                 (NSLocalizedString("Species", comment: ""), .Species),
                                                 (NSLocalizedString("Ships", comment: ""), .Starships),
                                                 (NSLocalizedString("Vehicles", comment: ""), .Vehicles)]
    
    let spacingBetweenButtons: CGFloat = 10
    let additionalSpace: CGFloat = 70
    let animationDuration: TimeInterval = 0.5
    let placingAnimationDuration: TimeInterval = 0.3
    let animationDelay: TimeInterval = 0.5

    
    var alert: UIAlertController {
        let alert = UIAlertController(title: NSLocalizedString("No internet connection", comment: ""),
                                      message: NSLocalizedString("No internet message", comment: ""),
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        return alert
    }
    
    func buttonTitle(for index: Int) -> String {
        return buttonTitlesArray[index].0
    }
    
    func dataType(for index: Int) -> dataType {
        return buttonTitlesArray[index].1
    }
    
    func addViewToArray(_ view: mainMenuSquareView){
        views.append(view)
    }
    
    func isInternetConnected() -> Bool {
        return InternetReachability().isConnectedToNetwork()
    }
    
    func applyCurrentModeToViews(color: UIColor, reversedColor: UIColor) {
        for view in views {
            view.mainView.backgroundColor = reversedColor
            view.button.setTitleColor(color, for: .normal)
        }
    }
}
