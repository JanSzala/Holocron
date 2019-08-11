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
    let urlSessionCreator: URLSessionCreatorType
    
    init(apiParser: APIParserType, router: RouterType, urlSessionCreator: URLSessionCreatorType) {
        self.apiParser = apiParser
        self.router = router
        self.urlSessionCreator = urlSessionCreator
    }
    
    func getData<T: Decodable>(page: Int, type: DataType, onSuccess: @escaping (T) -> (), onFailure: @escaping  () -> ()) {
        self.urlSessionCreator.createURLSession(pageAddress: router.route(type, page), onSuccess: { data in
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
