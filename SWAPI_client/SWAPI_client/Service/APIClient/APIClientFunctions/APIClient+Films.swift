//
//  APIClient+Films.swift
//  SWAPI_client
//
//  Created by JanSzala on 02/04/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

extension APIClient: APIClientTypeFilms {
    func listFilms(page: Int, onSuccess: @escaping APICompletionFilms, onFailure: @escaping APICompletionFailure) -> URLSessionTask? {
        return apiService.getFilms(for: page, onSuccess: { [unowned self] response in
            self.apiParser.parse(listFilmsResponse: response, onSuccess: onSuccess, onFailure: { error in
                onFailure(APIClientError(with: error))
            })
            }, onFailure: { error in
                onFailure(APIClientError(with: error))
        })
    }
}
