//
//  ViewModel.swift
//  SWAPI_client
//
//  Created by JanSzala on 29/11/2018.
//  Copyright © 2018 JanSzala. All rights reserved.
//

import Foundation

/**
 Generic protocol for all view controller view models.
 Every instance have access to APIClient, UserManager and CoreDataClient.
 Every view model can communicate with flow controller through delegate.
 It shouldn't know how next/previous view controllers will be shown or have any connection to them.
 */

internal protocol ViewModel: class { }
