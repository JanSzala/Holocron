//
//  UserDefaults+IsFirstLaunch.swift
//  SWAPI_client
//
//  Created by JanSzala on 11/02/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

extension UserDefaults {
    static func isFirstLaunch() -> Bool {
        let isFirstLaunch = !UserDefaults.standard.bool(forKey: "hasBeenLaunchedBeforeFlag")
        if (isFirstLaunch) {
            UserDefaults.standard.set(true, forKey: "hasBeenLaunchedBeforeFlag")
        }
        return isFirstLaunch
    }
}
