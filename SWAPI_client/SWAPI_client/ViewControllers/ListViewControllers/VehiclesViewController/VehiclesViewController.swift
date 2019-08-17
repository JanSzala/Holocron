//
//  VehiclesViewController.swift
//  SWAPI_client
//
//  Created by GLaDOS on 19/06/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import LifetimeTracker
import UIKit

class VehiclesViewController: ListViewController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: "ListViewController", bundle: nibBundleOrNil)
        
        trackLifetime()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var vehiclesViewModel: VehiclesViewModelType {
        guard let viewModel = viewModel as? VehiclesViewModelType else {
            fatalError("ViewModel should be type of VehiclesViewModelType")
        }
        
        return viewModel
    }
    
    override func setupUI() {
        super.setupUI()
        title = vehiclesViewModel.controllerTitle
    }
}

extension VehiclesViewController: LifetimeTrackable {
    static var lifetimeConfiguration = LifetimeConfiguration(maxCount: 1, groupName: "Vehicles")
}

extension VehiclesViewController {
    func viewModelWasSet(viewModel: VehiclesViewModelType) {
    }
}
