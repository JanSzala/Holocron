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
    
    required init(dependencyContainer: DependencyContainerType, rootViewController: UIViewController, navigationController: UINavigationController) {
        self.dependencyContainer = dependencyContainer
        self.navigationController = navigationController
        self.rootViewController = rootViewController
        
        super.init()
        
        navigationController.viewControllers = [mainMenuViewController]
    }
}

extension FlowController {
    func showOptions() {
        let controller = dependencyContainer.optionsViewController
        
        navigationController.pushViewController(controller, animated: true)
    }
    
    func showFilmsViewController() {
        let controller = dependencyContainer.filmsViewController
        
        navigationController.pushViewController(controller, animated: true)
    }
    
    func showPeopleViewController() {
        let controller = dependencyContainer.peopleViewController
        
        controller.viewModel.showDetails = { person in
            self.showPersonDetails(person: person)
        }
        
        navigationController.pushViewController(controller, animated: true)
    }
    
    func showPlanetsViewController() {
        let controller = dependencyContainer.planetsViewController
        
        navigationController.pushViewController(controller, animated: true)
    }
    
    func showSpeciesViewController() {
        let controller = dependencyContainer.speciesViewController
        
        navigationController.pushViewController(controller, animated: true)
    }
    
    func showShipsViewController() {
        let controller = dependencyContainer.shipsViewController
        
        navigationController.pushViewController(controller, animated: true)
    }
    
    func showVehiclesViewController() {
        let controller = dependencyContainer.vehiclesViewController
        
        navigationController.pushViewController(controller, animated: true)
    }
}

extension FlowController {
    func showPersonDetails(person: Person) {
        let viewModel = dependencyContainer.personViewModel(person: person)
        let controller = dependencyContainer.personViewController(with: viewModel)
        
        navigationController.pushViewController(controller, animated: true)
    }
}
