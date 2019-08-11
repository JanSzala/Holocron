//
//  FetchData.swift
//  SWAPI_client
//
//  Created by JanSzala on 16/07/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

class FetchData {
    var currentPage: Int = 1
    var shouldFetchData: Bool = true
    var apiClient: APIClientType
    
    init(apiClient: APIClientType) {
        self.apiClient = apiClient
    }
    
    func fetchData<T: Decodable>(type: DataType, onSuccess: @escaping ([T]) -> (), onFailure: @escaping () -> (), noMoreData: @escaping () -> ()) {
        guard shouldFetchData == true else {
            noMoreData()
            return
        }
        
        apiClient.getData(page: currentPage, type: type, onSuccess: { [weak self] (data: PageBase<T>) in
            self?.currentPage += 1
            
            guard let arrayOfData = data.results else {
                fatalError("could not fill the array with results")
            }
            
            self?.shouldFetchData = data.next != nil
            onSuccess(arrayOfData)
        }, onFailure: {
            logMsg("Failed fetching data")
            onFailure()
        })
    }
}
