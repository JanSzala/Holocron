//
//  DependencyContainerType.swift
//  SWAPI_client
//
//  Created by JanSzala on 29/11/2018.
//  Copyright © 2018 JanSzala. All rights reserved.
//

import Foundation

internal protocol DependencyContainerType {
    var mainMenuViewController: MainMenuViewController { get }
    var mainTableViewController: MainTableViewController { get }
    var optionsViewController: OptionsViewController { get }
    var detailsViewController: DetailsViewController { get }
    
    var peopleViewController: PeopleViewController { get }
    
    func personViewController(with viewModel: PersonViewModelType) -> PersonViewController
    func personViewModel(person: Person) -> PersonViewModelType
    
    var apiClient: APIClientType { get }
    
    var appearanceConfig: AppearanceConfigType { get }
}
