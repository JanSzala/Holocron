//
//  Kind.swift
//  SWAPI_client
//
//  Created by JanSzala on 02/02/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

internal protocol KindType: ItemBaseType {
    var classification: String { get }
    var designation: String { get }
    var average_height: String { get }
    var average_lifespan: String { get }
    var eye_colors: String { get }
    var hair_colors: String { get }
    var skin_colors: String { get }
    var language: String { get }
    var homeworld: String { get }
    var people: [String] { get }
    var films: [String] { get }
}

internal class Kind: Decodable {
    let name: String
    let classification: String
    let designation: String
    let average_height: String
    let average_lifespan: String
    let eye_colors: String
    let hair_colors: String
    let skin_colors: String
    let language: String
    let homeworld: String
    let people: [String]
    let films: [String]
    let url: String
    let created: String
    let edited: String
    
    init(json: [String: Any]) {
        name = json["name"] as? String ?? ""
        classification = json["classification"] as? String ?? ""
        designation = json["designation"] as? String ?? ""
        average_height = json["average_height"] as? String ?? ""
        average_lifespan = json["average_lifespan"] as? String ?? ""
        eye_colors = json["eye_colors"] as? String ?? ""
        hair_colors = json["hair_colors"] as? String ?? ""
        skin_colors = json["skin_colors"] as? String ?? ""
        language = json["language"] as? String ?? ""
        homeworld = json["homeworld"] as? String ?? ""
        people = json["homeworld"] as? [String] ?? [""]
        films = json["homeworld"] as? [String] ?? [""]
        url = json["url"] as? String ?? ""
        created = json["created"] as? String ?? ""
        edited = json["edited"] as? String ?? ""
    }
}
