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
        let controller = dependencyContainer.filmsViewController
        
        controller.filmsViewModel.showDetails = { [unowned self] film in
            self.showFilmDetails(film: film)
        }
        
        navigationController.pushViewController(controller, animated: true)
    }
    
    func showPeopleViewController() {
        let controller = dependencyContainer.peopleViewController
        
        controller.peopleViewModel.showDetails = { [unowned self] person in
            self.showPersonDetails(person: person)
        }
        
        navigationController.pushViewController(controller, animated: true)
    }
    
    func showPlanetsViewController() {
        let controller = dependencyContainer.planetsViewController
        
        controller.planetsViewModel.showDetails = { [unowned self] planet in
            self.showPlanetDetails(planet: planet)
        }
        
        navigationController.pushViewController(controller, animated: true)
    }
    
    func showSpeciesViewController() {
        let controller = dependencyContainer.speciesViewController
        
        controller.speciesViewModel.showDetails = { [unowned self] kind in
            self.showKindDetails(kind: kind)
        }
        
        navigationController.pushViewController(controller, animated: true)
    }
    
    func showShipsViewController() {
        let controller = dependencyContainer.shipsViewController
        
        controller.shipsViewModel.showDetails = { [unowned self] ship in
            self.showShipDetails(ship: ship)
        }
        
        navigationController.pushViewController(controller, animated: true)
    }
    
    func showVehiclesViewController() {
        let controller = dependencyContainer.vehiclesViewController
        
        controller.vehiclesViewModel.showDetails = { [unowned self] vehicle in
            self.showVehicleDetails(vehicle: vehicle)
        }
        
        navigationController.pushViewController(controller, animated: true)
    }
}
