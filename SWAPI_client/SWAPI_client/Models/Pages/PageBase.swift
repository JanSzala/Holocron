//
//  PageBase.swift
//  SWAPI_client
//
//  Created by GLaDOS on 30/05/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

class PageBase<T: Decodable>: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [T]?
    
    private enum CodingKeys: CodingKey {
        case count
        case next
        case previous
        case results
    }
    
    init(count: Int, next: String?, previous: String?, results: [T]?) {
        self.count = count
        self.next = next
        self.previous = previous
        self.results = results
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        count = try container.decode(.count)
        next = try container.decodeIfPresent(.next)
        previous = try container.decodeIfPresent(.previous)
        results = try container.decodeIfPresent(.results)
    }
}
