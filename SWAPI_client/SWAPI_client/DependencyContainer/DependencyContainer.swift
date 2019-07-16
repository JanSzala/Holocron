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
    
    private lazy var navigationController = NavigationController(navigationBarClass: NavigationBar.self, toolbarClass: nil)
    
    private var rootViewController: UIViewController {
        return navigationController
    }
    
    lazy var flowController = FlowController(dependencyContainer: self, rootViewController: rootViewController, navigationController: navigationController)
    
    internal lazy var appearanceConfig: AppearanceConfigType = AppearanceConfig()
}

extension DependencyContainer {
    var apiClient: APIClientType {
        return APIClient(apiParser: apiParser, router: router, urlSessionCreator: urlSessionCreator)
    }
    
    var apiParser: APIParserType {
        return APIParser()
    }
    
    var router: RouterType {
        return Router()
    }
    
    var urlSessionCreator: URLSessionCreatorType {
        return URLSessionCreator()
    }
}

extension DependencyContainer {
    var mainMenuViewController: MainMenuViewController {
        let controller = MainMenuViewController()
        controller.viewModel = MainMenuViewModel()
        return controller
    }
    
    var optionsViewController: OptionsViewController {
        let controller = OptionsViewController()
        controller.viewModel = OptionsViewModel()
        return controller
    }
}

extension DependencyContainer {
    var filmsViewController: FilmsViewController {
        let controller = FilmsViewController()
        controller.viewModel = FilmsViewModel(apiClient: apiClient)
        return controller
    }
    
    var peopleViewController: PeopleViewController {
        let controller = PeopleViewController()
        controller.viewModel = PeopleViewModel(apiClient: apiClient)
        return controller
    }
    
    var planetsViewController: PlanetsViewController {
        let controller = PlanetsViewController()
        controller.viewModel = PlanetsViewModel(apiClient: apiClient)
        return controller
    }
    
    var speciesViewController: SpeciesViewController {
        let controller = SpeciesViewController()
        controller.viewModel = SpeciesViewModel(apiClient: apiClient)
        return controller
    }
    
    var shipsViewController: ShipsViewController {
        let controller = ShipsViewController()
        controller.viewModel = ShipsViewModel(apiClient: apiClient)
        return controller
    }
    
    var vehiclesViewController: VehiclesViewController {
        let controller = VehiclesViewController()
        controller.viewModel = VehiclesViewModel(apiClient: apiClient)
        return controller
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

extension DependencyContainer {
    func filmViewModel(film: Film) -> FilmViewModelType {
        return FilmViewModel(film: film)
    }
    
    func personViewModel(person: Person) -> PersonViewModelType {
        return PersonViewModel(person: person)
    }
    
    func planetViewModel(planet: Planet) -> PlanetViewModelType {
        return PlanetViewModel(planet: planet)
    }
    
    func kindViewModel(kind: Kind) -> KindViewModelType {
        return KindViewModel(kind: kind)
    }
    
    func shipViewModel(ship: Starship) -> ShipViewModelType {
        return ShipViewModel(starship: ship)
    }
    
    func vehicleViewModel(vehicle: Vehicle) -> VehicleViewModelType {
        return VehicleViewModel(vehicle: vehicle)
    }
}
