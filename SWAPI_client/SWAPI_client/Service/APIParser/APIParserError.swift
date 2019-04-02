//
//  APIParserError.swift
//  SWAPI_client
//
//  Created by JanSzala on 02/04/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

internal enum APIParserError: Error {
    case serverError(statusCode: APIStatusCodeError)
    case parsingError(error: Error)
    case parsingImageError
}

internal enum APIStatusCodeError: Error {
    case unauthorized
    case forbiddenAccess
    case notFound
    case notRecognized(code: Int)
    
    // MARK: - Initializers
    
    init(code: Int) {
        switch code {
        case 401:
            self = .unauthorized
        case 403:
            self = .forbiddenAccess
        case 404:
            self = .notFound
        case let code:
            self = .notRecognized(code: code)
        }
    }
}
