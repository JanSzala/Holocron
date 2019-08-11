//
//  ShipsViewController.swift
//  SWAPI_client
//
//  Created by GLaDOS on 19/06/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import UIKit

class ShipsViewController: ListViewController {
    var shipsViewModel: ShipsViewModelType {
        guard let viewModel = viewModel as? ShipsViewModelType else {
            fatalError("ViewModel should be type of ShipsViewModelType")
        }
        
        return viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupUI() {
        super.setupUI()
        title = shipsViewModel.controllerTitle
    }
}

extension ShipsViewController {
    func viewModelWasSet(viewModel: ShipsViewModelType) {
    }
}
