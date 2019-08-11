//
//  URLSessionCreator.swift
//  SWAPI_client
//
//  Created by JanSzala on 27/01/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

protocol URLSessionCreatorType: class {
    func createURLSession(pageAddress: String, onSuccess: @escaping (Data) -> (), onFailure: @escaping () -> ())
}

class URLSessionCreator: URLSessionCreatorType {
    func createURLSession(pageAddress: String, onSuccess: @escaping (Data) -> (), onFailure: @escaping () -> ()) {
        guard let url = URL(string: pageAddress) else {
            return
        }
        
        URLSession.shared.dataTask(with: url, completionHandler: { data, response, _ in
            guard let data = data, let response = response else {
                return }
            
            self.checkStatusCode(response: response)
            onSuccess(data)
            
        }).resume()
    }
    
    private func checkStatusCode(response: URLResponse) {
        if let httpResponse = response as? HTTPURLResponse {
            switch httpResponse.statusCode {
            case 200:
                logMsg("\(httpResponse.statusCode) Ok")
            case 400:
                logMsg("\(httpResponse.statusCode) Bad Request")
            case 403:
                logMsg("\(httpResponse.statusCode) Forbidden")
            case 404:
                logMsg("\(httpResponse.statusCode) Not Found")
            case 500:
                logMsg("\(httpResponse.statusCode) Internal Server Error")
            case 501:
                logMsg("\(httpResponse.statusCode) Not Implemented")
            default:
                logMsg("\(httpResponse.statusCode) Unknown response status code")
            }
        }
    }
}
