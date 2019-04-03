//
//  UserClientError.swift
//  SWAPI_client
//
//  Created by JanSzala on 03/04/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

internal enum UserClientError: LocalizedError {
    case apiClientError(error: APIClientError)
}

extension UserClientError {
    var errorDescription: String? {
        let error: APIClientError = .notRecognizedServerError
            return error.localizedDescription
        }
}
