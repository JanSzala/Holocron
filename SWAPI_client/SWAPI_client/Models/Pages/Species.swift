//
//  Species.swift
//  SWAPI_client
//
//  Created by JanSzala on 02/02/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

internal protocol SpeciesType: PageBaseType {
    var results: [Kind]? { get }
}

internal class Species: PageBase, SpeciesType {
    let results: [Kind]?
    
    private enum CodingKeys: CodingKey {
        case results
    }
    
    init(count: Int, next: String?, previous: String?, results: [Kind]?) {
        self.results = results
        
        super.init(count: count, next: next, previous: previous)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        results = try container.decodeIfPresent(.results)
        
        try super.init(from: decoder)
    }
}
