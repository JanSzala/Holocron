//
//  DetailsViewModel.swift
//  SWAPI_client
//
//  Created by GLaDOS on 11/08/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

class DetailsViewModel<T: Decodable>: DetailsViewModelType {
    var controllerTitle: String
    
    var dataArray = [String]()
    
    let numberOfRowsInSection: Int = 1
    
    var sectionsCount: Int {
        return dataSectionTitles.count
    }
    
    init(controllerTitle: String) {
        self.controllerTitle = controllerTitle
    }
    
    var dataSectionTitles: [String] {
        fatalError("This should be overriden")
    }
    
    func updateSections(for item: T) {
        fatalError("This should be overriden")
    }
}

extension DetailsViewModel {
    func dataForRow(at indexPath: IndexPath) -> String {
        return dataArray[indexPath.section]
    }
    
    func sectionTitle(for index: Int) -> String {
        return dataSectionTitles[index]
    }
}
