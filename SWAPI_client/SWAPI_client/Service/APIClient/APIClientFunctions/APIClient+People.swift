//
//  APIClient+People.swift
//  SWAPI_client
//
//  Created by JanSzala on 02/04/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

extension APIClient: APIClientTypePeople {
    func listPeople(page: Int, onSuccess: @escaping APICompletionChallenges, onFailure: @escaping APICompletionFailure) -> URLSessionTask? {
        return apiService.getPeople(for: page, onSuccess: { [unowned self] response in
            self.apiParser.parse(listPeopleResponse: response, onSuccess: onSuccess, onFailure: { error in
                onFailure(APIClientError(with: error))
            })
            }, onFailure: { error in
                onFailure(APIClientError(with: error))
        })
    }
}
