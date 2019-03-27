//
//  MainTableViewModelType.swift
//  SWAPI_client
//
//  Created by JanSzala on 12/01/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

internal protocol MainTableViewModelType: class {
    var showDetails: ((Any, DataType) -> ())? { get set }
    
    var dataType: DataType { get set }
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
