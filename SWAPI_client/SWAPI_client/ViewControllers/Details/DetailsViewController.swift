//
//  DetailsViewController.swift
//  SWAPI_client
//
//  Created by JanSzala on 12/02/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import UIKit

internal class DetailsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTable()
        registerCells()
        setupUI()
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

extension DetailsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sectionsCount
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header: BasicHeaderView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "basicHeaderView") as? BasicHeaderView else {
            fatalError("Could not dequeue BasicHeaderView")
        }
        
        header.titleLabel.text = viewModel.sectionTitle(for: section)
        header.titleLabel.textColor = darkModeColor(reversedColors: true)
        
        return header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: MainTableViewCell = tableView.dequeueReusableCell(withIdentifier: "mainTableViewCell") as? MainTableViewCell else {
            fatalError("Could not dequeue MainTableViewCell")
        }
        
        cell.titleLabel.text = viewModel.dataForRow(at: indexPath)
        cell.backgroundColor = darkModeColor()
        cell.titleLabel.textColor = darkModeColor(reversedColors: true)
        cell.isUserInteractionEnabled = false
        
        return cell
    }
}

extension DetailsViewController: UITableViewDelegate {
}

extension DetailsViewController: ViewModelOwner {
    func viewModelWasSet(viewModel: DetailsViewModelType) {
    }
}
