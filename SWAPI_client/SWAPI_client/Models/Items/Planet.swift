//
//  Planet.swift
//  SWAPI_client
//
//  Created by JanSzala on 02/02/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

internal protocol PlanetType: ItemBaseType {
    var diameter: String { get }
    var rotation_period: String { get }
    var orbital_period: String { get }
    var gravity: String { get }
    var population: String { get }
    var climate: String { get }
    var terrain: String { get }
    var surface_water: String { get }
    var residents: [String] { get }
    var films: [String] { get }
}

internal class Planet: ItemBase, PlanetType {
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
    
    private enum CodingKeys: CodingKey {
        case diameter
        case rotation_period
        case orbital_period
        case gravity
        case population
        case climate
        case terrain
        case surface_water
        case residents
        case films
    }
    
    // MARK: - Initializers
    
    init(name: String,
         diameter: String,
         rotation_period: String,
         orbital_period: String,
         gravity: String,
         population: String,
         climate: String,
         terrain: String,
         surface_water: String,
         residents: [String],
         films: [String],
         url: String,
         created: String,
         edited: String) {
        self.diameter = diameter
        self.rotation_period = rotation_period
        self.orbital_period = orbital_period
        self.gravity = gravity
        self.population = population
        self.climate = climate
        self.terrain = terrain
        self.surface_water = surface_water
        self.residents = residents
        self.films = films
        
        super.init(name: name, url: url, created: created, edited: edited)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        diameter = try container.decode(.diameter)
        rotation_period = try container.decode(.rotation_period)
        orbital_period = try container.decode(.orbital_period)
        gravity = try container.decode(.gravity)
        population = try container.decode(.population)
        climate = try container.decode(.climate)
        terrain = try container.decode(.terrain)
        surface_water = try container.decode(.surface_water)
        residents = try container.decode(.residents)
        films = try container.decode(.films)
        
        try super.init(from: decoder)
    }
}
