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

internal protocol APIClientType: APIClientTypePeople,  { //add more
}

internal protocol APIClientTypePeople {
//    func loginGoogle(token: GoogleToken, onSuccess: @escaping APICompletionAuthenticate, onFailure: @escaping APICompletionFailure) -> URLSessionTask?
}
