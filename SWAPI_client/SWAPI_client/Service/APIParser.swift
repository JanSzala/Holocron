//
//  APIParser.swift
//  SWAPI_client
//
//  Created by JanSzala on 07/02/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

protocol APIParserType: class {
    func parseData<T: Decodable>(data: Data, onSuccess: @escaping (T) -> (), onFailure: @escaping () -> ())
}

class APIParser: APIParserType {
    func parseData<T: Decodable>(data: Data, onSuccess: @escaping (T) -> (), onFailure: @escaping () -> ()) {
        do {
            let json = try JSONDecoder().decode(T.self, from: data)
            onSuccess(json)
        } catch let error {
            logMsg("Error during serialization of JSON: \(error)")
            onFailure()
        }
    }
}
