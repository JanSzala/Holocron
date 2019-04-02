//
//  DataListResponse.swift
//  SWAPI_client
//
//  Created by JanSzala on 02/04/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

internal class DataListResponse<T: Decodable>: Decodable {
    private(set) var items: [T] = []
    
    private enum CodingKeys: CodingKey {
        case items
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        items = try container.decodeIfPresent([T].self, forKey: .items) ?? []
    }
}
