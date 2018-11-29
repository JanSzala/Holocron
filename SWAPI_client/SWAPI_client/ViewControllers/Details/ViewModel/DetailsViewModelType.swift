//
//  DetailsViewModelType.swift
//  SWAPI_client
//
//  Created by JanSzala on 12/02/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

internal protocol DetailsViewModelType: class {
    var data: Any { get set }
    var dataType: dataType { get set }
    var controllerTitle: String { get }
    var numberOfRowsInSection: Int { get }
    
    var sectionsCount: Int { get }
    func sectionTitle(for index: Int) -> String
    func dataForRow(at indexPath: IndexPath) -> String

}
