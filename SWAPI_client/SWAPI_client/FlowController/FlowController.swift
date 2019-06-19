//
//  FlowController.swift
//  SWAPI_client
//
//  Created by JanSzala on 29/11/2018.
//  Copyright © 2018 JanSzala. All rights reserved.
//

import Foundation
import UIKit

internal class FlowController: NSObject, FlowControllerType {
    
    var rootViewController: UIViewController
    
    private(set) var navigationController: UINavigationController
    private(set) var dependencyContainer: DependencyContainerType
    
    private lazy var mainMenuViewController: MainMenuViewController = {
        let controller = dependencyContainer.mainMenuViewController
        
//        controller.viewModel.onTapped = { dataType, title in
//            self.showMainTable(dataType, title)
//        }
        
        controller.viewModel.onOptions = {
            self.showOptions()
        }
        
        controller.viewModel.onFilms = {
            self.showPeopleViewController()
        }
        
        controller.viewModel.onPeople = {
            self.showPeopleViewController()
        }
        
        controller.viewModel.onPlanets = {
            self.showPeopleViewController()
        }
        
        controller.viewModel.onSpecies = {
            self.showPeopleViewController()
        }
        
        controller.viewModel.onShips = {
            self.showPeopleViewController()
        }
        
        controller.viewModel.onVehicles = {
            self.showPeopleViewController()
        }
                
        return controller
    }()
    
    required init(dependencyContainer: DependencyContainerType, rootViewController: UIViewController, navigationController: UINavigationController) {
        self.dependencyContainer = dependencyContainer
        self.navigationController = navigationController
        self.rootViewController = rootViewController
        
        super.init()
        
        navigationController.viewControllers = [mainMenuViewController]
    }
}

extension FlowController {
    func showMainMenu() {
        navigationController.pushViewController(mainMenuViewController, animated: true)
    }
    
//    func showMainTable(_ dataType: DataType, _ title: String) {
//        let controller = dependencyContainer.mainTableViewController
//        controller.viewModel.dataType = dataType
//        controller.viewModel.controllerTitle = title
//
//        controller.viewModel.showDetails = { data, dataType in
//            self.showDetails(for: data, dataType: dataType)
//        }
//
//        navigationController.pushViewController(controller, animated: true)
//    }
    
    func showOptions() {
        let controller = dependencyContainer.optionsViewController
        
        navigationController.pushViewController(controller, animated: true)
    }
    
//    func showDetails(for data: Any, dataType: DataType) {
//        let controller = dependencyContainer.detailsViewController
//        controller.viewModel.dataType = dataType
//        controller.viewModel.data = data
//
//        navigationController.pushViewController(controller, animated: true)
//    }
    
    func showPeopleViewController() {
        let controller = dependencyContainer.peopleViewController
        
        controller.viewModel.showPersonDetails = { person in
            self.showPersonDetails(person: person)
        }
        
        navigationController.pushViewController(controller, animated: true)
    }
    
    func showPersonDetails(person: Person) {
        let viewModel = dependencyContainer.personViewModel(person: person)
        let controller = dependencyContainer.personViewController(with: viewModel)
        
        navigationController.pushViewController(controller, animated: true)
    }
}
