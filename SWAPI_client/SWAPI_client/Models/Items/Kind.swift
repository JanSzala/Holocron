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
    var homeworld: String? { get }
    var people: [String] { get }
    var films: [String] { get }
}

internal class Kind: ItemBase, KindType {
    let classification: String
    let designation: String
    let average_height: String
    let average_lifespan: String
    let eye_colors: String
    let hair_colors: String
    let skin_colors: String
    let language: String
    let homeworld: String?
    let people: [String]
    let films: [String]
    
    private enum CodingKeys: CodingKey {
        case classification
        case designation
        case average_height
        case average_lifespan
        case eye_colors
        case hair_colors
        case skin_colors
        case language
        case homeworld
        case people
        case films
    }
    
    // MARK: - Initializers
    
    init(name: String,
         classification: String,
         designation: String,
         average_height: String,
         average_lifespan: String,
         eye_colors: String,
         hair_colors: String,
         skin_colors: String,
         language: String,
         homeworld: String,
         people: [String],
         films: [String],
         url: String,
         created: String,
         edited: String) {
        self.classification = classification
        self.designation = designation
        self.average_height = average_height
        self.average_lifespan = average_lifespan
        self.eye_colors = eye_colors
        self.hair_colors = hair_colors
        self.skin_colors = skin_colors
        self.language = language
        self.homeworld = homeworld
        self.people = people
        self.films = films

        super.init(name: name, url: url, created: created, edited: edited)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        classification = try container.decode(.classification)
        designation = try container.decode(.designation)
        average_height = try container.decode(.average_height)
        average_lifespan = try container.decode(.average_lifespan)
        eye_colors = try container.decode(.eye_colors)
        hair_colors = try container.decode(.hair_colors)
        skin_colors = try container.decode(.skin_colors)
        language = try container.decode(.language)
        homeworld = try container.decode(.homeworld)
        people = try container.decode(.people)
        films = try container.decode(.films)
        
        try super.init(from: decoder)
    }
}
