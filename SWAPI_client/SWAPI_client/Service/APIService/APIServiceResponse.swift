//
//  APIServiceResponse.swift
//  SWAPI_client
//
//  Created by JanSzala on 02/04/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

internal protocol APIServiceResponseType {
    var responseData: Data { get }
    var httpResponseStatusCode: Int { get }
}

internal class APIServiceResponse: APIServiceResponseType {
    let responseData: Data
    let httpResponseStatusCode: Int
    
    // MARK: - Initializers
    
    init(data responseData: Data, statusCode httpResponseStatusCode: Int) {
        self.responseData = responseData
        self.httpResponseStatusCode = httpResponseStatusCode
    }
}
