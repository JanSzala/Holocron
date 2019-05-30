//
//  KeyedDecodingContainer+Decode.swift
//  SWAPI_client
//
//  Created by GLaDOS on 30/05/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

extension KeyedDecodingContainer {
    public func decode<T: Decodable>(_ key: Key, as type: T.Type = T.self) throws -> T {
        return try self.decode(T.self, forKey: key)
    }
    
    public func decodeIfPresent<T: Decodable>(_ key: KeyedDecodingContainer.Key) throws -> T? {
        return try decodeIfPresent(T.self, forKey: key)
    }
}
