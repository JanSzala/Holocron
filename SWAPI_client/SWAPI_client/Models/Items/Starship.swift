//
//  Starship.swift
//  SWAPI_client
//
//  Created by JanSzala on 02/02/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

internal class Starship: Decodable {
    let name: String
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
    let url: String
    let created: String
    let edited: String
    
    init(json: [String: Any]) {
         name = json["name"] as? String ?? ""
         model = json["model"] as? String ?? ""
         starship_class = json["starship_class"] as? String ?? ""
         manufacturer = json["manufacturer"] as? String ?? ""
         cost_in_credits = json["cost_in_credits"] as? String ?? ""
         length = json["length"] as? String ?? ""
         crew = json["crew"] as? String ?? ""
         passengers = json["passengers"] as? String ?? ""
         max_atmosphering_speed = json["max_atmosphering_speed"] as? String ?? ""
         hyperdrive_rating = json["hyperdrive_rating"] as? String ?? ""
         MGLT = json["MGLT"] as? String ?? ""
         cargo_capacity = json["cargo_capacity"] as? String ?? ""
         consumables = json["consumables"] as? String ?? ""
         films = json["films"] as? [String] ?? [""]
         pilots = json["pilots"] as? [String] ?? [""]
         url = json["url"] as? String ?? ""
         created = json["created"] as? String ?? ""
         edited = json["edited"] as? String ?? ""
    }
}
