
//
//  VehiclesViewModel.swift
//  SWAPI_client
//
//  Created by GLaDOS on 19/06/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import UIKit

internal class VehiclesViewModel: VehicleViewModelType {
    var showDetails: ((Vehicle) -> ())?
    
    var controllerTitle: String = "Vehicles"
    var currentPage: Int = 1
    var shouldFetchData: Bool = true
    var itemsArray = [Vehicle]()
    
    var itemsArrayCount: Int {
        return itemsArray.count
    }
    
    var emptyListLabel: NSAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: UIFont.dinCondensedBold(ofSize: 35),
                                                         NSAttributedString.Key.foregroundColor: UIColor.red]
        return NSAttributedString(string: "I couldn't download data", attributes: attributes)
    }
    
    let numberOfSections: Int = 1
    
    let apiClient: APIClientType
    
    init(apiClient: APIClientType) {
        self.apiClient = apiClient
    }
    
    func presentDetails(for indexPath: IndexPath) {
        showDetails?(itemsArray[indexPath.row])
    }
    
    func title(for indexPath: IndexPath) -> String? {
        return itemsArray[indexPath.row].name
    }
    
    func fetchData(onSuccess: @escaping () -> (), onFailure: @escaping () -> (), noMoreData: @escaping () -> ()) {
        guard shouldFetchData == true else {
            noMoreData()
            return
        }
        
        apiClient.getVehicles(page: currentPage, onSuccess: { data in
            self.currentPage += 1
            
            guard let arrayOfData = data.results else {
                fatalError("could not fill the array with results")
            }
            
            self.shouldFetchData = data.next != nil
            
            self.itemsArray.append(contentsOf: arrayOfData)
            onSuccess()
        }, onFailure: {
            logMsg("Failed fetching data")
            onFailure()
        })
    }
}

