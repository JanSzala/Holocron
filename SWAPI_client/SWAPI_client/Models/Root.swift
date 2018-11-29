//
//  Root.swift
//  SWAPI_client
//
//  Created by JanSzala on 19/01/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

struct Root: Decodable {
    let films: String
    let people: String
    let planets: String
    let species: String
    let starships: String
    let vehicles: String
    
    init(json: [String: Any]) {
        films = json["films"] as? String ?? ""
        people = json["people"] as? String ?? ""
        planets = json["planets"] as? String ?? ""
        species = json["species"] as? String ?? ""
        starships = json["starships"] as? String ?? ""
        vehicles = json["vehicles"] as? String ?? ""
    }
}
