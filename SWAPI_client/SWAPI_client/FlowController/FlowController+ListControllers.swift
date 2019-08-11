//
//  FlowController+ListControllers.swift
//  SWAPI_client
//
//  Created by GLaDOS on 11/08/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

extension FlowController {
    func showFilmsViewController() {
        let viewModel = dependencyContainer.filmsViewModel(apiClient: dependencyContainer.apiClient)
        
        viewModel.showDetails = { [unowned self] film in
            self.showFilmDetails(film: film)
        }
        
        let controller = dependencyContainer.filmsViewController(with: viewModel)
        navigationController.pushViewController(controller, animated: true)
    }
    
    func showPeopleViewController() {
        let viewModel = dependencyContainer.peopleViewModel(apiClient: dependencyContainer.apiClient)
        
        viewModel.showDetails = { [unowned self] person in
            self.showPersonDetails(person: person)
        }
        
        let controller = dependencyContainer.peopleViewController(with: viewModel)
        navigationController.pushViewController(controller, animated: true)
    }
    
    func showPlanetsViewController() {
        let viewModel = dependencyContainer.planetsViewModel(apiClient: dependencyContainer.apiClient)
        
        viewModel.showDetails = { [unowned self] planet in
            self.showPlanetDetails(planet: planet)
        }
        
        let controller = dependencyContainer.planetsViewController(with: viewModel)
        navigationController.pushViewController(controller, animated: true)
    }
    
    func showSpeciesViewController() {
        let viewModel = dependencyContainer.speciesViewModel(apiClient: dependencyContainer.apiClient)
        
        viewModel.showDetails = { [unowned self] kind in
            self.showKindDetails(kind: kind)
        }
        
        let controller = dependencyContainer.speciesViewController(with: viewModel)
        navigationController.pushViewController(controller, animated: true)
    }
    
    func showShipsViewController() {
        let viewModel = dependencyContainer.shipsViewModel(apiClient: dependencyContainer.apiClient)
        
        viewModel.showDetails = { [unowned self] ship in
            self.showShipDetails(ship: ship)
        }
        
        let controller = dependencyContainer.shipsViewController(with: viewModel)
        navigationController.pushViewController(controller, animated: true)
    }
    
    func showVehiclesViewController() {
        let viewModel = dependencyContainer.vehiclesViewModel(apiClient: dependencyContainer.apiClient)
        
        viewModel.showDetails = { [unowned self] vehicle in
            self.showVehicleDetails(vehicle: vehicle)
        }
        
        let controller = dependencyContainer.vehiclesViewController(with: viewModel)
        navigationController.pushViewController(controller, animated: true)
    }
}
