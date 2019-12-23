//
//  PlanetsViewController.swift
//  SWAPI_client
//
//  Created by GLaDOS on 19/06/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import LifetimeTracker
import UIKit

class PlanetsViewController: ListViewController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: "ListViewController", bundle: nibBundleOrNil)
        
        trackLifetime()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
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

extension PlanetsViewController: LifetimeTrackable {
    static var lifetimeConfiguration = LifetimeConfiguration(maxCount: 1, groupName: "Planets")
}

extension PlanetsViewController {
    func viewModelWasSet(viewModel: PlanetsViewModelType) {
    }
}
