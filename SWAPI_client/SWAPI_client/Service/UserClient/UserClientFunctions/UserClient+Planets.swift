//
//  UserClient+Planets.swift
//  SWAPI_client
//
//  Created by JanSzala on 03/04/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

extension UserClient: UserClientTypePlanets {
    func listPlanets(page: Int, onSuccess: @escaping UserClientCompletionPlanets, onFailure: @escaping UserClientFailure) {
        _ = apiClient.listPlanets(page: page, onSuccess: { response in
            onSuccess(response.data.items)
        }, onFailure: { error in
            onFailure(.apiClientError(error: error))
        })
    }
}
