//
//  APIService.swift
//  SWAPI_client
//
//  Created by JanSzala on 27/01/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation
import Alamofire

protocol APIServiceType: class {
    func makeRequest(using route: String, onSuccess: @escaping (Data) -> (), onFailure: @escaping () -> ()) -> URLSessionTask?
}

class APIService: APIServiceType {
    func makeRequest(using route: String, onSuccess: @escaping (Data) -> (), onFailure: @escaping () -> ()) -> URLSessionTask? {
        return Alamofire.request(route).responseData { response in
            switch response.result {
            case .success:
                guard let data = response.result.value else {
                    onFailure()
                    return
                }
                
                guard let httpStatusCode = response.response?.statusCode else {
                    onFailure()
                    return
                }
                
                self.checkResponseStatusCode(statusCode: httpStatusCode)
                onSuccess(data)
            case .failure(let error):
                logMsg("Error: \(error)")
                onFailure()
            }
            }.task
    }
    
    private func checkResponseStatusCode(statusCode: Int) {
        switch statusCode {
        case 200:
            logMsg("\(statusCode) Ok")
        case 400:
            logMsg("\(statusCode) Bad Request")
        case 403:
            logMsg("\(statusCode) Forbidden")
        case 404:
            logMsg("\(statusCode) Not Found")
        case 500:
            logMsg("\(statusCode) Internal Server Error")
        case 501:
            logMsg("\(statusCode) Not Implemented")
        default:
            logMsg("\(statusCode) Unknown response status code")
        }
    }
}
