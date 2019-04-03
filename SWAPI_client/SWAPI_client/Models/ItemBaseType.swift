//
//  ItemBaseType.swift
//  SWAPI_client
//
//  Created by JanSzala on 03/04/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

internal protocol ItemBaseType {
    var name: String { get }
    var url: String { get }
    var created: String { get }
    var edited: String { get }
}
