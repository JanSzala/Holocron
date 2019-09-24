//
//  Apperance.swift
//  SWAPI_client
//
//  Created by JanSzala on 25/03/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation
import UIKit

protocol AppearanceConfigType {
    func applyDefault()
}

class AppearanceConfig: AppearanceConfigType {
    func applyDefault() {
        NavigationBar.appearance().tintColor = UIColor.black
        NavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont.dinCondensedBold(ofSize: 50),
                                                               NSAttributedString.Key.kern: 2.0,
                                                               NSAttributedString.Key.foregroundColor: UIColor.black
        ]

        UIBarButtonItem.appearance(whenContainedInInstancesOf:
            [NavigationBar.self]).setTitleTextAttributes([NSAttributedString.Key.font: UIFont.dinCondensedBold(ofSize: 17),
                                                          NSAttributedString.Key.foregroundColor: UIColor.black],
                                                         for: UIControl.State.normal)

        UIBarButtonItem.appearance(whenContainedInInstancesOf:
            [NavigationBar.self]).setTitleTextAttributes([NSAttributedString.Key.font: UIFont.dinCondensedBold(ofSize: 17),
                                                          NSAttributedString.Key.foregroundColor: UIColor.black],
                                                         for: UIControl.State.highlighted)
    }
}
