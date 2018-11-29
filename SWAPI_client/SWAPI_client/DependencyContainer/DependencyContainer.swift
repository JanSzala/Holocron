//
//  DependencyContainer.swift
//  SWAPI_client
//
//  Created by JanSzala on 29/11/2018.
//  Copyright © 2018 JanSzala. All rights reserved.
//

import Foundation
import UIKit

internal class DependencyContainer: DependencyContainerType {
    
    private lazy var navigationController = NavigationController()
    
    private var rootViewController: UIViewController {
        return navigationController
    }
    
    lazy var flowController = FlowController(dependencyContainer: self, rootViewController: rootViewController, navigationController: navigationController)
}

// MARK: DependencyContainerViewControllers

extension DependencyContainer: DependencyContainerViewControllers {    
    var mainMenuViewController: MainMenuViewController {
        let controller = MainMenuViewController()
        controller.viewModel = MainMenuViewModel()
        return controller
    }
}
