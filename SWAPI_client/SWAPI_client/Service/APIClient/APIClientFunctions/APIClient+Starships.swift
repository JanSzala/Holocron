//
//  APIClient+Starships.swift
//  SWAPI_client
//
//  Created by JanSzala on 02/04/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

extension APIClient: APIClientTypeStarships {
    func listStarships(page: Int, onSuccess: @escaping APICompletionStarships, onFailure: @escaping APICompletionFailure) -> URLSessionTask? {
        return apiService.getStarships(for: page, onSuccess: { [unowned self] response in
            self.apiParser.parse(listStarshipsResponse: response, onSuccess: onSuccess, onFailure: { error in
                onFailure(APIClientError(with: error))
            })
            }, onFailure: { error in
                onFailure(APIClientError(with: error))
        })
    }
}
