//
//  UserClient+Species.swift
//  SWAPI_client
//
//  Created by JanSzala on 03/04/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

extension UserClient: UserClientTypeSpecies {
    func listSpecies(page: Int, onSuccess: @escaping UserClientCompletionSpecies, onFailure: @escaping UserClientFailure) {
        _ = apiClient.listSpecies(page: page, onSuccess: { response in
            onSuccess(response.data.items)
        }, onFailure: { error in
            onFailure(.apiClientError(error: error))
        })
    }
}
