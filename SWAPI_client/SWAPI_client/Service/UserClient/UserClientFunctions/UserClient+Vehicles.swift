//
//  UserClient+Vehicles.swift
//  SWAPI_client
//
//  Created by JanSzala on 03/04/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

extension UserClient: UserClientTypeVehicles {
    func listVehicles(page: Int, onSuccess: @escaping UserClientCompletionVehicles, onFailure: @escaping UserClientFailure) {
        _ = apiClient.listVehicles(page: page, onSuccess: { response in
            onSuccess(response.data.items)
        }, onFailure: { error in
            onFailure(.apiClientError(error: error))
        })
    }
}
