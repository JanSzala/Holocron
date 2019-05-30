//
//  Starship.swift
//  SWAPI_client
//
//  Created by JanSzala on 02/02/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

internal protocol StarshipType: ItemBaseType {
    var model: String { get }
    var starship_class: String { get }
    var manufacturer: String { get }
    var cost_in_credits: String { get }
    var length: String { get }
    var crew: String { get }
    var passengers: String { get }
    var max_atmosphering_speed: String { get }
    var hyperdrive_rating: String { get }
    var MGLT: String { get }
    var cargo_capacity: String { get }
    var consumables: String { get }
    var films: [String] { get }
    var pilots: [String] { get }
}

internal class Starship: ItemBase, StarshipType {
    let model: String
    let starship_class: String
    let manufacturer: String
    let cost_in_credits: String
    let length: String
    let crew: String
    let passengers: String
    let max_atmosphering_speed: String
    let hyperdrive_rating: String
    let MGLT: String
    let cargo_capacity: String
    let consumables: String
    let films: [String]
    let pilots: [String]
    
    private enum CodingKeys: CodingKey {
        case model
        case starship_class
        case manufacturer
        case cost_in_credits
        case length
        case crew
        case passengers
        case max_atmosphering_speed
        case hyperdrive_rating
        case MGLT
        case cargo_capacity
        case consumables
        case films
        case pilots
    }
    
    // MARK: - Initializers
    
    init(name: String,
         model: String,
         starship_class: String,
         manufacturer: String,
         cost_in_credits: String,
         length: String,
         crew: String,
         passengers: String,
         max_atmosphering_speed: String,
         hyperdrive_rating: String,
         MGLT: String,
         cargo_capacity: String,
         consumables: String,
         films: [String],
         pilots: [String],
         url: String,
         created: String,
         edited: String) {
        self.model = model
        self.starship_class = starship_class
        self.manufacturer = manufacturer
        self.cost_in_credits = cost_in_credits
        self.length = length
        self.crew = crew
        self.passengers = passengers
        self.max_atmosphering_speed = max_atmosphering_speed
        self.hyperdrive_rating = hyperdrive_rating
        self.MGLT = MGLT
        self.cargo_capacity = cargo_capacity
        self.consumables = consumables
        self.films = films
        self.pilots = pilots
        
        super.init(name: name, url: url, created: created, edited: edited)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        model = try container.decode(.model)
        starship_class = try container.decode(.starship_class)
        manufacturer = try container.decode(.manufacturer)
        cost_in_credits = try container.decode(.cost_in_credits)
        length = try container.decode(.length)
        crew = try container.decode(.crew)
        passengers = try container.decode(.passengers)
        max_atmosphering_speed = try container.decode(.max_atmosphering_speed)
        hyperdrive_rating = try container.decode(.hyperdrive_rating)
        MGLT = try container.decode(.MGLT)
        cargo_capacity = try container.decode(.cargo_capacity)
        consumables = try container.decode(.consumables)
        films = try container.decode(.films)
        pilots = try container.decode(.pilots)
        
        try super.init(from: decoder)
    }
}
