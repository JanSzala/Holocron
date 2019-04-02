//
//  Router+Planets.swift
//  SWAPI_client
//
//  Created by JanSzala on 02/04/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

extension Router {
    func getPlanets(for page: Int) -> Route {
        return Route(method: .get,
                     baseURL: baseURL,
                     endpoint: "/planets/?page=\(page)",
                     accessToken: nil,
                     queryString: nil)
    }
}
