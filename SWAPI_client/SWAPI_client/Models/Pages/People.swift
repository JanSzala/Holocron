//
//  People.swift
//  SWAPI_client
//
//  Created by JanSzala on 20/01/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

internal protocol PeopleType: PageBaseType {
    var results: [Person]? { get }
}

internal class People: PageBase, PeopleType {
    let results: [Person]?
    
    private enum CodingKeys: CodingKey {
        case results
    }
    
    init(count: Int, next: String?, previous: String?, results: [Person]?) {
        self.results = results
        
        super.init(count: count, next: next, previous: previous)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        results = try container.decodeIfPresent(.results)

        try super.init(from: decoder)
    }
}
