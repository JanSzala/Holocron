//
//  ListViewModelType.swift
//  SWAPI_client
//
//  Created by JanSzala on 12/07/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

internal protocol ListViewModelType: class {
    var emptyListLabel: NSAttributedString { get }
    var numberOfSections: Int { get }
    
    func fetchData(onSuccess: @escaping () -> (), onFailure: @escaping () -> (), noMoreData: @escaping () -> ())
    func itemsArrayCount() -> Int
    func presentDetails(for indexPath: IndexPath)
    func title(for indexPath: IndexPath) -> String?
}
