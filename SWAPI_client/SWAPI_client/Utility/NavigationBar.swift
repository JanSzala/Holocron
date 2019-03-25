//
//  NavigationBar.swift
//  SWAPI_client
//
//  Created by JanSzala on 25/03/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation
import UIKit

public final class NavigationBar: UINavigationBar {
    // MARK: - Initializers
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configureNavigationBar()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureNavigationBar()
    }
}

extension NavigationBar {
    private func configureNavigationBar() {
        prefersLargeTitles = true
        isTranslucent = false
    }
}
