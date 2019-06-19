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
}

extension DependencyContainer {
    var apiClient: APIClientType {
        return APIClient(apiParser: apiParser, router: router, urlSessionCreator: urlSessionCreator)
    }
    
    var apiParser: APIParserType {
        return APIParser()
    }
    
    var router: RouterType {
        return Router()
    }
    
    var urlSessionCreator: URLSessionCreatorType {
        return URLSessionCreator()
    }
}

extension DependencyContainer {
    var mainMenuViewController: MainMenuViewController {
        let controller = MainMenuViewController()
        controller.viewModel = MainMenuViewModel()
        return controller
    }
    
    var mainTableViewController: MainTableViewController {
        let controller = MainTableViewController()
        controller.viewModel = MainTableViewModel(apiClient: apiClient)
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
    
    var peopleViewController: PeopleViewController {
        let controller = PeopleViewController()
        controller.viewModel = PeopleViewModel(apiClient: apiClient)
        return controller
    }
    
    func personViewController(with viewModel: PersonViewModelType) -> PersonViewController {
        let viewController = PersonViewController()
        viewController.viewModel = viewModel
        
        return viewController
    }
}

extension DependencyContainer {
    func personViewModel(person: Person) -> PersonViewModelType {
        return PersonViewModel(person: person)
    }
}
