//
//  APIClient+Vehicles.swift
//  SWAPI_client
//
//  Created by JanSzala on 02/04/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

extension APIClient: APIClientTypeVehicles {
    func listVehicles(page: Int, onSuccess: @escaping APICompletionVehicles, onFailure: @escaping APICompletionFailure) -> URLSessionTask? {
        return apiService.getVehicles(for: page, onSuccess: { [unowned self] response in
            self.apiParser.parse(listVehiclesResponse: response, onSuccess: onSuccess, onFailure: { error in
                onFailure(APIClientError(with: error))
            })
            }, onFailure: { error in
                onFailure(APIClientError(with: error))
        })
    }
}
