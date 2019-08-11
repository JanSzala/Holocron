//
//  FilmsViewController.swift
//  SWAPI_client
//
//  Created by GLaDOS on 19/06/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import UIKit

class FilmsViewController: ListViewController {
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

extension FilmsViewController {
    func viewModelWasSet(viewModel: FilmsViewModelType) {
    }
}
