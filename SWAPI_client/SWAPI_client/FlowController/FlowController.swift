//
//  FlowController.swift
//  SWAPI_client
//
//  Created by JanSzala on 29/11/2018.
//  Copyright © 2018 JanSzala. All rights reserved.
//

import Foundation
import UIKit

internal class FlowController: NSObject, FlowControllerType {
    
    var rootViewController: UIViewController
    
    private(set) var navigationController: UINavigationController
    private(set) var dependencyContainer: DependencyContainerType
    
    private lazy var mainMenuViewController: MainMenuViewController = {
        let controller = dependencyContainer.mainMenuViewController
        
        return controller
    }()
    
    required init(dependencyContainer: DependencyContainerType, rootViewController: UIViewController, navigationController: UINavigationController) {
        self.dependencyContainer = dependencyContainer
        self.navigationController = navigationController
        self.rootViewController = rootViewController
        
        super.init()
        
        navigationController.viewControllers = [mainMenuViewController]
        
    }
}

// MARK: Game

extension FlowController {
    func showMainMenuViewController() {
        if navigationController.viewControllers.contains(mainMenuViewController) {
            navigationController.popToViewController(mainMenuViewController, animated: true)
        } else {
            navigationController.pushViewController(mainMenuViewController, animated: true)
        }
    }
    
}
