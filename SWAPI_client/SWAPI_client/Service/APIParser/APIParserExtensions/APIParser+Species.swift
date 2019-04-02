//
//  APIParser+Species.swift
//  SWAPI_client
//
//  Created by JanSzala on 02/04/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

extension APIParser: APIParserTypeSpecies {
    func parse(listSpeciesResponse: APIServiceResponseType, onSuccess: @escaping APICompletionSpecies, onFailure: @escaping APIParserFailure) {
        parse(response: listSpeciesResponse, onSuccess: { (response: SpeciesResponse) in
            onSuccess(response)
        }, onFailure: onFailure)
    }
}
