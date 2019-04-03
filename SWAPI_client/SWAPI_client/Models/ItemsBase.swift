//
//  ItemsBase.swift
//  SWAPI_client
//
//  Created by JanSzala on 03/04/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

internal protocol ItemsBaseType {
    var count: Int { get }
    var next: String? { get }
    var previous: String? { get }
}
