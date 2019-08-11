//
//  ListViewModel.swift
//  SWAPI_client
//
//  Created by JanSzala on 12/07/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation
import UIKit

class ListViewModel<T: Decodable>: ListViewModelType {
    var itemsArray = [T]()
    let apiClient: APIClientType
    
    init(apiClient: APIClientType) {
        self.apiClient = apiClient
    }
    
    let numberOfSections: Int = 1
    
    var emptyListLabel: NSAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: UIFont.dinCondensedBold(ofSize: 35),
                                                         NSAttributedString.Key.foregroundColor: UIColor.red]
        return NSAttributedString(string: "I couldn't download data", attributes: attributes)
    }
    
    var itemsArrayCount: Int {
        return itemsArray.count
    }
    
    func fetchData(onSuccess: @escaping () -> (), onFailure: @escaping () -> (), noMoreData: @escaping () -> ()) {
        fatalError("This function should be overriden")
    }
    
    func presentDetails(for indexPath: IndexPath) {
        fatalError("This function should be overriden")
    }
    
    func title(for indexPath: IndexPath) -> String? {
        fatalError("This function should be overriden")
    }
}
