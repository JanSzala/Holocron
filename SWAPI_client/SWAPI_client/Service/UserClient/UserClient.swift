//
//  UserClient.swift
//  SWAPI_client
//
//  Created by JanSzala on 03/04/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

internal class UserClient: UserClientType {
    private(set) var apiClient: APIClientType
    
    // MARK: - Initializers
    
    init(with apiClient: APIClientType) {
        self.apiClient = apiClient
    }
}
