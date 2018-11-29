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
}

internal protocol DependencyContainerType: DependencyContainerViewControllers {
}
