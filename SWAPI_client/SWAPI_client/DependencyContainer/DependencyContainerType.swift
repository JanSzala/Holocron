//
//  DependencyContainerType.swift
//  SWAPI_client
//
//  Created by JanSzala on 29/11/2018.
//  Copyright © 2018 JanSzala. All rights reserved.
//

import Foundation

protocol DependencyContainerType: DependencyContainerViewControllersType, DependencyContainerViewModelsType {
    var apiClient: APIClientType { get }
    var appearanceConfig: AppearanceConfigType { get }
}

protocol DependencyContainerViewControllersType {
    func mainMenuViewController(with viewModel: MainMenuViewModelType) -> MainMenuViewController
    func optionsViewController(with viewModel: OptionsViewModelType) -> OptionsViewController
    
    func filmsViewController(with viewModel: FilmsViewModelType) -> FilmsViewController
    func peopleViewController(with viewModel: PeopleViewModelType) -> PeopleViewController
    func planetsViewController(with viewModel: PlanetsViewModelType) -> PlanetsViewController
    func speciesViewController(with viewModel: SpeciesViewModelType) -> SpeciesViewController
    func shipsViewController(with viewModel: ShipsViewModelType) -> ShipsViewController
    func vehiclesViewController(with viewModel: VehiclesViewModelType) -> VehiclesViewController
    
    func filmViewController(with viewModel: FilmViewModelType) -> FilmViewController
    func personViewController(with viewModel: PersonViewModelType) -> PersonViewController
    func planetViewController(with viewModel: PlanetViewModelType) -> PlanetViewController
    func kindViewController(with viewModel: KindViewModelType) -> KindViewController
    func shipViewController(with viewModel: ShipViewModelType) -> ShipViewController
    func vehicleViewController(with viewModel: VehicleViewModelType) -> VehicleViewController
}

protocol DependencyContainerViewModelsType {
    func mainMenuViewModel() -> MainMenuViewModelType
    func optionsViewModel() -> OptionsViewModelType
    
    func filmsViewModel(apiClient: APIClientType) -> FilmsViewModelType
    func peopleViewModel(apiClient: APIClientType) -> PeopleViewModelType
    func planetsViewModel(apiClient: APIClientType) -> PlanetsViewModelType
    func speciesViewModel(apiClient: APIClientType) -> SpeciesViewModelType
    func shipsViewModel(apiClient: APIClientType) -> ShipsViewModelType
    func vehiclesViewModel(apiClient: APIClientType) -> VehiclesViewModelType
    
    func filmViewModel(film: Film) -> FilmViewModelType
    func personViewModel(person: Person) -> PersonViewModelType
    func planetViewModel(planet: Planet) -> PlanetViewModelType
    func kindViewModel(kind: Kind) -> KindViewModelType
    func shipViewModel(ship: Starship) -> ShipViewModelType
    func vehicleViewModel(vehicle: Vehicle) -> VehicleViewModelType
}
