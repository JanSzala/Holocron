//
//  VehiclesViewController.swift
//  SWAPI_client
//
//  Created by GLaDOS on 19/06/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import UIKit

class VehiclesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var emptyListView: UIView!
    @IBOutlet weak var emptyListLabel: UILabel!
    
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
    
    private func deselectRow() {
        if let index = self.tableView.indexPathForSelectedRow {
            self.tableView.deselectRow(at: index, animated: true)
        }
    }
    
    private func populateTable() {
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
    
    private func setupUI() {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.prefersLargeTitles = true
        title = viewModel.controllerTitle
        emptyListView.isHidden = true
        emptyListLabel.attributedText = viewModel.emptyListLabel
    }
    
    private func setupTable() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
    }
    
    private func registerCells() {
        tableView.register(UINib(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: "mainTableViewCell")
    }
    
    private func configure(cell: MainTableViewCell, indexPath: IndexPath) -> MainTableViewCell {
        cell.titleLabel.text = viewModel.title(for: indexPath)
        cell.backgroundColor = darkModeColor()
        cell.titleLabel.textColor = darkModeColor(reversedColors: true)
        return cell
    }
}

extension VehiclesViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.itemsArrayCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: MainTableViewCell = tableView.dequeueReusableCell(withIdentifier: "mainTableViewCell") as? MainTableViewCell else {
            fatalError("Could not dequeue MainTableViewCell")
        }
        
        return configure(cell: cell, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 5 {
            populateTable()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.presentDetails(for: indexPath)
    }
}

extension VehiclesViewController: UITableViewDelegate {
}

extension VehiclesViewController: ViewModelOwner {
    func viewModelWasSet(viewModel: VehiclesViewModelType) {
    }
}
