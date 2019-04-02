//
//  APIClientType.swift
//  SWAPI_client
//
//  Created by JanSzala on 02/04/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

internal typealias APICompletionSuccess = () -> ()
internal typealias APICompletionFailure = (APIClientError) -> ()

internal typealias APICompletionPeople = (PeopleResponse) -> ()
internal typealias APICompletionFilms = (FilmsResponse) -> ()
internal typealias APICompletionPlanets = (PlanetsResponse) -> ()
internal typealias APICompletionSpecies = (SpeciesResponse) -> ()
internal typealias APICompletionStarships = (StarshipsResponse) -> ()
internal typealias APICompletionVehicles = (VehiclesResponse) -> ()

internal protocol APIClientType: APIClientTypePeople, APIClientTypeFilms, APIClientTypePlanets, APIClientTypeSpecies, APIClientTypeStarships, APIClientTypeVehicles {
}

internal protocol APIClientTypePeople {
    func listPeople(page: Int, onSuccess: @escaping APICompletionChallenges, onFailure: @escaping APICompletionFailure) -> URLSessionTask?
}

internal protocol APIClientTypeFilms {
    func listFilms(page: Int, onSuccess: @escaping APICompletionChallenges, onFailure: @escaping APICompletionFailure) -> URLSessionTask?
}

internal protocol APIClientTypePlanets {
    func listPlanets(page: Int, onSuccess: @escaping APICompletionPlanets, onFailure: @escaping APICompletionFailure) -> URLSessionTask?
}

internal protocol APIClientTypeSpecies {
    func listSpecies(page: Int, onSuccess: @escaping APICompletionSpecies, onFailure: @escaping APICompletionFailure) -> URLSessionTask?
}

internal protocol APIClientTypeStarships {
    func listStarships(page: Int, onSuccess: @escaping APICompletionStarships, onFailure: @escaping APICompletionFailure) -> URLSessionTask?
}

internal protocol APIClientTypeVehicles {
    func listVehicles(page: Int, onSuccess: @escaping APICompletionVehicles, onFailure: @escaping APICompletionFailure) -> URLSessionTask?
}
