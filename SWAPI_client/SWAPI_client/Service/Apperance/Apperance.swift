//
//  Apperance.swift
//  SWAPI_client
//
//  Created by JanSzala on 25/03/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation
import UIKit

internal protocol AppearanceConfigType {
    func applyDefault()
}

internal class AppearanceConfig: AppearanceConfigType {
    func applyDefault() {
        NavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.font: UIFont.dinCondensedBold(ofSize: 17)]
        
        NavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont.dinCondensedBold(ofSize: 30),
                                                               NSAttributedString.Key.kern: 0.16,
                                                               NSAttributedString.Key.foregroundColor: UIColor.purple
        ]

        UIBarButtonItem.appearance(whenContainedInInstancesOf:
            [NavigationBar.self]).setTitleTextAttributes([NSAttributedString.Key.font: UIFont.dinCondensedBold(ofSize: 17),
                                                          NSAttributedString.Key.foregroundColor: UIColor.purple],
                                                         for: UIControl.State.normal)

        UIBarButtonItem.appearance(whenContainedInInstancesOf:
            [NavigationBar.self]).setTitleTextAttributes([NSAttributedString.Key.font: UIFont.dinCondensedBold(ofSize: 17),
                                                          NSAttributedString.Key.foregroundColor: UIColor.purple],
                                                         for: UIControl.State.highlighted)
    }
}
