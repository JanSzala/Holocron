//
//  Person.swift
//  SWAPI_client
//
//  Created by JanSzala on 20/01/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

internal class Person: Decodable {
    let name: String
    let birth_year: String
    let eye_color: String
    let gender: String
    let hair_color: String
    let height: String
    let mass: String
    let skin_color: String
    let homeworld: String
    let films: [String]?
    let species: [String]?
    let starships: [String]?
    let vehicles: [String]?
    let url: String
    let created: String
    let edited: String
    
    init(json: [String: Any]) {
        name = json["name"] as? String ?? ""
        birth_year = json["birth_year"] as? String ?? ""
        eye_color = json["eye_color"] as? String ?? ""
        gender = json["gender"] as? String ?? ""
        hair_color = json["hair_color"] as? String ?? ""
        height = json["height"] as? String ?? ""
        mass = json["mass"] as? String ?? ""
        skin_color = json["skin_color"] as? String ?? ""
        homeworld = json["homeworld"] as? String ?? ""
        films = json["films"] as? [String] ?? [""]
        species = json["species"] as? [String] ?? [""]
        starships = json["starships"] as? [String] ?? [""]
        vehicles = json["vehicles"] as? [String] ?? [""]
        url = json["url"] as? String ?? ""
        created = json["created"] as? String ?? ""
        edited = json["edited"] as? String ?? ""
    }
}
