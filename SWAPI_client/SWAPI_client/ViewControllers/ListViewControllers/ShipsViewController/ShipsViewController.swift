//
//  ShipsViewController.swift
//  SWAPI_client
//
//  Created by GLaDOS on 19/06/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import LifetimeTracker
import UIKit

class ShipsViewController: ListViewController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        trackLifetime()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var shipsViewModel: ShipsViewModelType {
        guard let viewModel = viewModel as? ShipsViewModelType else {
            fatalError("ViewModel should be type of ShipsViewModelType")
        }
        
        return viewModel
    }
    
    override func setupUI() {
        super.setupUI()
        title = shipsViewModel.controllerTitle
    }
}

extension ShipsViewController: LifetimeTrackable {
    static var lifetimeConfiguration = LifetimeConfiguration(maxCount: 1, groupName: "Ships")
}

extension ShipsViewController {
    func viewModelWasSet(viewModel: ShipsViewModelType) {
    }
}
