//
//  Vehicle.swift
//  SWAPI_client
//
//  Created by JanSzala on 02/02/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

internal protocol VehicleType: ItemBaseType {
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

internal class Vehicle: Decodable {
    let name: String
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
    let url: String
    let created: String
    let edited: String
    
    init(json: [String: Any]) {
        name = json["name"] as? String ?? ""
        model = json["model"] as? String ?? ""
        vehicle_class = json["vehicle_class"] as? String ?? ""
        manufacturer = json["manufacturer"] as? String ?? ""
        length = json["length"] as? String ?? ""
        cost_in_credits = json["cost_in_credits"] as? String ?? ""
        crew = json["crew"] as? String ?? ""
        passengers = json[""] as? String ?? ""
        max_atmosphering_speed = json[""] as? String ?? ""
        cargo_capacity = json[""] as? String ?? ""
        consumables = json[""] as? String ?? ""
        films = json[""] as? [String] ?? [""]
        pilots = json[""] as? [String] ?? [""]
        url = json[""] as? String ?? ""
        created = json[""] as? String ?? ""
        edited = json[""] as? String ?? ""
    }
}
