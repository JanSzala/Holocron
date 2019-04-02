//
//  APIParser+Vehicles.swift
//  SWAPI_client
//
//  Created by JanSzala on 02/04/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

extension APIParser: APIParserTypeVehicles {
    func parse(listVehiclesResponse: APIServiceResponseType, onSuccess: @escaping APICompletionVehicles, onFailure: @escaping APIParserFailure) {
        parse(response: listVehiclesResponse, onSuccess: { (response: VehiclesResponse) in
            onSuccess(response)
        }, onFailure: onFailure)
    }
}
