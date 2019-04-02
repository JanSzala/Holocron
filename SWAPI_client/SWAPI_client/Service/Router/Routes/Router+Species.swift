//
//  Router+Species.swift
//  SWAPI_client
//
//  Created by JanSzala on 02/04/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

extension Router {
    func getSpecies(for page: Int) -> Route {
        return Route(method: .get,
                     baseURL: baseURL,
                     endpoint: "/species/?page=\(page)",
                     accessToken: nil,
                     queryString: nil)
    }
}