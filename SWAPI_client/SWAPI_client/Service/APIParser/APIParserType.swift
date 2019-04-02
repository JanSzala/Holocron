//
//  APIParserType.swift
//  SWAPI_client
//
//  Created by JanSzala on 02/04/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

internal typealias APIParserFailure = (APIParserError) -> ()

internal protocol APIParserType: APIParserTypePeople, APIParserTypeFilms, APIParserTypeSpecies, APIParserTypeStarships, APIParserTypeVehicles, APIParserTypePlanets
{
    func parse(response: APIServiceResponseType, onSuccess: @escaping () -> (), onFailure: @escaping (APIParserError) -> ())
    func parse<T: Decodable>(response: APIServiceResponseType, onSuccess: @escaping (T) -> (), onFailure: @escaping (APIParserError) -> ())
}

internal protocol APIParserTypePeople {
    func parse(listPeopleResponse: APIServiceResponseType, onSuccess: @escaping APICompletionPeople, onFailure: @escaping APIParserFailure)
}

internal protocol APIParserTypeFilms {
    func parse(listFilmsResponse: APIServiceResponseType, onSuccess: @escaping APICompletionFilms, onFailure: @escaping APIParserFailure)
}

internal protocol APIParserTypeSpecies {
    func parse(listSpeciesResponse: APIServiceResponseType, onSuccess: @escaping APICompletionSpecies, onFailure: @escaping APIParserFailure)
}

internal protocol APIParserTypeStarships {
    func parse(listStarshipsResponse: APIServiceResponseType, onSuccess: @escaping APICompletionStarships, onFailure: @escaping APIParserFailure)
}

internal protocol APIParserTypeVehicles {
    func parse(listVehiclesResponse: APIServiceResponseType, onSuccess: @escaping APICompletionVehicles, onFailure: @escaping APIParserFailure)
}

internal protocol APIParserTypePlanets {
    func parse(listPlanetsResponse: APIServiceResponseType, onSuccess: @escaping APICompletionPlanets, onFailure: @escaping APIParserFailure)
}
