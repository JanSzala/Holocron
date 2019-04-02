//
//  APIClient+Planets.swift
//  SWAPI_client
//
//  Created by JanSzala on 02/04/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

extension APIClient: APIClientTypePlanets {
    func listPlanets(page: Int, onSuccess: @escaping APICompletionPlanets, onFailure: @escaping APICompletionFailure) -> URLSessionTask? {
        return apiService.getPlanets(for: page, onSuccess: { [unowned self] response in
            self.apiParser.parse(listPlanetsResponse: response, onSuccess: onSuccess, onFailure: { error in
                onFailure(APIClientError(with: error))
            })
            }, onFailure: { error in
                onFailure(APIClientError(with: error))
        })
    }
}
