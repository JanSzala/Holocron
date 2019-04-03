//
//  UserClient+People.swift
//  SWAPI_client
//
//  Created by JanSzala on 03/04/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

extension UserClient: UserClientTypePeople {
    func listPeople(page: Int, onSuccess: @escaping UserClientCompletionPeople, onFailure: @escaping UserClientFailure) {
        _ = apiClient.listPeople(page: page, onSuccess: { response in
            onSuccess(response.data.items)
        }, onFailure: { error in
            onFailure(.apiClientError(error: error))
        })
    }
}
