//
//  DependencyContainerType.swift
//  SWAPI_client
//
//  Created by JanSzala on 29/11/2018.
//  Copyright © 2018 JanSzala. All rights reserved.
//

import Foundation

protocol DependencyContainerType {
    var apiClient: APIClientType { get }
    var appearanceConfig: AppearanceConfigType { get }
    var mainMenuViewController: MainMenuViewController { get }
    var optionsViewController: OptionsViewController { get }
    
    var filmsViewController: FilmsViewController { get }
    var peopleViewController: PeopleViewController { get }
    var planetsViewController: PlanetsViewController { get }
    var speciesViewController: SpeciesViewController { get }
    var shipsViewController: ShipsViewController { get }
    var vehiclesViewController: VehiclesViewController { get }
    
    func filmViewController(with viewModel: FilmViewModelType) -> FilmViewController
    func personViewController(with viewModel: PersonViewModelType) -> PersonViewController
    func planetViewController(with viewModel: PlanetViewModelType) -> PlanetViewController
    func kindViewController(with viewModel: KindViewModelType) -> KindViewController
    func shipViewController(with viewModel: ShipViewModelType) -> ShipViewController
    func vehicleViewController(with viewModel: VehicleViewModelType) -> VehicleViewController
    
    func filmViewModel(film: Film) -> FilmViewModelType
    func personViewModel(person: Person) -> PersonViewModelType
    func planetViewModel(planet: Planet) -> PlanetViewModelType
    func kindViewModel(kind: Kind) -> KindViewModelType
    func shipViewModel(ship: Starship) -> ShipViewModelType
    func vehicleViewModel(vehicle: Vehicle) -> VehicleViewModelType
}
