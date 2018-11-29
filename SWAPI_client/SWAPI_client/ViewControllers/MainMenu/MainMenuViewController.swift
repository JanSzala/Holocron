//
//  MainMenuViewController.swift
//  SWAPI_client
//
//  Created by JanSzala on 29/11/2018.
//  Copyright © 2018 JanSzala. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MainMenuViewController: ViewModelOwner {
    func viewModelWasSet(viewModel: MainMenuViewModelType) {
    }
}
