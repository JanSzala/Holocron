//
//  Vehicle.swift
//  SWAPI_client
//
//  Created by JanSzala on 02/02/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

protocol VehicleType: ItemBaseType {
    var model: String { get }
    var vehicle_class: String { get }
    var manufacturer: String { get }
    var length: String { get }
    var cost_in_credits: String { get }
    var crew: String { get }
    var passengers: String { get }
    var max_atmosphering_speed: String { get }
    var cargo_capacity: String { get }
    var consumables: String { get }
    var films: [String] { get }
    var pilots: [String] { get }
}

class Vehicle: ItemBase, VehicleType {
    let model: String
    let vehicle_class: String
    let manufacturer: String
    let length: String
    let cost_in_credits: String
    let crew: String
    let passengers: String
    let max_atmosphering_speed: String
    let cargo_capacity: String
    let consumables: String
    let films: [String]
    let pilots: [String]
    
    private enum CodingKeys: CodingKey {
         case model
         case vehicle_class
         case manufacturer
         case length
         case cost_in_credits
         case crew
         case passengers
         case max_atmosphering_speed
         case cargo_capacity
         case consumables
         case films
         case pilots
    }
    
    // MARK: - Initializers
    
    init(name: String,
         model: String,
         vehicle_class: String,
         manufacturer: String,
         length: String,
         cost_in_credits: String,
         crew: String,
         passengers: String,
         max_atmosphering_speed: String,
         cargo_capacity: String,
         consumables: String,
         films: [String],
         pilots: [String],
         url: String,
         created: String,
         edited: String) {
        self.model = model
        self.vehicle_class = vehicle_class
        self.manufacturer = manufacturer
        self.length = length
        self.cost_in_credits = cost_in_credits
        self.crew = crew
        self.passengers = passengers
        self.max_atmosphering_speed = max_atmosphering_speed
        self.cargo_capacity = cargo_capacity
        self.consumables = consumables
        self.films = films
        self.pilots = pilots
        
        super.init(name: name, url: url, created: created, edited: edited)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        model = try container.decode(.model)
        vehicle_class = try container.decode(.vehicle_class)
        manufacturer = try container.decode(.manufacturer)
        length = try container.decode(.length)
        cost_in_credits = try container.decode(.cost_in_credits)
        crew = try container.decode(.crew)
        passengers = try container.decode(.passengers)
        max_atmosphering_speed = try container.decode(.max_atmosphering_speed)
        cargo_capacity = try container.decode(.cargo_capacity)
        consumables = try container.decode(.consumables)
        films = try container.decode(.films)
        pilots = try container.decode(.pilots)
        
        try super.init(from: decoder)
    }
}
