//
//  ShipViewController.swift
//  SWAPI_client
//
//  Created by GLaDOS on 20/06/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import UIKit

class ShipViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
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
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
    }
    
    private func setupUI() {
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

extension ShipViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sectionsCount
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header: BasicHeaderView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "basicHeaderView") as? BasicHeaderView else {
            fatalError("Could not dequeue BasicHeaderView")
        }
        
        header.titleLabel.text = viewModel.sectionTitle(for: section)
        header.titleLabel.textColor = darkModeColor(reversedColors: true)
        
        return header
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: MainTableViewCell = tableView.dequeueReusableCell(withIdentifier: "mainTableViewCell") as? MainTableViewCell else {
            fatalError("Could not dequeue MainTableViewCell")
        }
        
        return configure(cell, for: indexPath)
    }
    
    private func configure(_ cell: MainTableViewCell, for indexPath: IndexPath) -> MainTableViewCell {
        cell.titleLabel.text = viewModel.dataForRow(at: indexPath)
        cell.backgroundColor = darkModeColor()
        cell.titleLabel.textColor = darkModeColor(reversedColors: true)
        cell.isUserInteractionEnabled = false
        
        return cell
    }
}

extension ShipViewController: UITableViewDelegate {
}

extension ShipViewController: ViewModelOwner {
    func viewModelWasSet(viewModel: ShipViewModelType) {
    }
}
