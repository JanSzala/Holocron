//
//  Planets.swift
//  SWAPI_client
//
//  Created by JanSzala on 02/02/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

internal protocol PlanetsType: ItemsBaseType {
    var results: [Planet]? { get }
}

internal class Planets: PlanetsType, Decodable {
    var count: Int
    var next: String?
    var previous: String?
    var results: [Planet]?
    
    init(json: [String: Any]) {
        count = json["count"] as? Int ?? 0
        next = json["next"] as? String
        previous = json["previous"] as? String
        results = json["results"] as? [Planet]
    }
}
