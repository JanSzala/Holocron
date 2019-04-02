//
//  APIParser+Films.swift
//  SWAPI_client
//
//  Created by JanSzala on 02/04/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

extension APIParser: APIParserTypeFilms {
    func parse(listFilmsResponse: APIServiceResponseType, onSuccess: @escaping APICompletionFilms, onFailure: @escaping APIParserFailure) {
        parse(response: listFilmsResponse, onSuccess: { (response: FilmsResponse) in
            onSuccess(response)
        }, onFailure: onFailure)
    }
}
