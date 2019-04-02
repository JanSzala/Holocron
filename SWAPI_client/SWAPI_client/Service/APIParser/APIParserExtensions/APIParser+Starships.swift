//
//  APIParser+Starships.swift
//  SWAPI_client
//
//  Created by JanSzala on 02/04/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

extension APIParser: APIParserTypeStarships {
    func parse(listStarshipsResponse: APIServiceResponseType, onSuccess: @escaping APICompletionStarships, onFailure: @escaping APIParserFailure) {
        parse(response: listStarshipsResponse, onSuccess: { (response: StarshipsResponse) in
            onSuccess(response)
        }, onFailure: onFailure)
    }
}
