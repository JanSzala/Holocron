//
//  TableViewCell.swift
//  SWAPI_client
//
//  Created by JanSzala on 09/03/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import UIKit

class BasicHeaderView: UITableViewHeaderFooterView {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var customSeparatorView: UIView!
    @IBOutlet weak var separatorHeightConstraint: NSLayoutConstraint!
}
