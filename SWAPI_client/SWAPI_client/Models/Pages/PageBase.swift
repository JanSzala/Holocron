//
//  PageBase.swift
//  SWAPI_client
//
//  Created by GLaDOS on 30/05/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

internal protocol PageBaseType {
    var count: Int { get }
    var next: String? { get }
    var previous: String? { get }
}

internal class PageBase: PageBaseType, Decodable {
    let count: Int
    let next: String?
    let previous: String?
    
    private enum CodingKeys: CodingKey {
        case count
        case next
        case previous
    }
    
    init(count: Int, next: String?, previous: String?) {
        self.count = count
        self.next = next
        self.previous = previous
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        count = try container.decode(.count)
        next = try container.decodeIfPresent(.next)
        previous = try container.decodeIfPresent(.previous)
    }
}
