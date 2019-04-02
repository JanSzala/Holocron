//
//  APIClient.swift
//  SWAPI_client
//
//  Created by JanSzala on 02/04/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

internal class APIClient: APIClientType {
    private(set) var apiService: APIServiceType
    private(set) var apiParser: APIParserType
    
    // MARK: - Initializers
    
    init(apiService: APIServiceType, apiParser: APIParserType) {
        self.apiService = apiService
        self.apiParser = apiParser
    }
}
