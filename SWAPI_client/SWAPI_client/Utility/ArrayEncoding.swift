//
//  ArrayEncoding.swift
//  SWAPI_client
//
//  Created by JanSzala on 02/04/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Alamofire

internal struct ArrayEncoding: ParameterEncoding {
    let encoding: ParameterEncoding
    
    // MARK: - Initializers
    
    init(encoding: ParameterEncoding = URLEncoding()) {
        self.encoding = encoding
    }
    
    // MARK: - Other stuff
    
    func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        var request = try encoding.encode(urlRequest, with: parameters)
        
        guard let url = request.url else {
            return request
        }
        
        request.url = URL(string: url.absoluteString.replacingOccurrences(of: "%5B%5D=", with: "="))
        
        return request
    }
}
