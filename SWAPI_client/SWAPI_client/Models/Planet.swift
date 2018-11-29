//
//  Planet.swift
//  SWAPI_client
//
//  Created by JanSzala on 02/02/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

class Planet: Decodable {
    let name: String
    let diameter: String
    let rotation_period: String
    let orbital_period: String
    let gravity: String
    let population: String
    let climate: String
    let terrain: String
    let surface_water: String
    let residents: [String]
    let films: [String]
    let url: String
    let created: String
    let edited: String
    
    init(json: [String: Any]) {
         name = json["name"] as? String ?? ""
         diameter = json["diameter"] as? String ?? ""
         rotation_period = json["rotation_period"] as? String ?? ""
         orbital_period = json["orbital_period"] as? String ?? ""
         gravity = json["gravity"] as? String ?? ""
         population = json["population"] as? String ?? ""
         climate = json["climate"] as? String ?? ""
         terrain = json["terrain"] as? String ?? ""
         surface_water = json["surface_water"] as? String ?? ""
         residents = json["residents"] as? [String] ?? [""]
         films = json["films"] as? [String] ?? [""]
         url = json["url"] as? String ?? ""
         created = json["created"] as? String ?? ""
         edited = json["edited"] as? String ?? ""
    }
}


