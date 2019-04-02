//
//  APIService+Films.swift
//  SWAPI_client
//
//  Created by JanSzala on 02/04/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

extension APIService: APIServiceTypeFilms {
    func getFilms(for page: Int, onSuccess: @escaping APIServiceSuccess, onFailure: @escaping APIServiceFailure) -> URLSessionTask? {
        
        let route = router.getFilms(for: page)
        return makeRequest(using: route, onSuccess: onSuccess, onFailure: onFailure)
    }
}
