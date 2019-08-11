//
//  Router.swift
//  SWAPI_client
//
//  Created by JanSzala on 07/02/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

protocol RouterType: class {
    func route(_ endpoint: DataType, _ page: Int) -> String
}

class Router: RouterType {
    func route(_ endpoint: DataType, _ page: Int) -> String {
        var baseRoute = "https://swapi.co/api/"
        
        switch endpoint {
        case .Films:
            baseRoute += "films"
        case .People:
            baseRoute += "people"
        case .Planets:
            baseRoute += "planets"
        case .Species:
            baseRoute += "species"
        case .Starships:
            baseRoute += "starships"
        case .Vehicles:
            baseRoute += "vehicles"
        }
        
        return baseRoute + "/?page=\(page)"
    }
}
