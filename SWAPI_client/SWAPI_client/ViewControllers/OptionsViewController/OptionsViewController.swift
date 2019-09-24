//
//  OptionsViewController.swift
//  SWAPI_client
//
//  Created by JanSzala on 09/02/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import LifetimeTracker
import UIKit

class OptionsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        trackLifetime()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupTable()
        registerCells()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.backgroundColor = self.darkModeColor()
    }
    
    private func setupUI() {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.accessibilityIdentifier = viewModel.navBarAccessibilityId
        title = viewModel.controllerTitle
    }
    
    private func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
    }
    
    private func registerCells() {
        tableView.register(UINib(nibName: "OptionsCellWithSwitch", bundle: nil), forCellReuseIdentifier: "OptionsCellWithSwitch")
    }
    
    private func configure(cell: OptionsCellWithSwitch, indexPath: IndexPath) -> OptionsCellWithSwitch {
        cell.switchButton.isOn = viewModel.isDarkMode()
        cell.titleLabel.text = viewModel.option(for: indexPath)
        cell.titleLabel.textColor = self.darkModeColor(reversedColors: true)
        cell.backgroundColor = self.darkModeColor()
        cell.selectionStyle = .none
        
        cell.onSwitch = { [unowned self] in
            self.viewModel.onDarkModeSwitchTapped()
            self.tableView.backgroundColor = self.darkModeColor()
            cell.backgroundColor = self.darkModeColor()
            cell.titleLabel.textColor = self.darkModeColor(reversedColors: true)
            self.tableView.reloadData()
        }
        
        return cell
    }
}

extension OptionsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: OptionsCellWithSwitch = tableView.dequeueReusableCell(withIdentifier: "OptionsCellWithSwitch") as? OptionsCellWithSwitch else {
            fatalError("Could not dequeue OptionsCellWithSwitch")
        }
        
        return configure(cell: cell, indexPath: indexPath)
    }
}

extension OptionsViewController: LifetimeTrackable {
    static var lifetimeConfiguration = LifetimeConfiguration(maxCount: 1, groupName: "Options")
}

extension OptionsViewController: ViewModelOwner {
    func viewModelWasSet(viewModel: OptionsViewModelType) {
    }
}
