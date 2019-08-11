//
//  DependencyContainer+ViewModels.swift
//  SWAPI_client
//
//  Created by GLaDOS on 11/08/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

extension DependencyContainer {
    func mainMenuViewModel() -> MainMenuViewModelType {
        return MainMenuViewModel()
    }
    
    func optionsViewModel() -> OptionsViewModelType {
        return OptionsViewModel()
    }
}

extension DependencyContainer {
    func filmsViewModel(apiClient: APIClientType) -> FilmsViewModelType {
        return FilmsViewModel(apiClient: apiClient)
    }
    
    func peopleViewModel(apiClient: APIClientType) -> PeopleViewModelType {
        return PeopleViewModel(apiClient: apiClient)
    }
    
    func planetsViewModel(apiClient: APIClientType) -> PlanetsViewModelType {
        return PlanetsViewModel(apiClient: apiClient)
    }
    
    func speciesViewModel(apiClient: APIClientType) -> SpeciesViewModelType {
        return SpeciesViewModel(apiClient: apiClient)
    }
    
    func shipsViewModel(apiClient: APIClientType) -> ShipsViewModelType {
        return ShipsViewModel(apiClient: apiClient)
    }
    
    func vehiclesViewModel(apiClient: APIClientType) -> VehiclesViewModelType {
        return VehiclesViewModel(apiClient: apiClient)
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
