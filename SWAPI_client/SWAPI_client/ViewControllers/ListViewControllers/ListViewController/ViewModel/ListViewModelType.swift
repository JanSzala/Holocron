//
//  ListViewModelType.swift
//  SWAPI_client
//
//  Created by JanSzala on 12/07/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

protocol ListViewModelType: class {
    var navBarAccessibilityId: String { get }
    var emptyListLabel: NSAttributedString { get }
    var numberOfSections: Int { get }
    var itemsArrayCount: Int { get }
    
    func fetchData(onSuccess: @escaping () -> (), onFailure: @escaping () -> (), noMoreData: @escaping () -> ())
    func presentDetails(for indexPath: IndexPath)
    func title(for indexPath: IndexPath) -> String?
}
