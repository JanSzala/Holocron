//
//  APIClientError.swift
//  SWAPI_client
//
//  Created by JanSzala on 02/04/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

internal enum APIClientError: LocalizedError {
    case parsingError(error: Error)
    case parsingImageError
    case wrongResponseFormat
    case noInternetConnection
    case notRecognizedServerError
    case unauthorized
    case cancelled
    case incorectLoginPasswordOrToken
    case objectNotFound
    case recognizedServerError(code: Int)
    
    // MARK: - Initializers
    
    init(with serviceError: APIServiceError) {
        switch serviceError {
        case .missingData, .missingHTTPCode, .missingJSON:
            self = .wrongResponseFormat
        case .noInternetConnection:
            self = .noInternetConnection
        case .serverError:
            self = .notRecognizedServerError
        case .cancelled:
            self = .cancelled
        }
    }
    
    init(with parserError: APIParserError) {
        switch parserError {
        case .parsingError(let error):
            self = .parsingError(error: error)
        case let .serverError(codeError):
            self.init(with: codeError)
        case .parsingImageError:
            self = .parsingImageError
        }
    }
    
    private init(with statusCodeError: APIStatusCodeError) {
        switch statusCodeError {
        case .unauthorized:
            self = .unauthorized
        case .forbiddenAccess:
            self = .incorectLoginPasswordOrToken
        case .notFound:
            self = .objectNotFound
        case .notRecognized(let code):
            self = .recognizedServerError(code: code)
        }
    }
}

extension APIClientError {
    var errorDescription: String? {
        switch self {
        case .parsingError:
            return "parsingError"
        case .wrongResponseFormat:
            return "wrongResponseFormat"
        case .noInternetConnection:
            return "noInternetConnection"
        case .notRecognizedServerError:
            return "notRecognizedServerError"
        case .unauthorized:
            return "expiredToken"
        case .incorectLoginPasswordOrToken:
            return "forbiddenAccess"
        case .objectNotFound:
            return "objectNotFoundError"
        case .recognizedServerError(let code):
            return "\(code)"
        case .cancelled:
            return "cancelled"
        case .parsingImageError:
            return "parsingImageError"
        }
    }
}
