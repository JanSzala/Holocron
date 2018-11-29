//
//  ViewModelOwner.swift
//  SWAPI_client
//
//  Created by JanSzala on 29/11/2018.
//  Copyright © 2018 JanSzala. All rights reserved.
//

import Foundation
import UIKit

public protocol ViewModelOwner: class {
    associatedtype ViewModelType
    
    var viewModel: ViewModelType { get set }
    
    func viewModelWasSet(viewModel: ViewModelType)
}

private var viewModelKey: UInt8 = 0

/**
 Extension for UIViewController that associates viewModel with it, as assosciated type, not concrete class, using Objective C runtime.
 */

extension ViewModelOwner where Self: UIViewController {
    public var viewModel: ViewModelType {
        get {
            return associatedObject(object: self, key: &viewModelKey, constructor: { () -> ViewModelType in
                fatalError("viewModel has not yet been set")
            })
        }
        
        set {
            assertAssociatedObjectNil(object: self, key: &viewModelKey, type: ViewModelType.self, message: "viewModel has already been set")
            associateObject(object: self, key: &viewModelKey, value: newValue)
            viewModelWasSet(viewModel: newValue)
        }
    }
}
