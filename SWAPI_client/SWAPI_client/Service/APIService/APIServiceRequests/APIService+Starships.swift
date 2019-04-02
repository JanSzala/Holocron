//
//  APIService+Starships.swift
//  SWAPI_client
//
//  Created by JanSzala on 02/04/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

extension APIService: APIServiceTypeStarships {
    func getStarships(for page: Int, onSuccess: @escaping APIServiceSuccess, onFailure: @escaping APIServiceFailure) -> URLSessionTask? {
        
        let route = router.getStarships(for: page)
        return makeRequest(using: route, onSuccess: onSuccess, onFailure: onFailure)
    }
}
