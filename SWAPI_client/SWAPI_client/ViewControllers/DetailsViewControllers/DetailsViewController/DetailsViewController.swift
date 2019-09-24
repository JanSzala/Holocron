//
//  DetailsViewController.swift
//  SWAPI_client
//
//  Created by GLaDOS on 11/08/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private lazy var dataSource: DetailsDataSource = {
        DetailsDataSource(viewModel: viewModel)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTable()
        registerCells()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    private func setupTable() {
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        tableView.tableFooterView = UIView()
    }
    
    private func setupUI() {
        self.navigationController?.navigationBar.accessibilityIdentifier = viewModel.navBarAccessibilityId
        self.navigationItem.leftBarButtonItem?.accessibilityIdentifier = viewModel.leftItemAccessibilityId
        title = viewModel.controllerTitle
    }
    
    private func registerCells() {
        tableView.register(UINib(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: "mainTableViewCell")
        tableView.register(UINib(nibName: "BasicHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "basicHeaderView")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.backgroundColor = self.darkModeColor()
    }
}

extension DetailsViewController: ViewModelOwner {
    func viewModelWasSet(viewModel: DetailsViewModelType) {
    }
}
