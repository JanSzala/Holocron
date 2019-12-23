//
//  SpeciesViewController.swift
//  SWAPI_client
//
//  Created by GLaDOS on 19/06/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import LifetimeTracker
import UIKit

class SpeciesViewController: ListViewController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: "ListViewController", bundle: nibBundleOrNil)
        
        trackLifetime()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var speciesViewModel: SpeciesViewModelType {
        guard let viewModel = viewModel as? SpeciesViewModelType else {
            fatalError("ViewModel should be type of SpeciesViewModelType")
        }
        
        return viewModel
    }
    
    override func setupUI() {
        super.setupUI()
        
        title = speciesViewModel.controllerTitle
    }
}

extension SpeciesViewController: LifetimeTrackable {
    static var lifetimeConfiguration = LifetimeConfiguration(maxCount: 1, groupName: "Species")
}

extension SpeciesViewController {
    func viewModelWasSet(viewModel: SpeciesViewModelType) {
    }
}
