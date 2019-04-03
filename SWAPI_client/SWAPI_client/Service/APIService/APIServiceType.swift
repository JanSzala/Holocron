//
//  APIServiceType.swift
//  SWAPI_client
//
//  Created by JanSzala on 02/04/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

internal typealias APIServiceSuccess = (APIServiceResponseType) -> ()
internal typealias APIServiceFailure = (APIServiceError) -> ()

internal protocol APIServiceType: APIServiceTypePeople,
APIServiceTypeFilms,
APIServiceTypeSpecies,
APIServiceTypeStarships,
APIServiceTypeVehicles,
APIServiceTypePlanets {
}

internal protocol APIServiceTypePeople {
    func getPeople(for page: Int, onSuccess: @escaping APIServiceSuccess, onFailure: @escaping APIServiceFailure) -> URLSessionTask?
}

internal protocol APIServiceTypeFilms {
    func getFilms(for page: Int, onSuccess: @escaping APIServiceSuccess, onFailure: @escaping APIServiceFailure) -> URLSessionTask?
}

internal protocol APIServiceTypeSpecies {
    func getSpecies(for page: Int, onSuccess: @escaping APIServiceSuccess, onFailure: @escaping APIServiceFailure) -> URLSessionTask?
}

internal protocol APIServiceTypeStarships {
    func getStarships(for page: Int, onSuccess: @escaping APIServiceSuccess, onFailure: @escaping APIServiceFailure) -> URLSessionTask?
}

internal protocol APIServiceTypeVehicles {
    func getVehicles(for page: Int, onSuccess: @escaping APIServiceSuccess, onFailure: @escaping APIServiceFailure) -> URLSessionTask?
}

internal protocol APIServiceTypePlanets {
    func getPlanets(for page: Int, onSuccess: @escaping APIServiceSuccess, onFailure: @escaping APIServiceFailure) -> URLSessionTask?
}
