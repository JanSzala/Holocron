//
//  PlanetsViewModelType.swift
//  SWAPI_client
//
//  Created by GLaDOS on 19/06/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

protocol PlanetsViewModelType: ListViewModelType {
    var showDetails: ((Planet) -> ())? { get set }
    
    var controllerTitle: String { get set }
    var currentPage: Int { get }
    var shouldFetchData: Bool { get }
    
    func title(for indexPath: IndexPath) -> String?
    func presentDetails(for indexPath: IndexPath)
    func fetchData(onSuccess: @escaping () -> (), onFailure: @escaping () -> (), noMoreData: @escaping () -> ())
}
