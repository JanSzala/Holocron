//
//  DependencyContainer+ViewControllers.swift
//  SWAPI_client
//
//  Created by GLaDOS on 11/08/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

extension DependencyContainer {
    func mainMenuViewController(with viewModel: MainMenuViewModelType) -> MainMenuViewController {
        let viewController = MainMenuViewController()
        viewController.viewModel = viewModel
        
        return viewController
    }
    
    func optionsViewController(with viewModel: OptionsViewModelType) -> OptionsViewController {
        let viewController = OptionsViewController()
        viewController.viewModel = viewModel
        
        return viewController
    }
}

extension DependencyContainer {
    func filmsViewController(with viewModel: FilmsViewModelType) -> FilmsViewController {
        let viewController = FilmsViewController()
        viewController.viewModel = viewModel
        
        return viewController
    }
    
    func peopleViewController(with viewModel: PeopleViewModelType) -> PeopleViewController {
        let viewController = PeopleViewController()
        viewController.viewModel = viewModel
        
        return viewController
    }
    
    func planetsViewController(with viewModel: PlanetsViewModelType) -> PlanetsViewController {
        let viewController = PlanetsViewController()
        viewController.viewModel = viewModel
        
        return viewController
    }
    
    func speciesViewController(with viewModel: SpeciesViewModelType) -> SpeciesViewController {
        let viewController = SpeciesViewController()
        viewController.viewModel = viewModel
        
        return viewController
    }
    
    func shipsViewController(with viewModel: ShipsViewModelType) -> ShipsViewController {
        let viewController = ShipsViewController()
        viewController.viewModel = viewModel
        
        return viewController
    }
    
    func vehiclesViewController(with viewModel: VehiclesViewModelType) -> VehiclesViewController {
        let viewController = VehiclesViewController()
        viewController.viewModel = viewModel
        
        return viewController
    }
}

extension DependencyContainer {
    func filmViewController(with viewModel: FilmViewModelType) -> FilmViewController {
        let viewController = FilmViewController()
        viewController.viewModel = viewModel
        
        return viewController
    }
    
    func personViewController(with viewModel: PersonViewModelType) -> PersonViewController {
        let viewController = PersonViewController()
        viewController.viewModel = viewModel
        
        return viewController
    }
    
    func planetViewController(with viewModel: PlanetViewModelType) -> PlanetViewController {
        let viewController = PlanetViewController()
        viewController.viewModel = viewModel
        
        return viewController
    }
    
    func kindViewController(with viewModel: KindViewModelType) -> KindViewController {
        let viewController = KindViewController()
        viewController.viewModel = viewModel
        
        return viewController
    }
    
    func shipViewController(with viewModel: ShipViewModelType) -> ShipViewController {
        let viewController = ShipViewController()
        viewController.viewModel = viewModel
        
        return viewController
    }
    
    func vehicleViewController(with viewModel: VehicleViewModelType) -> VehicleViewController {
        let viewController = VehicleViewController()
        viewController.viewModel = viewModel
        
        return viewController
    }
}
