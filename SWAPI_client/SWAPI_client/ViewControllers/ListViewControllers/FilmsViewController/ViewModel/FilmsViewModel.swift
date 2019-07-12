//
//  FilmsViewModel.swift
//  SWAPI_client
//
//  Created by GLaDOS on 19/06/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import UIKit

internal class FilmsViewModel: ListViewModel {
    var showDetails: ((Film) -> ())?
    
    var controllerTitle: String = "Films"
    var currentPage: Int = 1
    var shouldFetchData: Bool = true
    var itemsArray = [Film]()
    
    override func itemsArrayCount() -> Int {
        return itemsArray.count
    }
        
    override func presentDetails(for indexPath: IndexPath) {
        showDetails?(itemsArray[indexPath.row])
    }
    
    override func title(for indexPath: IndexPath) -> String? {
        return itemsArray[indexPath.row].title
    }
    
    override func fetchData(onSuccess: @escaping () -> (), onFailure: @escaping () -> (), noMoreData: @escaping () -> ()) {
        guard shouldFetchData == true else {
            noMoreData()
            return
        }
        
        apiClient.getFilms(page: currentPage, onSuccess: { data in
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

