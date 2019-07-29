//
//  FilmsViewModel.swift
//  SWAPI_client
//
//  Created by GLaDOS on 19/06/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import UIKit

class FilmsViewModel: ListViewModel<Film>, FilmsViewModelType {
    var showDetails: ((Film) -> ())?
    
    var controllerTitle: String = "Films"
    var currentPage: Int = 1
    var shouldFetchData: Bool = true
    
    var fetch: FetchData
    
    override init(apiClient: APIClientType) {
        fetch = FetchData(apiClient: apiClient)
        super.init(apiClient: apiClient)
    }
    
    override func presentDetails(for indexPath: IndexPath) {
        showDetails?(itemsArray[indexPath.row])
    }
    
    override func title(for indexPath: IndexPath) -> String? {
        return itemsArray[indexPath.row].title
    }
    
    override func fetchData(onSuccess: @escaping () -> (), onFailure: @escaping () -> (), noMoreData: @escaping () -> ()) {
        fetch.fetchData(type: DataType.Films, onSuccess: { [weak self] (arrayOfData: [Film]) in
            self?.itemsArray.append(contentsOf: arrayOfData)
            onSuccess()
        }, onFailure: onFailure, noMoreData: noMoreData)
    }
}

