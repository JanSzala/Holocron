//
//  DependencyContainerType.swift
//  SWAPI_client
//
//  Created by JanSzala on 29/11/2018.
//  Copyright © 2018 JanSzala. All rights reserved.
//

import Foundation

internal protocol DependencyContainerType {
    var mainMenuViewController: MainMenuViewController { get }
    var optionsViewController: OptionsViewController { get }
    
    var filmsViewController: FilmsViewController { get }
    var peopleViewController: PeopleViewController { get }
    var planetsViewController: PlanetsViewController { get }
    var speciesViewController: SpeciesViewController { get }
    var shipsViewController: ShipsViewController { get }
    var vehiclesViewController: VehiclesViewController { get }
    
    func personViewController(with viewModel: PersonViewModelType) -> PersonViewController
    func personViewModel(person: Person) -> PersonViewModelType
    
    var apiClient: APIClientType { get }
    
    var appearanceConfig: AppearanceConfigType { get }
}
