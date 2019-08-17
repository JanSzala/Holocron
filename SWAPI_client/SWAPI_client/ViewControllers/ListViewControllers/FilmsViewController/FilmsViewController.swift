//
//  FilmsViewController.swift
//  SWAPI_client
//
//  Created by GLaDOS on 19/06/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import LifetimeTracker
import UIKit

class FilmsViewController: ListViewController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: "ListViewController", bundle: nibBundleOrNil)
        
        trackLifetime()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var filmsViewModel: FilmsViewModelType {
        guard let viewModel = viewModel as? FilmsViewModelType else {
            fatalError("ViewModel should be type of FilmsViewModelType")
        }
        
        return viewModel
    }
    
    override func setupUI() {
        super.setupUI()
        title = filmsViewModel.controllerTitle
    }
}

extension FilmsViewController: LifetimeTrackable {
    static var lifetimeConfiguration = LifetimeConfiguration(maxCount: 1, groupName: "Films")
}

extension FilmsViewController {
    func viewModelWasSet(viewModel: FilmsViewModelType) {
    }
}
