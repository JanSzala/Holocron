//
//  UserClient+Starships.swift
//  SWAPI_client
//
//  Created by JanSzala on 03/04/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

extension UserClient: UserClientTypeStarships {
    func listStarships(page: Int, onSuccess: @escaping UserClientCompletionStarships, onFailure: @escaping UserClientFailure) {
        _ = apiClient.listStarships(page: page, onSuccess: { response in
            onSuccess(response.data.items)
        }, onFailure: { error in
            onFailure(.apiClientError(error: error))
        })
    }
}
