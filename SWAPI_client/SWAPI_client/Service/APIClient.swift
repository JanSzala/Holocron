//
//  APIClient.swift
//  SWAPI_client
//
//  Created by JanSzala on 19/01/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation
import UIKit

protocol APIClientType: class {
    func getData<T: Decodable>(page: Int, type: DataType, onSuccess: @escaping (T) -> (), onFailure: @escaping  () -> ())
}

class APIClient: APIClientType {
    let apiParser: APIParserType
    let router: RouterType
    let apiService: APIServiceType
    
    init(apiParser: APIParserType, router: RouterType, apiService: APIServiceType) {
        self.apiParser = apiParser
        self.router = router
        self.apiService = apiService
    }
    
    func getData<T: Decodable>(page: Int, type: DataType, onSuccess: @escaping (T) -> (), onFailure: @escaping  () -> ()) {
        _ = self.apiService.makeRequest(using: router.route(type, page), onSuccess: { data in
            self.apiParser.parseData(data: data, onSuccess: { fetchedData in
                onSuccess(fetchedData)
            }, onFailure: {
                logMsg("Failure parsing data")
                onFailure()
            })
        }, onFailure: {
            logMsg("Failure fetching data")
            onFailure()
        })
    }
}
