
//
//  VehiclesViewModel.swift
//  SWAPI_client
//
//  Created by GLaDOS on 19/06/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import UIKit

class VehiclesViewModel: ListViewModel<Vehicle>, VehiclesViewModelType {
    var showDetails: ((Vehicle) -> ())?
    
    var controllerTitle: String = "Vehicles"
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
        return itemsArray[indexPath.row].name
    }
    
    override func fetchData(onSuccess: @escaping () -> (), onFailure: @escaping () -> (), noMoreData: @escaping () -> ()) {
        fetch.fetchData(type: DataType.Vehicles, onSuccess: { [weak self] (arrayOfData: [Vehicle]) in
            self?.itemsArray.append(contentsOf: arrayOfData)
            onSuccess()
            }, onFailure: onFailure, noMoreData: noMoreData)
    }
}
