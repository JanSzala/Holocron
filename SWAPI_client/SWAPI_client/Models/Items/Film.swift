//
//  Film.swift
//  SWAPI_client
//
//  Created by JanSzala on 02/02/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

internal protocol FilmType: ItemBaseType {
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

internal class Film: Decodable {
    let title: String
    let episode_id: Int
    let opening_crawl: String
    let director: String
    let producer: String
    let release_date: String
    let species: [String]
    let starships: [String]
    let vehicles: [String]
    let characters: [String]
    let planets: [String]
    let url: String
    let created: String
    let edited: String
    
    init(json: [String: Any]) {
        title = json["title"] as? String ?? ""
        episode_id = json["episode_id"] as? Int ?? 0
        opening_crawl = json["opening_crawl"] as? String ?? ""
        director = json["director"] as? String ?? ""
        producer = json["producer"] as? String ?? ""
        release_date = json["release_date"] as? String ?? ""
        species = json["species"] as? [String] ?? [""]
        starships = json["starships"] as? [String] ?? [""]
        vehicles = json["vehicles"] as? [String] ?? [""]
        characters = json["characters"] as? [String] ?? [""]
        planets = json["planets"] as? [String] ?? [""]
        url = json["url"] as? String ?? ""
        created = json["created"] as? String ?? ""
        edited = json["edited"] as? String ?? ""
    }
}
