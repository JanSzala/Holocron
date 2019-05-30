//
//  ItemBase.swift
//  SWAPI_client
//
//  Created by GLaDOS on 30/05/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

internal protocol ItemBaseType {
    var name: String { get }
    var url: String { get }
    var created: String { get }
    var edited: String { get }
}

internal class ItemBase: ItemBaseType, Decodable {
    let name: String
    let url: String
    let created: String
    let edited: String
    
    private enum CodingKeys: CodingKey {
        case name
        case url
        case created
        case edited
    }
    
    init(name: String, url: String, created: String, edited: String) {
        self.name = name
        self.url = url
        self.created = created
        self.edited = edited
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try container.decode(.name)
        url = try container.decode(.url)
        created = try container.decode(.created)
        edited = try container.decode(.edited)
    }
}
