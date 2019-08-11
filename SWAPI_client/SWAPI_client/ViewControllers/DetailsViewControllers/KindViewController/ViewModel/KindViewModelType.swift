//
//  KindViewModelType.swift
//  SWAPI_client
//
//  Created by GLaDOS on 20/06/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

protocol KindViewModelType: DetailsViewModelType {
    var controllerTitle: String { get }
    var numberOfRowsInSection: Int { get }
    var sectionsCount: Int { get }
    
    func sectionTitle(for index: Int) -> String
    func dataForRow(at indexPath: IndexPath) -> String
}
