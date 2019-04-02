//
//  APIParser+Planets.swift
//  SWAPI_client
//
//  Created by JanSzala on 02/04/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

extension APIParser: APIParserTypePlanets {
    func parse(listPlanetsResponse: APIServiceResponseType, onSuccess: @escaping APICompletionPlanets, onFailure: @escaping APIParserFailure) {
        parse(response: listPlanetsResponse, onSuccess: { (response: PlanetsResponse) in
            onSuccess(response)
        }, onFailure: onFailure)
    }
}
