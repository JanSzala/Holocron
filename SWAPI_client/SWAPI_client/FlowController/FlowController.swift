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
        
        showMainMenu()
    }
    
    var rootViewController: UIViewController
    
    private(set) var navigationController: UINavigationController
    private(set) var dependencyContainer: DependencyContainerType
    
    private func showMainMenu() {
        let viewModel = dependencyContainer.mainMenuViewModel()
        
        viewModel.onOptions = {
            self.showOptions()
        }
        
        viewModel.onFilms = {
            self.showFilmsViewController()
        }
        
        viewModel.onPeople = {
            self.showPeopleViewController()
        }
        
        viewModel.onPlanets = {
            self.showPlanetsViewController()
        }
        
        viewModel.onSpecies = {
            self.showSpeciesViewController()
        }
        
        viewModel.onShips = {
            self.showShipsViewController()
        }
        
        viewModel.onVehicles = {
            self.showVehiclesViewController()
        }
        
        let controller = dependencyContainer.mainMenuViewController(with: viewModel)
        
        navigationController.viewControllers = [controller]
    }
    
    private func showOptions() {
        let viewModel = dependencyContainer.optionsViewModel()
        let controller = dependencyContainer.optionsViewController(with: viewModel)
        
        navigationController.pushViewController(controller, animated: true)
    }
}
