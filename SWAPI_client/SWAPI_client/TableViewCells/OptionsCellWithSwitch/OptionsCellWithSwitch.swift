//
//  OptionsCellWithSwitch.swift
//  SWAPI_client
//
//  Created by JanSzala on 09/02/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import UIKit

class OptionsCellWithSwitch: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var switchButton: UISwitch!
    
    var onSwitch: () -> () = {
    }
    
    @IBAction func onSwitch(_ sender: UISwitch) {
        onSwitch()
    }
}
