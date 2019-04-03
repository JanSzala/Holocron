//
//  DependencyContainer.swift
//  SWAPI_client
//
//  Created by JanSzala on 29/11/2018.
//  Copyright © 2018 JanSzala. All rights reserved.
//

import Foundation
import UIKit

internal class DependencyContainer: DependencyContainerType {
    
    private lazy var navigationController = NavigationController(navigationBarClass: NavigationBar.self, toolbarClass: nil)
    
    private var rootViewController: UIViewController {
        return navigationController
    }
    
    lazy var flowController = FlowController(dependencyContainer: self, rootViewController: rootViewController, navigationController: navigationController)
    
    internal lazy var appearanceConfig: AppearanceConfigType = AppearanceConfig()
    
    private var apiService: APIServiceType {
        return APIService(baseURL: networkSettings.apiBaseURL)
    }
    
    private var apiParser: APIParserType {
        return APIParser()
    }
    
    internal var apiClient: APIClientType {
        return APIClient(apiService: apiService, apiParser: apiParser)
    }
    
    lazy var userClient: UserClientType = {
        return UserClient(with: apiClient)
    }()
    
    lazy private var networkSettings: NetworkSettingsType = {
        AppSettings()
    }()
}

// MARK: DependencyContainerViewControllers

extension DependencyContainer: DependencyContainerViewControllers {    
    var mainMenuViewController: MainMenuViewController {
        let controller = MainMenuViewController()
        controller.viewModel = MainMenuViewModel()
        return controller
    }
    
    var mainTableViewController: MainTableViewController {
        let controller = MainTableViewController()
        controller.viewModel = MainTableViewModel(userClient: userClient)
        return controller
    }
    
    var optionsViewController: OptionsViewController {
        let controller = OptionsViewController()
        controller.viewModel = OptionsViewModel()
        return controller
    }
    
    var detailsViewController: DetailsViewController {
        let controller = DetailsViewController()
        controller.viewModel = DetailsViewModel()
        return controller
    }
}
