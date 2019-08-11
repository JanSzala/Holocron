//
//  FlowController+Details.swift
//  SWAPI_client
//
//  Created by GLaDOS on 11/08/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

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
