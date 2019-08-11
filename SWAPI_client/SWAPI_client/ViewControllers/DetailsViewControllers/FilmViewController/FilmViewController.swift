//
//  FilmViewController.swift
//  SWAPI_client
//
//  Created by GLaDOS on 20/06/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import UIKit

class FilmViewController: DetailsViewController {
    var filmViewModel: FilmViewModelType {
        guard let viewModel = viewModel as? FilmViewModelType else {
            fatalError("ViewModel should be type of FilmViewModelType")
        }
        
        return viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension FilmViewController {
    func viewModelWasSet(viewModel: FilmViewModelType) {
    }
}
