//
//  PeopleViewModelType.swift
//  SWAPI_client
//
//  Created by GLaDOS on 19/06/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import UIKit

internal class PeopleViewModel: PeopleViewModelType {
    var showPersonDetails: ((Person) -> ())?
    
    var controllerTitle: String = "People"
    var currentPage: Int = 1
    var shouldFetchData: Bool = true
    var personArray = [Person]()
    
    var peopleArrayCount: Int {
        return personArray.count
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
        showPersonDetails?(personArray[indexPath.row])
    }
    
    func title(for indexPath: IndexPath) -> String? {
        return personArray[indexPath.row].name
    }
    
    func fetchData(onSuccess: @escaping () -> (), onFailure: @escaping () -> (), noMoreData: @escaping () -> ()) {
        guard shouldFetchData == true else {
            noMoreData()
            return
        }
        
        apiClient.getPeople(endPoint: .People, page: currentPage, onSuccess: { data in
            self.currentPage += 1
            
            guard let arrayOfData = data.results else {
                fatalError("could not fill the array with results")
            }
            
            self.shouldFetchData = data.next != nil
            
            self.personArray.append(contentsOf: arrayOfData)
            onSuccess()
        }, onFailure: {
            logMsg("Failed fetching data")
            onFailure()
        })
    }
}
