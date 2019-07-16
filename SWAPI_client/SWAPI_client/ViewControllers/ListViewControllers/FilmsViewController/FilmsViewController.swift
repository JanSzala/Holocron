//
//  FilmsViewController.swift
//  SWAPI_client
//
//  Created by GLaDOS on 19/06/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import UIKit

class FilmsViewController: ListViewController {
//    @IBOutlet weak var tableView: UITableView!
//    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
//    @IBOutlet weak var emptyListView: UIView!
//    @IBOutlet weak var emptyListLabel: UILabel!
    
    var filmsViewModel: FilmsViewModelType {
        guard let viewModel = viewModel as? FilmsViewModelType else {
            fatalError("ViewModel should be type of FilmsViewModelType")
        }

        return viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupUI() {
        super.setupUI()
        title = "Films" //filmsViewModel.controllerTitle
    }
}

extension FilmsViewController {
    func viewModelWasSet(viewModel: FilmsViewModelType) {
        
    }
}
