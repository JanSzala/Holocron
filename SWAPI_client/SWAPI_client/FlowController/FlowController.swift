//
//  FlowController.swift
//  SWAPI_client
//
//  Created by JanSzala on 29/11/2018.
//  Copyright © 2018 JanSzala. All rights reserved.
//

import Foundation
import UIKit

class FlowController: NSObject, FlowControllerType {
    required init(dependencyContainer: DependencyContainerType, rootViewController: UIViewController, navigationController: UINavigationController) {
        self.dependencyContainer = dependencyContainer
        self.navigationController = navigationController
        self.rootViewController = rootViewController
        
        super.init()
        
        navigationController.viewControllers = [mainMenuViewController]
    }
    
    var rootViewController: UIViewController
    
    private(set) var navigationController: UINavigationController
    private(set) var dependencyContainer: DependencyContainerType
    
    private lazy var mainMenuViewController: MainMenuViewController = {
        let controller = dependencyContainer.mainMenuViewController
        
        controller.viewModel.onOptions = {
            self.showOptions()
        }
        
        controller.viewModel.onFilms = {
            self.showFilmsViewController()
        }
        
        controller.viewModel.onPeople = {
            self.showPeopleViewController()
        }
        
        controller.viewModel.onPlanets = {
            self.showPlanetsViewController()
        }
        
        controller.viewModel.onSpecies = {
            self.showSpeciesViewController()
        }
        
        controller.viewModel.onShips = {
            self.showShipsViewController()
        }
        
        controller.viewModel.onVehicles = {
            self.showVehiclesViewController()
        }
                
        return controller
    }()
    
    func showOptions() {
        let controller = dependencyContainer.optionsViewController
        
        navigationController.pushViewController(controller, animated: true)
    }
}
