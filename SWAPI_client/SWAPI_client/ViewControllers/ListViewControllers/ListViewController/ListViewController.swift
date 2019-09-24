//
//  ListViewController.swift
//  SWAPI_client
//
//  Created by JanSzala on 12/07/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var emptyListView: UIView!
    @IBOutlet weak var emptyListLabel: UILabel!
    
    private lazy var dataSource: ListDataSource = {
        ListDataSource(viewModel: viewModel, populateTable: { [unowned self] in
            self.populateTable()
        })
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTable()
        registerCells()
        populateTable()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.backgroundColor = self.darkModeColor()
        activityIndicator.color = darkModeColor(reversedColors: true)
        deselectRow()
    }
    
    func setupUI() {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.accessibilityIdentifier = viewModel.navBarAccessibilityId
        emptyListView.isHidden = true
        emptyListLabel.attributedText = viewModel.emptyListLabel
    }
}
extension ListViewController {
    func setupTable() {
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        tableView.tableFooterView = UIView()
    }
    
    func registerCells() {
        tableView.register(UINib(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: "mainTableViewCell")
    }
}

extension ListViewController {
    func deselectRow() {
        if let index = self.tableView.indexPathForSelectedRow {
            self.tableView.deselectRow(at: index, animated: true)
        }
    }
    
    func populateTable() {
        activityIndicator.startAnimating()
        viewModel.fetchData(onSuccess: {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.activityIndicator.stopAnimating()
                self.emptyListView.isHidden = true
            }
            logMsg("fetched data")
        }, onFailure: {
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                self.emptyListView.isHidden = false
            }
            logMsg("error during fetching data")
        }, noMoreData: {
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
            }
        })
    }
}

extension ListViewController: ViewModelOwner {
    func viewModelWasSet(viewModel: ListViewModelType) {
    }
}
