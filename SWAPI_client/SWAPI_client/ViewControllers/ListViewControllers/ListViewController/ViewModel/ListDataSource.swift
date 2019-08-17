//
//  ListDataSource.swift
//  SWAPI_client
//
//  Created by GLaDOS on 17/08/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import UIKit

class ListDataSource: NSObject {
    private let viewModel: ListViewModelType
    var populateTable: (()->())?
    
    required init(viewModel: ListViewModelType, populateTable: @escaping (()->())) {
        self.viewModel = viewModel
        self.populateTable = populateTable
    }
}

extension ListDataSource: UITableViewDataSource, UITableViewDelegate {
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
            populateTable?()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.presentDetails(for: indexPath)
    }
}

extension ListDataSource {
    private func configure(cell: MainTableViewCell, indexPath: IndexPath) -> MainTableViewCell {
        cell.titleLabel.text = viewModel.title(for: indexPath)
        cell.backgroundColor = darkModeColor()
        cell.titleLabel.textColor = darkModeColor(reversedColors: true)
        return cell
    }
}
