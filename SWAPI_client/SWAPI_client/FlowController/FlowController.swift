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
    
    func showOptions() {
        let controller = dependencyContainer.optionsViewController
        
        navigationController.pushViewController(controller, animated: true)
    }
    
    required init(dependencyContainer: DependencyContainerType, rootViewController: UIViewController, navigationController: UINavigationController) {
        self.dependencyContainer = dependencyContainer
        self.navigationController = navigationController
        self.rootViewController = rootViewController
        
        super.init()
        
        navigationController.viewControllers = [mainMenuViewController]
    }
}

extension FlowController {
    func showFilmsViewController() {
        let controller = dependencyContainer.filmsViewController
        
        controller.filmsViewModel.showDetails = { film in
            self.showFilmDetails(film: film)
        }
        
//        controller.filmsViewModel.showDetails = { film in
//            self.showFilmDetails(film: film)
//        }
        
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
        
        controller.viewModel.showDetails = { planet in
            self.showPlanetDetails(planet: planet)
        }
        
        navigationController.pushViewController(controller, animated: true)
    }
    
    func showSpeciesViewController() {
        let controller = dependencyContainer.speciesViewController
        
        controller.viewModel.showDetails = { kind in
            self.showKindDetails(kind: kind)
        }
        
        navigationController.pushViewController(controller, animated: true)
    }
    
    func showShipsViewController() {
        let controller = dependencyContainer.shipsViewController
        
        controller.viewModel.showDetails = { ship in
            self.showShipDetails(ship: ship)
        }
        
        navigationController.pushViewController(controller, animated: true)
    }
    
    func showVehiclesViewController() {
        let controller = dependencyContainer.vehiclesViewController
        
        controller.viewModel.showDetails = { vehicle in
            self.showVehicleDetails(vehicle: vehicle)
        }
        
        navigationController.pushViewController(controller, animated: true)
    }
}

extension FlowController {
    func showFilmDetails(film: Film) {
        let viewModel = dependencyContainer.filmViewModel(film: film)
        let controller = dependencyContainer.filmViewController(with: viewModel)
        
        navigationController.pushViewController(controller, animated: true)
    }
    
    func showPersonDetails(person: Person) {
        let viewModel = dependencyContainer.personViewModel(person: person)
        let controller = dependencyContainer.personViewController(with: viewModel)
        
        navigationController.pushViewController(controller, animated: true)
    }
    
    func showPlanetDetails(planet: Planet) {
        let viewModel = dependencyContainer.planetViewModel(planet: planet)
        let controller = dependencyContainer.planetViewController(with: viewModel)
        
        navigationController.pushViewController(controller, animated: true)
    }
    
    func showKindDetails(kind: Kind) {
        let viewModel = dependencyContainer.kindViewModel(kind: kind)
        let controller = dependencyContainer.kindViewController(with: viewModel)
        
        navigationController.pushViewController(controller, animated: true)
    }
    
    func showShipDetails(ship: Starship) {
        let viewModel = dependencyContainer.shipViewModel(ship: ship)
        let controller = dependencyContainer.shipViewController(with: viewModel)
        
        navigationController.pushViewController(controller, animated: true)
    }
    
    func showVehicleDetails(vehicle: Vehicle) {
        let viewModel = dependencyContainer.vehicleViewModel(vehicle: vehicle)
        let controller = dependencyContainer.vehicleViewController(with: viewModel)
        
        navigationController.pushViewController(controller, animated: true)
    }
}
