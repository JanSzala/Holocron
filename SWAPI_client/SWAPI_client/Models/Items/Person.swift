//
//  Person.swift
//  SWAPI_client
//
//  Created by JanSzala on 20/01/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

internal protocol PersonType: ItemBaseType {
    var birth_year: String { get }
    var eye_color: String { get }
    var gender: String { get }
    var hair_color: String { get }
    var height: String { get }
    var mass: String { get }
    var skin_color: String { get }
    var homeworld: String { get }
    var films: [String]? { get }
    var species: [String]? { get }
    var starships: [String]? { get }
    var vehicles: [String]? { get }
}

internal class Person: ItemBase, PersonType {
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
    
    private enum CodingKeys: CodingKey {
        case birth_year
        case eye_color
        case gender
        case hair_color
        case height
        case mass
        case skin_color
        case homeworld
        case films
        case species
        case starships
        case vehicles
    }
    
    // MARK: - Initializers
    
    init(name: String,
         birth_year: String,
         eye_color: String,
         gender: String,
         hair_color: String,
         height: String,
         mass: String,
         skin_color: String,
         homeworld: String,
         films: [String]?,
         species: [String]?,
         starships: [String]?,
         vehicles: [String]?,
         url: String,
         created: String,
         edited: String) {
        self.birth_year = birth_year
        self.eye_color = eye_color
        self.gender = gender
        self.hair_color = hair_color
        self.height = height
        self.mass = mass
        self.skin_color = skin_color
        self.homeworld = homeworld
        self.films = films
        self.species = species
        self.starships = starships
        self.vehicles = vehicles
        
        super.init(name: name, url: url, created: created, edited: edited)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        birth_year = try container.decode(.birth_year)
        eye_color = try container.decode(.eye_color)
        gender = try container.decode(.gender)
        hair_color = try container.decode(.hair_color)
        height = try container.decode(.height)
        mass = try container.decode(.mass)
        skin_color = try container.decode(.skin_color)
        homeworld = try container.decode(.homeworld)
        films = try container.decodeIfPresent(.films)
        species = try container.decodeIfPresent(.species)
        starships = try container.decodeIfPresent(.starships)
        vehicles = try container.decodeIfPresent(.vehicles)
        
        try super.init(from: decoder)
    }
}
