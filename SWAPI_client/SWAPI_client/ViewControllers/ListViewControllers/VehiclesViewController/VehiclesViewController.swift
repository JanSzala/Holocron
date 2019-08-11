//
//  VehiclesViewController.swift
//  SWAPI_client
//
//  Created by GLaDOS on 19/06/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import UIKit

class VehiclesViewController: ListViewController {
    var vehiclesViewModel: VehiclesViewModelType {
        guard let viewModel = viewModel as? VehiclesViewModelType else {
            fatalError("ViewModel should be type of VehiclesViewModelType")
        }
        
        return viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupUI() {
        super.setupUI()
        title = vehiclesViewModel.controllerTitle
    }
}

extension VehiclesViewController {
    func viewModelWasSet(viewModel: VehiclesViewModelType) {
    }
}
