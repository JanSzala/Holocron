//
//  Route.swift
//  SWAPI_client
//
//  Created by JanSzala on 02/04/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Alamofire
import Foundation

internal enum RouteError: Error {
    case invalidURL
}

internal enum RouteAcceptType: String {
    case json = "application/json"
}

internal struct Route: URLRequestConvertible {
    private let method: HTTPMethod
    private let baseURL: String
    private let endpoint: String
    private let accessToken: String?
    private let query: Parameters?
    private let body: Parameters?
    private let parameters: Any?
    private let encoder: ParameterEncoding
    private let acceptType: RouteAcceptType
    
    // MARK: - Initializers
    
    init(method: HTTPMethod,
         baseURL: String,
         endpoint: String,
         accessToken: String? = nil,
         queryString: Parameters? = nil,
         body: Parameters? = nil,
         parameters: Any? = nil,
         encoder: ParameterEncoding = JSONEncoding.default,
         acceptType: RouteAcceptType = .json) {
        self.method = method
        self.baseURL = baseURL
        self.endpoint = endpoint
        self.accessToken = accessToken
        self.query = queryString
        self.body = body
        self.parameters = parameters
        self.encoder = encoder
        self.acceptType = acceptType
    }
}

extension Route {
    func asURLRequest() throws -> URLRequest {
        guard var url = URL(string: baseURL) else {
            throw RouteError.invalidURL
        }
        
        url = url.appendingPathComponent(endpoint)
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.timeoutInterval = 10
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(acceptType.rawValue, forHTTPHeaderField: "Accept")
        request.setValue("en", forHTTPHeaderField: "Content-Language")
        
        var queryString = query ?? [:]
        
        if let accessToken = self.accessToken {
            queryString["token"] = accessToken
        }
        
        if !queryString.isEmpty {
            request = try ArrayEncoding().encode(request, with: queryString)
        }
        
        if let body = body {
            request = try encoder.encode(request, with: body)
        }
        
        if let parameters = parameters, let encoder = encoder as? JSONEncoding {
            request = try encoder.encode(request, withJSONObject: parameters)
        }
        
        return request
    }
}
