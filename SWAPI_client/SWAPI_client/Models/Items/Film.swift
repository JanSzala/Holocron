//
//  Film.swift
//  SWAPI_client
//
//  Created by JanSzala on 02/02/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

protocol FilmType {
    var title: String { get }
    var episode_id: Int { get }
    var opening_crawl: String { get }
    var director: String { get }
    var producer: String { get }
    var release_date: String { get }
    var species: [String] { get }
    var starships: [String] { get }
    var vehicles: [String] { get }
    var characters: [String] { get }
    var planets: [String] { get }
    var url: String { get }
    var created: String { get }
    var edited: String { get }
}

class Film: FilmType, Decodable {
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
    
    private enum CodingKeys: CodingKey {
        case title
        case episode_id
        case opening_crawl
        case director
        case producer
        case release_date
        case species
        case starships
        case vehicles
        case characters
        case planets
        case url
        case created
        case edited
    }
    
    // MARK: - Initializers
    
    init(title: String,
         episode_id: Int,
         opening_crawl: String,
         director: String,
         producer: String,
         release_date: String,
         species: [String],
         starships: [String],
         vehicles: [String],
         characters: [String],
         planets: [String],
         url: String,
         created: String,
         edited: String) {
        self.title = title
        self.episode_id = episode_id
        self.opening_crawl = opening_crawl
        self.director = director
        self.producer = producer
        self.release_date = release_date
        self.species = species
        self.starships = starships
        self.vehicles = vehicles
        self.characters = characters
        self.planets = planets
        self.url = url
        self.created = created
        self.edited = edited
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        title = try container.decode(.title)
        episode_id = try container.decode(.episode_id)
        opening_crawl = try container.decode(.opening_crawl)
        director = try container.decode(.director)
        producer = try container.decode(.producer)
        release_date = try container.decode(.release_date)
        species = try container.decode(.species)
        starships = try container.decode(.starships)
        vehicles = try container.decode(.vehicles)
        characters = try container.decode(.characters)
        planets = try container.decode(.planets)
        url = try container.decode(.url)
        created = try container.decode(.created)
        edited = try container.decode(.edited)
    }
}
