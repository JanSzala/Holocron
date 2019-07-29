//
//  PeopleViewController.swift
//  SWAPI_client
//
//  Created by GLaDOS on 19/06/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import UIKit

class PeopleViewController: ListViewController {
    var peopleViewModel: PeopleViewModelType {
        guard let viewModel = viewModel as? PeopleViewModelType else {
            fatalError("ViewModel should be type of PeopleViewModelType")
        }
        
        return viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupUI() {
        super.setupUI()
        title = peopleViewModel.controllerTitle
    }
}

extension PeopleViewController {
    func viewModelWasSet(viewModel: PeopleViewModelType) {
    }
}
