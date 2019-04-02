//
//  AppSettings.swift
//  SWAPI_client
//
//  Created by JanSzala on 02/04/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

internal protocol NetworkSettingsType {
    var apiBaseURL: String { get }
}

internal class AppSettings: NetworkSettingsType {
    var apiBaseURL: String {
        return "https://swapi.co/api/"
    }
}
