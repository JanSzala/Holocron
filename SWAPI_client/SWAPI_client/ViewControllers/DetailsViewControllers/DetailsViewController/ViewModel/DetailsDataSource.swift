//
//  DetailsDataSource.swift
//  SWAPI_client
//
//  Created by GLaDOS on 17/08/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import UIKit

class DetailsDataSource: NSObject {
    private let viewModel: DetailsViewModelType
    
    // MARK: - Initializers
    
    required init(viewModel: DetailsViewModelType) {
        self.viewModel = viewModel
    }
}

extension DetailsDataSource: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sectionsCount
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView: BasicHeaderView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "basicHeaderView") as? BasicHeaderView else {
            fatalError("Could not dequeue BasicHeaderView")
        }
        
        return configure(headerView, for: section)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return viewModel.heightForHeaderInSection
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNonzeroMagnitude
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
        cell.titleLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        
        return cell
    }
    
    private func configure(_ headerView: BasicHeaderView, for section: Int) -> BasicHeaderView {
        headerView.titleLabel.text = viewModel.sectionTitle(for: section)
        headerView.titleLabel.textColor = darkModeColor(reversedColors: true)
        headerView.titleLabel.font = UIFont.preferredFont(forTextStyle: .title2)
        
        if section == 0 {
            headerView.customSeparatorView.isHidden = true
        } else {
            headerView.customSeparatorView.isHidden = false
            headerView.customSeparatorView.backgroundColor = darkModeColor(reversedColors: true)
            headerView.separatorHeightConstraint.constant = 0.5
        }
        
        return headerView
    }
}
