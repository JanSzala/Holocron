//
//  URLSessionCreator.swift
//  SWAPI_client
//
//  Created by JanSzala on 27/01/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

internal protocol URLSessionCreatorType: class {
    func createURLSession(pageAddress: String, onSuccess: @escaping (Data) -> (), onFailure: @escaping () -> ())
}

class URLSessionCreator: URLSessionCreatorType {
    func createURLSession(pageAddress: String, onSuccess: @escaping (Data) -> (), onFailure: @escaping () -> ()) {
        guard let url = URL(string: pageAddress) else {
            return
        }
        
        URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
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
                print("\(httpResponse.statusCode) Ok")
            case 400:
                print("\(httpResponse.statusCode) Bad Request")
            case 403:
                print("\(httpResponse.statusCode) Forbidden")
            case 404:
                print("\(httpResponse.statusCode) Not Found")
            case 500:
                print("\(httpResponse.statusCode) Internal Server Error")
            case 501:
                print("\(httpResponse.statusCode) Not Implemented")
            default:
                print("\(httpResponse.statusCode) Unknown response status code")
            }
        }
    }
}
