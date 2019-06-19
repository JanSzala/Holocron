//
//  PeopleViewModel.swift
//  SWAPI_client
//
//  Created by GLaDOS on 19/06/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

internal protocol PeopleViewModelType: class {
    var showPersonDetails: ((Person) -> ())? { get set }
    
    var controllerTitle: String { get set }
    var currentPage: Int { get }
    var shouldFetchData: Bool { get }
    var peopleArrayCount: Int { get }
    var numberOfSections: Int { get }
    var emptyListLabel: NSAttributedString { get }
    
    func title(for indexPath: IndexPath) -> String?
    func presentDetails(for indexPath: IndexPath)
    func fetchData(onSuccess: @escaping () -> (), onFailure: @escaping () -> (), noMoreData: @escaping () -> ())
}
