//
//  DependencyContainerType.swift
//  SWAPI_client
//
//  Created by JanSzala on 29/11/2018.
//  Copyright © 2018 JanSzala. All rights reserved.
//

import Foundation

internal protocol DependencyContainerViewControllers {
    var mainMenuViewController: MainMenuViewController { get }
    var mainTableViewController: MainTableViewController { get }
    var optionsViewController: OptionsViewController { get }
    var detailsViewController: DetailsViewController { get }
    
    var apiClient: APIClientType { get }
    var userClient: UserClientType { get }
    var appearanceConfig: AppearanceConfigType { get }
}

internal protocol DependencyContainerType: DependencyContainerViewControllers {
}
