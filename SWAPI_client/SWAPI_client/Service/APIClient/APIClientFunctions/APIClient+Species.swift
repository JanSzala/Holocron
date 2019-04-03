//
//  APIClient+Species.swift
//  SWAPI_client
//
//  Created by JanSzala on 02/04/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

extension APIClient: APIClientTypeSpecies {
    func listSpecies(page: Int, onSuccess: @escaping APICompletionSpecies, onFailure: @escaping APICompletionFailure) -> URLSessionTask? {
        return apiService.getSpecies(for: page, onSuccess: { [unowned self] response in
            self.apiParser.parse(listSpeciesResponse: response, onSuccess: onSuccess, onFailure: { error in
                onFailure(APIClientError(with: error))
            })
            }, onFailure: { error in
                onFailure(APIClientError(with: error))
        })
    }
}
