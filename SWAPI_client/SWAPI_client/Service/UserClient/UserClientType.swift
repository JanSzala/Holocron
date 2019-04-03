//
//  UserClientType.swift
//  SWAPI_client
//
//  Created by JanSzala on 03/04/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

internal typealias UserClientSuccess = () -> ()
internal typealias UserClientFailure = (UserClientError) -> ()

internal typealias UserClientCompletionPeople = ([People]) -> ()
internal typealias UserClientCompletionFilms = ([Films]) -> ()
internal typealias UserClientCompletionPlanets = ([Planets]) -> ()
internal typealias UserClientCompletionSpecies = ([Species]) -> ()
internal typealias UserClientCompletionStarships = ([Starships]) -> ()
internal typealias UserClientCompletionVehicles = ([Vehicles]) -> ()

internal protocol UserClientType: UserClientTypePeople,
                                  UserClientTypeFilms,
                                  UserClientTypePlanets,
                                  UserClientTypeSpecies,
                                  UserClientTypeStarships,
                                  UserClientTypeVehicles {
}

internal protocol UserClientTypePeople {
    func listPeople(page: Int, onSuccess: @escaping UserClientCompletionPeople, onFailure: @escaping UserClientFailure)
}

internal protocol UserClientTypeFilms {
    func listFilms(page: Int, onSuccess: @escaping UserClientCompletionFilms, onFailure: @escaping UserClientFailure)
}

internal protocol UserClientTypePlanets {
    func listPlanets(page: Int, onSuccess: @escaping UserClientCompletionPlanets, onFailure: @escaping UserClientFailure)
}

internal protocol UserClientTypeSpecies {
    func listSpecies(page: Int, onSuccess: @escaping UserClientCompletionSpecies, onFailure: @escaping UserClientFailure)
}

internal protocol UserClientTypeStarships {
    func listStarships(page: Int, onSuccess: @escaping UserClientCompletionStarships, onFailure: @escaping UserClientFailure)
}

internal protocol UserClientTypeVehicles {
    func listVehicles(page: Int, onSuccess: @escaping UserClientCompletionVehicles, onFailure: @escaping UserClientFailure)
}
