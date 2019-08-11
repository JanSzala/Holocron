//
//  SpeciesViewController.swift
//  SWAPI_client
//
//  Created by GLaDOS on 19/06/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import UIKit

class SpeciesViewController: ListViewController {
    var speciesViewModel: SpeciesViewModelType {
        guard let viewModel = viewModel as? SpeciesViewModelType else {
            fatalError("ViewModel should be type of SpeciesViewModelType")
        }
        
        return viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupUI() {
        super.setupUI()
        title = speciesViewModel.controllerTitle
    }
}

extension SpeciesViewController {
    func viewModelWasSet(viewModel: SpeciesViewModelType) {
    }
}
