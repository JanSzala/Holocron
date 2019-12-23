//
//  PeopleViewController.swift
//  SWAPI_client
//
//  Created by GLaDOS on 19/06/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import LifetimeTracker
import UIKit

class PeopleViewController: ListViewController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: "ListViewController", bundle: nibBundleOrNil)
        
        trackLifetime()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var peopleViewModel: PeopleViewModelType {
        guard let viewModel = viewModel as? PeopleViewModelType else {
            fatalError("ViewModel should be type of PeopleViewModelType")
        }
        
        return viewModel
    }
    
    override func setupUI() {
        super.setupUI()
        
        title = peopleViewModel.controllerTitle
    }
}

extension PeopleViewController: LifetimeTrackable {
    static var lifetimeConfiguration = LifetimeConfiguration(maxCount: 1, groupName: "People")
}

extension PeopleViewController {
    func viewModelWasSet(viewModel: PeopleViewModelType) {
    }
}
