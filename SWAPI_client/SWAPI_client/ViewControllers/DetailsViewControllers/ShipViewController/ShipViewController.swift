//
//  ShipViewController.swift
//  SWAPI_client
//
//  Created by GLaDOS on 20/06/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import LifetimeTracker
import UIKit

class ShipViewController: DetailsViewController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        trackLifetime()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension ShipViewController: LifetimeTrackable {
    static var lifetimeConfiguration = LifetimeConfiguration(maxCount: 1, groupName: "ShipDetails")
}

extension ShipViewController {
    func viewModelWasSet(viewModel: ShipViewModelType) {
    }
}
