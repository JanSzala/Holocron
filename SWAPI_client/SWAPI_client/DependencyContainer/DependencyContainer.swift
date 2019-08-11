//
//  DependencyContainer.swift
//  SWAPI_client
//
//  Created by JanSzala on 29/11/2018.
//  Copyright © 2018 JanSzala. All rights reserved.
//

import Foundation
import UIKit

class DependencyContainer: DependencyContainerType {
    private lazy var navigationController = NavigationController(navigationBarClass: NavigationBar.self, toolbarClass: nil)
    
    private var rootViewController: UIViewController {
        return navigationController
    }
    
    lazy var flowController = FlowController(dependencyContainer: self, rootViewController: rootViewController, navigationController: navigationController)
    
    lazy var appearanceConfig: AppearanceConfigType = AppearanceConfig()
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
