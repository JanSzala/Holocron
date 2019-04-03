//
//  APIService.swift
//  SWAPI_client
//
//  Created by JanSzala on 02/04/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Alamofire
import Foundation

internal class APIService: APIServiceType {
    private(set) var router: Router
    
    // MARK: - Initializers
    
    init(baseURL: String) {
        self.router = Router(baseURL: baseURL)
    }
}

extension APIService {
    @discardableResult
    func makeRequest(using route: Route, onSuccess: @escaping APIServiceSuccess, onFailure: @escaping APIServiceFailure) -> URLSessionTask? {
        return Alamofire.request(route).responseData { response in
            switch response.result {
            case .success:
                guard let data = response.result.value else {
                    onFailure(.missingData)
                    return
                }
                guard let httpStatusCode = response.response?.statusCode else {
                    onFailure(.missingHTTPCode)
                    return
                }
                
                let response = APIServiceResponse(data: data, statusCode: httpStatusCode)
                onSuccess(response)
            case .failure(let error):
                guard error._code != NSURLErrorCancelled else {
                    onFailure(.cancelled)
                    return
                }
                
                guard error._code == NSURLErrorTimedOut
                    || error._code == NSURLErrorNotConnectedToInternet
                    || error._code == NSURLErrorNetworkConnectionLost else {
                        onFailure(.serverError)
                        return
                }
                
                onFailure(.noInternetConnection)
            }
        }.task
    }
    
    func makeRequestJson(using jsonName: String, code: Int, acceptType: RouteAcceptType = .json, onSuccess: @escaping APIServiceSuccess) {
        let bundle = Bundle(for: APIService.self)
        
        guard let file = bundle.url(forResource: jsonName, withExtension: "json"),
            let jsonData = try? Data(contentsOf: file) else {
                fatalError("Could not read filename: \(jsonName)")
        }
        
        let apiResponse = APIServiceResponse(data: jsonData, statusCode: code)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            onSuccess(apiResponse)
        }
    }
}
