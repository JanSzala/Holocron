//
//  UserClient+Films.swift
//  SWAPI_client
//
//  Created by JanSzala on 03/04/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

extension UserClient: UserClientTypeFilms {
    func listFilms(page: Int, onSuccess: @escaping UserClientCompletionFilms, onFailure: @escaping UserClientFailure) {
        _ = apiClient.listFilms(page: page, onSuccess: { response in
            onSuccess(response.data.items)
        }, onFailure: { error in
            onFailure(.apiClientError(error: error))
        })
    }
}
