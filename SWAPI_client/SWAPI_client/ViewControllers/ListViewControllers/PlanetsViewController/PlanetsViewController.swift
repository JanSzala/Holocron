//
//  PlanetsViewController.swift
//  SWAPI_client
//
//  Created by GLaDOS on 19/06/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import UIKit

class PlanetsViewController: ListViewController {
    var planetsViewModel: PlanetsViewModelType {
        guard let viewModel = viewModel as? PlanetsViewModelType else {
            fatalError("ViewModel should be type of PlanetsViewModelType")
        }
        
        return viewModel
    }
    
    override func setupUI() {
        super.setupUI()
        title = planetsViewModel.controllerTitle
    }
}

extension PlanetsViewController {
    func viewModelWasSet(viewModel: PlanetsViewModelType) {
    }
}
